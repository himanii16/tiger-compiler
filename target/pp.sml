structure pp :
    sig val compile : Ast.program -> string end =
struct

fun compile (program) = 

let fun space  0 = ""
      | space  n = (" "^(space (n-1))) 

    val indent = ref 0 
    fun inc_indent () = let val _ = (indent := !indent + 4) in "" end
    fun dec_indent () = let val _ = (indent := !indent - 4) in "" end

    fun red t  = "\027[1;31m" ^ t ^ "\027[0m"
    fun blue t  = "\027[1;34m" ^ t ^ "\027[0m" 
    fun black t = "\027[1;30m" ^ t ^ "\027[0m" 
    fun green t = "\027[1;32m" ^ t ^ "\027[0m" 
    fun yellow t = "\027[1;33m" ^ t ^ "\027[0m" 
    fun magenta t = "\027[1;35m" ^ t ^ "\027[0m" 
    fun cyan t = "\027[1;36m" ^ t ^ "\027[0m" 
    fun grey t = "\027[1;90m" ^ t ^ "\027[0m" 
    fun pink t = "\027[91m" ^ t ^ "\027[0m" 
    fun lblue t = "\027[1;94m" ^ t ^ "\027[0m" 
    
    fun exp (Ast.Nil)                                       = "nil" 
      | exp (Ast.StringConst s)                             = pink s 
      | exp (Ast.IntConst i)                                = lblue (Int.toString i) 
      | exp (Ast.Lvalue v)                                  = var (v) 
      | exp (Ast.BinOpExp{left,oper,right})                 = exp left ^ " " ^ red (operator oper) ^ " " ^ exp right
      | exp (Ast.FuncCall{func_id,fun_args})                = func_id ^ "(" ^ args(fun_args) ^ ")"
      | exp (Ast.ArrExp{arr_id,arr_size,first_i})           = arr_id ^ " [" ^ exp(arr_size) ^ "] " ^blue "of " ^ exp(first_i) 
      | exp (Ast.SeqExp el)                                 = "(\n" ^ seq (el) ^ "\n" ^ space(!indent) ^ ")"
      | exp (Ast.RecordExp{record_id,field_elem})           = record_id ^ " {" ^ rec_args(field_elem) ^ "}"
      | exp (Ast.AssignExp {assign_var,assignment})         = var(assign_var) ^ magenta " := " ^ exp(assignment) 
      | exp (Ast.NegativeExp e)                             = "-" ^ exp(e) 
      | exp (Ast.IfExp{if_cond,body_if,otherwise})          = blue "if " ^ exp(if_cond) ^ blue " then\n"^ inc_indent() ^ space (!indent) ^ exp(body_if) ^ "\n" ^ dec_indent() 
                                                              ^ space(!indent) ^ blue "else\n" ^ inc_indent()^ space(!indent) ^ exp(otherwise) ^ dec_indent()
      | exp (Ast.IfThenExp{ifthen_cond,body_ifthen})        = blue "if " ^ exp(ifthen_cond) ^ blue " then\n" ^ inc_indent() ^ space (!indent) ^ exp(body_ifthen) ^ dec_indent()
      | exp (Ast.WhileExp{test_cond,body_while})            = blue "while " ^ exp(test_cond) ^ blue " do \n"^ inc_indent() ^ space (!indent) ^ exp(body_while) ^ dec_indent()
      | exp (Ast.ForExp{for_id,first_e,final_e,body_for})   = blue "for " ^ for_id ^ magenta " := " ^ exp(first_e) ^ blue " to " ^ exp(final_e) ^ inc_indent() ^ "\n" ^ space (!indent)
                                                              ^ blue "do \n" ^ inc_indent() ^ space (!indent) ^ exp(body_for) ^ dec_indent() ^ dec_indent()
      | exp (Ast.BreakExp)                                  = lblue "break" 
      | exp (Ast.LetExp{decl,body_expr})                    = magenta "let\n" ^ inc_indent() ^ decs(decl) ^ dec_indent() ^ space (!indent)^ magenta "in\n" 
                                                              ^ inc_indent() ^ space(!indent) ^ exp(body_expr) ^ dec_indent() ^ "\n" ^ space (!indent) ^ magenta "end\n" 

    and dec (Ast.TypeDec tl) = type_dec(tl) ^ "\n"
      | dec (Ast.FuncDec fl) = func_dec(fl) ^ "\n"
      | dec (Ast.VarDec vl)  = space (!indent) ^ green "var " ^ var_dec(vl) ^ "\n" 
    
    and decs ([])         = ""
      | decs ([d])      = dec (d)
      | decs (d::dl)    = dec (d) ^ decs (dl)

    and operator Ast.Mul   = "*"
      | operator Ast.Div   = "/"
      | operator Ast.Plus  = "+"
      | operator Ast.Minus = "-"
      | operator Ast.GEQ   = ">="
      | operator Ast.LEQ   = "<="
      | operator Ast.EQ    = "="
      | operator Ast.NEQ   = "<>"
      | operator Ast.GT    = ">"
      | operator Ast.LT    = "<"
      | operator Ast.AND   = "&"
      | operator Ast.OR    = "|"

    and var (Ast.SimpleVar (i:Ast.id)) = i 
      | var (Ast.FieldVar (v,v1))  = (var (v)) ^ "." ^ (var(v1))
      | var (Ast.ArrVar (i:Ast.id, e)) = i ^ "[" ^ (exp (e)) ^ "]" 

    and args []  = "" 
      | args [e] = exp (e)
      | args (e::el) = exp (e) ^ ", " ^ args(el) 

    and seq []  = "" 
      | seq [e] = space(!indent) ^ exp (e) 
      | seq (e::el) = space (!indent) ^ exp (e) ^ "; \n" ^ seq(el) 

    and rec_args []  = "" 
      | rec_args [(i,e)] = i ^ " = " ^ exp(e) 
      | rec_args (e::el) = rec_args([e]) ^ ", " ^ rec_args(el) 

    and type_dec [(i:Ast.id,t)] = space (!indent) ^ green "type " ^ i ^ magenta " = " ^ ty(t)
      | type_dec (t :: tdl) = type_dec([t]) ^ "\n" ^ type_dec (tdl)
      | type_dec []         = ""                

    and ty (Ast.alias i) = i 
      | ty (Ast.record l) = "{" ^ tyfield(l) ^ "}"
      | ty (Ast.arr i)  = "array" ^ blue" of " ^ black i 
    
    and tyfield []  =  ""
      | tyfield [(i:Ast.id,NONE)] = i 
      | tyfield [(i:Ast.id,SOME(ti))] = i ^ ":" ^ black ti
      | tyfield (t::til) = tyfield([t]) ^", " ^ tyfield(til)

    and func_dec ([Ast.Funcf{funcf_id,fun_args,result_type=NONE,funcf_body}])    = space (!indent) ^ cyan "function " ^ yellow funcf_id ^ "(" ^ tyfield(fun_args) ^ ")" ^magenta " = \n" 
                                                                                ^ inc_indent() ^ space (!indent) ^ exp(funcf_body) ^ dec_indent() 
      | func_dec ([Ast.Funcf{funcf_id,fun_args,result_type=SOME(s),funcf_body}]) = space (!indent) ^ cyan "function " ^ yellow funcf_id ^ "(" ^ tyfield(fun_args) ^ "):" ^ black s ^ magenta " = \n" 
                                                                                ^ inc_indent() ^ space (!indent) ^ exp(funcf_body) ^ dec_indent() 
      | func_dec (fd::fdl) = func_dec([fd]) ^ "\n\n" ^ func_dec(fdl)  
      | func_dec []   = ""

    and var_dec (Ast.Varf{varf_id,varf_ty=NONE,varf_first})    = varf_id ^ magenta " := " ^ exp(varf_first)
      | var_dec (Ast.Varf{varf_id,varf_ty=SOME(s),varf_first}) = varf_id ^ ":" ^ black s ^ magenta " := " ^ exp(varf_first) 

    and pri (Ast.Expression e)   = exp (e)

in     
    pri (program)
end

end