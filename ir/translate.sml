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
    exception Undefined of string
    
    structure T = Tree
    structure A = Ast 

    datatype exp = Ex of T.expr 
                 | Nx of T.stmt 
                 | Cx of Temp.label * Temp.label -> T.stmt 
                         (* ----- genstmt ---- *)

    fun seqstmt []  = T.EXP (T.CONST 0)
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
    
    fun elm [a]    = a 
      | elm _      = raise Error "Will not occur"
    
    fun translate (prog) = 
    let 
      fun t_exp (Ast.Nil) env                                       = Ex (T.CONST 0)

        | t_exp (Ast.StringConst s) env                             = raise Unsupported "Not yet supported"

        | t_exp (Ast.IntConst i) env                                = Ex (T.CONST i)

        | t_exp (Ast.Lvalue v) env                                  = Ex (t_var v env)

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

        | t_exp (Ast.SeqExp el) env                                 = let val (seq_l, seq_exp) = t_seq el [] env
                                                                      in 
                                                                        Ex (T.ESEQ((seqstmt seq_l),elm seq_exp))
                                                                      end
        
        | t_exp (Ast.RecordExp{record_id,field_elem}) env           = raise Unsupported "Not yet supported"
        | t_exp (Ast.AssignExp {assign_var,assignment}) env         = let val e = unEx (t_exp assignment env)
                                                                          val t = t_var assign_var env 
                                                                      in 
                                                                          Nx (T.MOVE(t, e)) 
                                                                      end 

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

        | t_exp (Ast.WhileExp{test_cond,body_while}) env            = let val check = unCx (t_exp test_cond env)
                                                                          val ctnue = Temp.newlabel()
                                                                          val t     = Temp.newlabel()
                                                                          val fnsh  = Temp.newlabel()
                                                                          val env1  = Env.update "break" (fnsh) env
                                                                          val stmts = seqstmt ([
                                                                            T.LABEL ctnue,
                                                                            check (t, fnsh),
                                                                            T.LABEL t,
                                                                            T.EXP (unEx (t_exp body_while env1)),
                                                                            T.JUMP (T.NAME ctnue,[ctnue]),
                                                                            T.LABEL fnsh 
                                                                          ])
                                                                      in
                                                                        Nx stmts 
                                                                      end

        | t_exp (Ast.ForExp{for_id,first_e,final_e,body_for}) env   = let val t1    = Temp.newtemp()
                                                                          val t2    = Temp.newtemp()
                                                                          val loop  = Temp.newlabel()
                                                                          val cntu  = Temp.newlabel()
                                                                          val fnsh  = Temp.newlabel()
                                                                          val env1  = Env.update for_id t1 env 
                                                                          val env1  = Env.update "break" (fnsh) env1 
                                                                          val body  = unNx (t_exp body_for env1)
                                                                          val stmts = seqstmt([
                                                                            T.MOVE (T.TEMP t1, unEx (t_exp first_e env)),
                                                                            T.MOVE (T.TEMP t2, unEx (t_exp final_e env)),
                                                                            T.LABEL loop,
                                                                            T.CJUMP (T.NEQ, T.TEMP t1, T.TEMP t2, cntu, fnsh),
                                                                            T.LABEL cntu,
                                                                            body,
                                                                            T.MOVE (T.TEMP t1, T.BINOP (T.PLUS, T.TEMP t1, T.CONST 1)),
                                                                            T.JUMP (T.NAME loop,[loop]),
                                                                            T.LABEL fnsh
                                                                          ])
                                                                        in 
                                                                          Nx stmts 
                                                                        end

        | t_exp (Ast.BreakExp) env                                  = let val ol = Env.lookupVar "break" env  
                                                                      in 
                                                                          case ol of  
                                                                            SOME label => Nx (T.JUMP (T.NAME label, [label]))
                                                                          | NONE       => raise Error "Break not in loop"
                                                                      end 

        | t_exp (Ast.LetExp{decl,body_expr}) env                    = let val (list_stm , env_) = t_decl decl env
                                                                      in 
                                                                          Ex (T.ESEQ (seqstmt list_stm, unEx (t_exp body_expr env_)))  
                                                                      end

        and t_var (Ast.SimpleVar (i:Ast.id)) env                    = let val ot = Env.lookupVar i env  
                                                                      in 
                                                                          case ot of  
                                                                            SOME t => T.TEMP t 
                                                                          | NONE   => raise Undefined "variable"
                                                                      end 

        | t_var (Ast.FieldVar (v,v1)) env      = raise Unsupported "Not yet supported"
        | t_var (Ast.ArrVar (i:Ast.id, e)) env = raise Unsupported "Not yet supported"

      and t_seq [] seq_l env      = (seq_l, [])
        | t_seq [a] seq_l env     = (seq_l,[unEx (t_exp a env)])
        | t_seq (a::al) seq_l env = t_seq al (seq_l@ [unNx (t_exp a env)]) env

      and t_decl [] env      = ([], env)
        | t_decl (x::xs) env = let val (stm, env_) = t_dec x env 
                                   val (s,e_) = (t_decl xs env_)
                               in 
                                  (stm::s,e_)
                               end 

      and t_dec (Ast.TypeDec tl) env = raise Unsupported "Not yet supported"
        | t_dec (Ast.FuncDec fl) env = raise Unsupported "Not yet supported"
        | t_dec (Ast.VarDec vl) env  = tvar_dec(vl) env 

      and tvar_dec (Ast.Varf{varf_id,varf_ty,varf_first}) env    = let
                                                                      val t = Temp.newtemp() 
                                                                      val env_ = Env.update varf_id t env 
                                                                      val e = unEx (t_exp varf_first env) 
                                                                   in 
                                                                      (Tree.MOVE (Tree.TEMP t,e),env_ ) 
                                                                   end
    
      and t_expr (Ast.Expression E) = unNx (t_exp E Env.Envt)

    in 
      t_expr (prog)
    end
    
end 
