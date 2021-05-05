(* Ex - expression Tree.exp
   Nx - statements Tree.stm [no result]
   Cx - Conditional (Takes a label-pair (true-destination and false destination)
        and generates a stmt that evaluates conditions and jumps to one of the destination)*)

signature TRANSLATE =
sig

    datatype exp = Ex of Tree.expr 
                 | Nx of Tree.stmt  
                 | Cx of Temp.label * Temp.label -> Tree.stmt 

    val unEx : exp -> Tree.expr 
    val unNx : exp -> Tree.stmt  
    val unCx : exp -> (Temp.label * Temp.label -> Tree.stmt) 

    val translate : Ast.program -> Tree.stmt

end


structure Translate : TRANSLATE = 
struct 

    exception Error of string
    exception Unsupported of string
    
    structure T = Tree
    structure A = Ast 

    datatype exp = Ex of T.expr 
                 | Nx of T.stmt 
                 | Cx of Temp.label * Temp.label -> T.stmt 
                         (* ----- genstmt ---- *)

    fun seqstmt []  = raise Error "not allowed"
      | seqstmt [s] = s 
      | seqstmt (s::sl) = T.SEQ(s,seqstmt sl)

    fun unEx (Ex e) = e 
      | unEx (Nx s) = T.ESEQ(s,T.CONST 0)
      | unEx (Cx genstmt) = let val r = Temp.newtemp() 
                                val t = Temp.newlabel()  (*true*)
                                val f = Temp.newlabel()  (*false*)
                            in 
                                T.ESEQ(seqstmt[T.MOVE(T.TEMP r, T.CONST 1),
                                                genstmt(t,f), 
                                                T.LABEL f,
                                                T.MOVE(T.TEMP r, T.CONST 0),
                                                T.LABEL t], T.TEMP r) 
                            end

    fun unNx (Nx s) = s
      | unNx (Ex e) = T.EXP (e)
      | unNx (Cx c) = T.EXP (unEx(Cx c))

    fun unCx (Cx c) = c 
      | unCx (Ex e) = (fn (t,f) => T.CJUMP(T.NEQ, e, T.CONST 0, t,f)) 
      | unCx (Nx s) = raise Error "Program not well typed" (*will never occur in compiling a well-typed Tiger Program*)
    
    fun translate (prog) = 
    let 
      fun t_exp (Ast.Nil) env                                       = Ex (T.CONST 0)
        | t_exp (Ast.StringConst s) env                             = raise Unsupported "Not yet supported"
        | t_exp (Ast.IntConst i) env                                = Ex (T.CONST i)
        | t_exp (Ast.Lvalue v) env                                  = raise Unsupported "Not yet supported"
        | t_exp (Ast.BinOpExp{left,oper,right}) env                 = let val l       = unEx (t_exp left env)
                                                                          val r       = unEx (t_exp right env) 
                                                                          val exp_op  = case oper of 
                                                                            Ast.Plus  => Ex (T.BINOP (T.PLUS, l, r))
                                                                          | Ast.Minus => Ex (T.BINOP (T.MINUS, l, r))
                                                                          | Ast.Mul   => Ex (T.BINOP (T.MUL, l, r))
                                                                          | Ast.Div   => Ex (T.BINOP (T.DIV, l, r))
                                                                          | Ast.AND   => Ex (T.BINOP (T.AND, l, r))
                                                                          | Ast.OR    => Ex (T.BINOP (T.OR, l, r))
                                                                          | Ast.EQ    => Cx (fn (t,f) => T.CJUMP (T.EQ, l, r, t,f))
                                                                          | Ast.NEQ   => Cx (fn (t,f) => T.CJUMP (T.NEQ, l, r, t,f))
                                                                          | Ast.GT    => Cx (fn (t,f) => T.CJUMP (T.GT, l, r, t,f)) 
                                                                          | Ast.LT    => Cx (fn (t,f) => T.CJUMP (T.LT, l, r, t,f)) 
                                                                          | Ast.GEQ   => Cx (fn (t,f) => T.CJUMP (T.GEQ, l, r, t,f)) 
                                                                          | Ast.LEQ   => Cx (fn (t,f) => T.CJUMP (T.LEQ, l, r, t,f)) 
                                                                      in 
                                                                          exp_op
                                                                      end 
        | t_exp (Ast.FuncCall{func_id,fun_args}) env                = raise Unsupported "Not yet supported"
        | t_exp (Ast.ArrExp{arr_id,arr_size,first_i}) env           = raise Unsupported "Not yet supported"
        | t_exp (Ast.SeqExp el) env                                 = raise Unsupported "Not yet supported"
        | t_exp (Ast.RecordExp{record_id,field_elem}) env           = raise Unsupported "Not yet supported"
        | t_exp (Ast.AssignExp {assign_var,assignment}) env         = raise Unsupported "Not yet supported"
        | t_exp (Ast.NegativeExp e) env                             = Ex (T.BINOP (T.MINUS, T.CONST 0, unEx (t_exp e env))) 
        | t_exp (Ast.IfExp{if_cond,body_if,otherwise}) env          = let val r = Temp.newtemp()
                                                                          val t = Temp.newlabel()
                                                                          val f = Temp.newlabel()
                                                                          val res = Temp.newlabel()
                                                                      in 
                                                                          Ex (T.ESEQ(seqstmt[
                                                                            unCx (t_exp if_cond env) (t,f),
                                                                            T.LABEL t,
                                                                            T.MOVE (T.TEMP r, unEx (t_exp body_if env)),
                                                                            T.LABEL f, 
                                                                            T.MOVE (T.TEMP r, unEx (t_exp otherwise env)),
                                                                            T.LABEL res
                                                                          ], T.TEMP r))
                                                                      end 
        | t_exp (Ast.IfThenExp{ifthen_cond,body_ifthen}) env        = let val t = Temp.newlabel()
                                                                          val f = Temp.newlabel()
                                                                      in 
                                                                          Nx (seqstmt [
                                                                            unCx (t_exp ifthen_cond env) (t,f),
                                                                            T.LABEL t, 
                                                                            unNx (t_exp body_ifthen env),
                                                                            T.LABEL f
                                                                          ])
                                                                      end 
        | t_exp (Ast.WhileExp{test_cond,body_while}) env            = raise Unsupported "Not yet supported"
        | t_exp (Ast.ForExp{for_id,first_e,final_e,body_for}) env   = raise Unsupported "Not yet supported"
        | t_exp (Ast.BreakExp) env                                  = raise Unsupported "Not yet supported"
        | t_exp (Ast.LetExp{decl,body_expr}) env                    = raise Unsupported "Not yet supported"

      and t_dec (Ast.TypeDec tl) env = raise Unsupported "Not yet supported"
        | t_dec (Ast.FuncDec fl) env = raise Unsupported "Not yet supported"
        | t_dec (Ast.VarDec vl) env  = raise Unsupported "Not yet supported"

      and t_expr (Ast.Expression E) = unNx (t_exp E Env.Envt)

    in 
      t_expr (prog)
    end
    
end 
