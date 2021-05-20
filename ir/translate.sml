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
    structure F = Frame

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
      fun t_exp (Ast.Nil) env fenv                                      = Ex (T.CONST 0)

        | t_exp (Ast.StringConst s) env fenv                            = raise Unsupported "Not yet supported"

        | t_exp (Ast.IntConst i) env fenv                               = Ex (T.CONST i)

        | t_exp (Ast.Lvalue v) env fenv                                 = Ex (t_var v env fenv)

        | t_exp (Ast.BinOpExp{left,oper,right}) env fenv                = let val l       = unEx (t_exp left env fenv)
                                                                              val r       = unEx (t_exp right env fenv) 
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

        | t_exp (Ast.FuncCall{func_id,fun_args}) env fenv               = let val ot = Env.lookupFunc func_id fenv  
                                                                              fun args [] = []   
                                                                                | args (xs::xl) = (unEx (t_exp xs env fenv))::args xl 
                                                                          in 
                                                                              case ot of  
                                                                                SOME t => Ex (T.CALL (T.NAME t,args fun_args ))
                                                                              | NONE   => raise Undefined "function"
                                                                          end 

        | t_exp (Ast.ArrExp{arr_id,arr_size,first_i}) env fenv          = raise Unsupported "Not yet supported"

        | t_exp (Ast.SeqExp el) env fenv                                = let val (seq_l, seq_exp) = t_seq el [] env fenv
                                                                          in 
                                                                            Ex (T.ESEQ((seqstmt seq_l),elm seq_exp))
                                                                          end
        
        | t_exp (Ast.RecordExp{record_id,field_elem}) env fenv      = raise Unsupported "Not yet supported"
        | t_exp (Ast.AssignExp {assign_var,assignment}) env fenv    = let val e = unEx (t_exp assignment env fenv)
                                                                          val t = t_var assign_var env fenv 
                                                                      in 
                                                                          Nx (T.MOVE(t, e)) 
                                                                      end 

        | t_exp (Ast.NegativeExp e) env fenv                        = Ex (T.BINOP (T.MINUS, T.CONST 0, unEx (t_exp e env fenv))) 

        | t_exp (Ast.IfExp{if_cond,body_if,otherwise}) env fenv     = let val r = Temp.newtemp()
                                                                          val t = Temp.newlabel()
                                                                          val f = Temp.newlabel()
                                                                      in 
                                                                          Ex (T.ESEQ(seqstmt[
                                                                            T.MOVE (T.TEMP r, unEx (t_exp body_if env fenv)),
                                                                            unCx (t_exp if_cond env fenv) (t,f),
                                                                            T.LABEL f, 
                                                                            T.MOVE (T.TEMP r, unEx (t_exp otherwise env fenv)),
                                                                            T.LABEL t
                                                                          ], T.TEMP r))
                                                                      end 

        | t_exp (Ast.IfThenExp{ifthen_cond,body_ifthen}) env fenv   = let val t = Temp.newlabel()
                                                                          val f = Temp.newlabel()
                                                                          val r = Temp.newtemp ()
                                                                          val res = Nx (seqstmt [
                                                                                    unCx (t_exp ifthen_cond env fenv) (t,f),
                                                                                    T.LABEL t, 
                                                                                    T.MOVE (T.TEMP r, unEx (t_exp body_ifthen env fenv)),
                                                                                    T.LABEL f
                                                                                  ])
                                                                      in 
                                                                          Ex(unEx res)
                                                                      end 

        | t_exp (Ast.WhileExp{test_cond,body_while}) env fenv            = let val check = unCx (t_exp test_cond env fenv)
                                                                          val ctnue = Temp.newlabel()
                                                                          val t     = Temp.newlabel()
                                                                          val fnsh  = Temp.newlabel()
                                                                          val env1  = Env.update "break" (fnsh) env
                                                                          val stmts = seqstmt ([
                                                                            T.LABEL ctnue,
                                                                            check (t, fnsh),
                                                                            T.LABEL t,
                                                                            T.EXP (unEx (t_exp body_while env1 fenv)),
                                                                            T.JUMP (T.NAME ctnue,[ctnue]),
                                                                            T.LABEL fnsh 
                                                                          ])
                                                                      in
                                                                        Nx stmts 
                                                                      end

        | t_exp (Ast.ForExp{for_id,first_e,final_e,body_for}) env fenv  = let val t1    = Temp.newtemp()
                                                                          val t2    = Temp.newtemp()
                                                                          val loop  = Temp.newlabel()
                                                                          val cntu  = Temp.newlabel()
                                                                          val fnsh  = Temp.newlabel()
                                                                          val env1  = Env.update for_id t1 env 
                                                                          val env1  = Env.update "break" (fnsh) env1 
                                                                          val body  = unNx (t_exp body_for env1 fenv)
                                                                          val stmts = seqstmt([
                                                                            T.MOVE (T.TEMP t1, unEx (t_exp first_e env fenv)),
                                                                            T.MOVE (T.TEMP t2, unEx (t_exp final_e env fenv)),
                                                                            T.LABEL loop,
                                                                            T.CJUMP (T.LEQ, T.TEMP t1, T.TEMP t2, cntu, fnsh),
                                                                            T.LABEL cntu,
                                                                            body,
                                                                            T.MOVE (T.TEMP t1, T.BINOP (T.PLUS, T.TEMP t1, T.CONST 1)),
                                                                            T.JUMP (T.NAME loop,[loop]),
                                                                            T.LABEL fnsh
                                                                          ])
                                                                        in 
                                                                          Nx stmts 
                                                                        end

        | t_exp (Ast.BreakExp) env fenv                             = let val ol = Env.lookupVar "break" env  
                                                                      in 
                                                                          case ol of  
                                                                            SOME label => Nx (T.JUMP (T.NAME label, [label]))
                                                                          | NONE       => raise Error "Break not in loop"
                                                                      end 

        | t_exp (Ast.LetExp{decl,body_expr}) env fenv               = let val (list_stm , env_, fenv) = t_decl decl env fenv
                                                                      in 
                                                                          Ex (T.ESEQ (seqstmt list_stm, unEx (t_exp body_expr env_ fenv)))  
                                                                      end

        and t_var (Ast.SimpleVar (i:Ast.id)) env fenv               = let val ot = Env.lookupVar i env  
                                                                      in 
                                                                          case ot of  
                                                                            SOME t => T.TEMP t 
                                                                          | NONE   => raise Undefined "variable"
                                                                      end 

        | t_var (Ast.FieldVar (v,v1)) env fenv      = raise Unsupported "Not yet supported"
        | t_var (Ast.ArrVar (i:Ast.id, e)) env fenv = raise Unsupported "Not yet supported"

      and t_seq [] seq_l env fenv      = (seq_l, [])
        | t_seq [a] seq_l env fenv     = (seq_l,[unEx (t_exp a env fenv)])
        | t_seq (a::al) seq_l env fenv = t_seq al (seq_l@ [unNx (t_exp a env fenv)]) env fenv

      and t_decl [] env fenv      = ([], env, fenv)
        | t_decl (x::xs) env fenv = let val (stm, env_,fenv_) = t_dec x env fenv
                                        val (s,e_,fe_) = (t_decl xs env_ fenv_)
                                    in 
                                        (stm::s,e_,fe_)
                                    end 

      and t_dec (Ast.TypeDec tl) env fenv = raise Unsupported "Not yet supported"
        | t_dec (Ast.FuncDec fl) env fenv = let val fenv = (upd_fdec fl env fenv) in (func_dec (fl) env fenv) end
        | t_dec (Ast.VarDec vl) env fenv  = tvar_dec(vl) env fenv 

      and func_dec ([Ast.Funcf{funcf_id,fun_args,result_type,funcf_body}]) env fenv = let 
                                                                                      val ot = Env.lookupFunc funcf_id fenv  
                                                                                      val l = case ot of SOME t => t | NONE => raise Undefined "Function"
                                                                                      fun arg_he [(id,tid)] env ls n = let val t1 = Temp.newtemp()
                                                                                                                    in
                                                                                                                    case tid of 
                                                                                                                    SOME tid =>
                                                                                                                    if tid = "int" then
                                                                                                                      (Env.update id t1 env,
                                                                                                                      T.MOVE(T.TEMP t1,T.MEM(T.BINOP(T.PLUS,T.TEMP (F.sp),T.CONST n)))::ls,n)  
                                                                                                                    else raise Unsupported "Type"
                                                                                                                    | NONE => (Env.update id t1 env,
                                                                                                                      T.MOVE(T.TEMP t1,T.MEM(T.BINOP(T.PLUS,T.TEMP (F.sp),T.CONST n)))::ls,n)
                                                                                                                    end 

                                                                                        | arg_he (x::xs)    env ls n = let val (e,s,n) = (arg_he [x] env ls (n+4)) in (arg_he xs e s n) end
                                                                                        | arg_he []         env ls n = (env, T.EXP(T.CONST 0)::ls,n) 

                                                                                      val (envn, sms, _) = arg_he fun_args env [] 0 
                                                                                      val body = T.MOVE (T.TEMP (F.rv), unEx (t_exp funcf_body envn fenv))
                                                                                      val stmts = seqstmt([
                                                                                          T.LABEL l,
                                                                                          T.MOVE (T.TEMP (F.sp), T.BINOP(T.MINUS, T.TEMP (F.sp),T.CONST 4)),
                                                                                          T.MOVE(T.MEM(T.TEMP(F.sp)), T.TEMP(F.fp)),
                                                                                          T.MOVE(T.TEMP(F.sp),T.BINOP(T.MINUS,T.TEMP(F.sp),T.CONST 4)),
                                                                                          T.MOVE(T.MEM(T.TEMP(F.sp)), T.TEMP(F.ra)),
                                                                                          T.MOVE(T.TEMP (F.fp),T.BINOP(T.PLUS,T.TEMP(F.sp), T.CONST 8)),
                                                                                          seqstmt (sms),
                                                                                          body,
                                                                                          T.MOVE(T.TEMP(F.ra),T.MEM (T.BINOP (T.MINUS,T.TEMP(F.fp),T.CONST 8))),
                                                                                          T.MOVE(T.TEMP(F.sp),T.TEMP(F.fp)),
                                                                                          T.MOVE(T.TEMP(F.fp),T.MEM (T.BINOP (T.MINUS,T.TEMP(F.fp),T.CONST 4))),
                                                                                          T.JUMP(T.TEMP(F.ra),[])                                                                             
                                                                                      ]) 
                                                                                      in 
                                                                                          (stmts, envn, fenv)
                                                                                      end 
        | func_dec (fd::fdl) env fenv = let val (stm, env_, fenv_) = func_dec [fd] env fenv 
                                            val (s,e_,f_) = (func_dec fdl env_ fenv_)
                                        in 
                                            (T.SEQ(stm, s),e_,f_)
                                        end 
        | func_dec [] env fenv = raise Error "invalid"

      and upd_fdec ([Ast.Funcf{funcf_id,fun_args,result_type,funcf_body}]) env fenv = let val l = Temp.newlabel()
                                                                                      in 
                                                                                      case result_type of 
                                                                                      SOME t => 
                                                                                        if t="int" 
                                                                                        then (Env.Fupdate funcf_id l fenv)
                                                                                        else raise Unsupported "Type" 
                                                                                      | NONE => (Env.Fupdate funcf_id l fenv)
                                                                                      end

        | upd_fdec (fd::fdl) env fenv = let val fenv = upd_fdec [fd] env fenv in upd_fdec fdl env fenv end 
        | upd_fdec [] env fenv = raise Error "invalid"

      and tvar_dec (Ast.Varf{varf_id,varf_ty,varf_first}) env fenv   = let
                                                                      val t = Temp.newtemp() 
                                                                      val env_ = Env.update varf_id t env  
                                                                      val e = unEx (t_exp varf_first env fenv) 
                                                                   in 
                                                                      (Tree.MOVE (Tree.TEMP t,e),env_ , fenv) 
                                                                   end
    
      and t_expr (Ast.Expression E) = unNx (t_exp E Env.Envt Env.FEnvt)

    in 
      t_expr (prog)
    end
    
end 
