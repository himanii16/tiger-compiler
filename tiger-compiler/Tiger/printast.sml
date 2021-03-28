structure PrintAst : 
    sig val print : TextIO.outstream * Ast.program -> unit end =
struct

structure A = Ast

    fun print (outstream, e0) =
        let fun say s =  TextIO.output(outstream,s)
        fun sayln s= (say s; say "\n") 

        fun   space 0 = ()
            | space i = (say " "; space(i-1))

        fun   opname A.Plus = "Plus"
            | opname A.Minus = "Minus"
            | opname A.Mul = "Mul"
            | opname A.Div = "Div"
            | opname A.EQ = "EQ"
            | opname A.NEQ = "NEQ"
            | opname A.LT = "LT"
            | opname A.LEQ = "LEQ"
            | opname A.GEQ = "GEQ"
            | opname A.GT = "GT"
            | opname A.AND = "AND"
            | opname A.OR = "OR"

        fun   dolist d f [a] = (sayln ""; f(a,d+1))
            | dolist d f (a::r) = (sayln ""; f(a,d+1); say ","; dolist d f r)
            | dolist d f nil = ()


        fun   var(A.SimpleVar(s),d)  = (space d; say "SimpleVar("; say(s); say ")")
            | var(A.FieldVar(v,s),d) = (space d; sayln "FieldVar("; var(v,d+1); sayln ","; space(d+1); say(s); say ")")
            | var(A.ArrVar(i,e),d) = (space d; sayln "ArrVar("; say(i); sayln ","; exp(e,d+1); say ")")

        and   exp(A.Lvalue v, d) = (space d; sayln "Lvalue("; var(v,d+1); say ")")
            | exp(A.Nil, d) = (space d; say "Nil")
            | exp(A.IntConst i, d) = (space d; say "IntConst("; say(Int.toString i); say ")")
            | exp(A.StringConst(s),d) = (space d; say "StringConst(\""; say s; say "\")")

            | exp(A.FuncCall{func_id,fun_args},d) = (space d; say "FuncCall("; say(func_id);
                                                    say ",["; dolist d exp fun_args; say "])")

            | exp(A.BinOpExp{left,oper,right},d) = (space d; say "BinOpExp("; say(opname oper); sayln ","; 
                                                    exp(left,d+1); sayln ","; exp(right,d+1); say ")")

            | exp(A.RecordExp{record_id,field_elem},d) =
                let fun f((name,e),d) = 
                    (space d; say "("; say(name);
                    sayln ","; exp(e,d+1);
                    say ")")
                in space d; say "RecordExp("; say(record_id); 
                    sayln ",["; dolist d f field_elem; say "])" 
                end

            | exp(A.SeqExp l, d) = (space d; say "SeqExp["; dolist d exp l; say "]")

            | exp(A.AssignExp{assign_var,assignment},d) = (space d; sayln "AssignExp("; var(assign_var,d+1); 
                                                           sayln ","; exp(assignment,d+1); say ")")
                
            | exp(A.NegativeExp(e), d) = (space d; say "NegativeExp("; exp(e, d+1); say ")")

            | exp(A.IfExp{if_cond,body_if,otherwise},d) =(space d; sayln "IfExp("; exp(if_cond,d+1); sayln ","; exp(body_if,d+1); 
                                                          sayln ","; exp(otherwise,d+1); say ")" )

            | exp(A.IfThenExp{ifthen_cond,body_ifthen},d) = (space d; sayln "IfExp("; exp(ifthen_cond,d+1); sayln ",";
                                                             exp(body_ifthen,d+1); say ")")

            | exp(A.WhileExp{test_cond,body_while},d) = (space d; sayln "WhileExp("; exp(test_cond,d+1); sayln ",";
                                                        exp(body_while,d+1); say ")")

            | exp(A.ForExp{for_id,first_e,final_e,body_for},d) = (space d; say "ForExp(";
                                                                  say(for_id); say ","; sayln ",";
                                                                  exp(first_e,d+1); sayln ","; exp(final_e,d+1); sayln ",";
                                                                  exp(body_for,d+1); say ")")

            | exp(A.BreakExp, d) = (space d; say "BreakExp")

            | exp(A.LetExp{decl,body_expr},d) = (space d; say "LetExp(["; dolist d dec decl; sayln "],"; exp(body_expr,d+1); say")")

            | exp(A.ArrExp{arr_id,arr_size,first_i},d) = (space d; say "ArrExp("; say(arr_id); sayln ",";
                                                          exp(arr_size,d+1); sayln ","; exp(first_i,d+1); say ")") 

        and     dec(A.FuncDec l, d) =  
                let fun field((i,ti):A.tyfield,d) = case ti of NONE => (space d; say "("; say(i); say ","; say "NONE"; say ")") 
                                                            | SOME (s) => (space d; say "("; say(i); say ","; say (s); say ")") 
                    fun funcfield(A.Funcf{funcf_id,fun_args,result_type,funcf_body},d) =
                        (space d; say "("; say (funcf_id); say ",["; dolist d field fun_args; sayln "],"; space d;
                        case result_type of NONE    => say "NONE"
                                          | SOME(s) => (say "SOME("; say(s); say ")"); sayln ","; exp(funcf_body,d+1); say ")")

                  in space d; say "FuncDec["; dolist d funcfield l; say "]"
                end

              | dec(A.VarDec l, d) =  
                let fun varfield(A.Varf{varf_id,varf_ty,varf_first},d) = (space d; say "("; say (varf_id); say ",["; sayln "],"; space d;
                        case varf_ty of NONE    => say "NONE"
                                      | SOME(s) => (say "SOME("; say(s); say ")");sayln ","; exp(varf_first,d+1); say ")")

                  in space d; say "VarDec["; varfield(l,d); say "]"
                end

              | dec(A.TypeDec l, d) = 
                let fun tdec((i:Ast.id,t),d) = (space d; say"("; say(i); sayln ","; ty(t,d+1); say ")")

                  in space d; say "TypeDec["; dolist d tdec l; say "]"
                end

            and   ty(A.alias(s), d) = (space d; say "alias("; say(s);say ")")

                | ty(A.record l, d) =  
                    let fun f((i,t),d) = case t of NONE => (space d; say "("; say (i); say ",";  say "NONE"; say ")")
                                                | SOME (s) => (space d; say "("; say (i); say ",";  say (s); say ")")

                      in space d; say "record["; dolist d f l; say "]"
                    end

                | ty(A.arr(s),d) = (space d; say "arr("; say(s); say ")")

            and program(A.Expression e, d) = (space d; say "Program("; exp(e, d+1); say ")")  

      in  program(e0,0); sayln ""; TextIO.flushOut outstream
    end

end

