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

    exception Error
    
    structure T = Tree
    structure A = Ast 

    datatype exp = Ex of T.expr 
                 | Nx of T.stmt 
                 | Cx of Temp.label * Temp.label -> T.stmt 
                         (* ----- genstmt ---- *)

    fun seqstmt []  = raise Error 
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
      | unCx (Nx s) = raise Error  (*will never occur in compiling a well-typed Tiger Program*)
    
    fun translate (prog) = 
    let 
      fun t_exp (Ast.Nil)                                       = raise Error
        | t_exp (Ast.StringConst s)                             = raise Error
        | t_exp (Ast.IntConst i)                                = raise Error
        | t_exp (Ast.Lvalue v)                                  = raise Error
        | t_exp (Ast.BinOpExp{left,oper,right})                 = raise Error
        | t_exp (Ast.FuncCall{func_id,fun_args})                = raise Error
        | t_exp (Ast.ArrExp{arr_id,arr_size,first_i})           = raise Error
        | t_exp (Ast.SeqExp el)                                 = raise Error
        | t_exp (Ast.RecordExp{record_id,field_elem})           = raise Error
        | t_exp (Ast.AssignExp {assign_var,assignment})         = raise Error
        | t_exp (Ast.NegativeExp e)                             = raise Error
        | t_exp (Ast.IfExp{if_cond,body_if,otherwise})          = raise Error
        | t_exp (Ast.IfThenExp{ifthen_cond,body_ifthen})        = raise Error
        | t_exp (Ast.WhileExp{test_cond,body_while})            = raise Error
        | t_exp (Ast.ForExp{for_id,first_e,final_e,body_for})   = raise Error
        | t_exp (Ast.BreakExp)                                  = raise Error
        | t_exp (Ast.LetExp{decl,body_expr})                    = raise Error

      and t_dec (Ast.TypeDec tl) = raise Error
        | t_dec (Ast.FuncDec fl) = raise Error
        | t_dec (Ast.VarDec vl)  = raise Error

      and t_expr (Ast.Expression E) = t_exp (E)

    in 
      t_expr (prog)
    end
    
end 