signature CANON = 
sig 
    val linearize : Tree.stmt -> Tree.stmt list 
    val basicBlocks : Tree.stmt list -> (Tree.stmt list list * Temp.label)
    (* val traceSchedule : Tree.stmt list list * Temp.label -> Tree.stmt list  *)
end 

structure Canon : CANON = 
struct 
    structure T = Tree 
    exception Error of string
    fun linearize (stm) = 
        (* commute function estimes whether 2 expressions are commute *)
        (* We took it as - A constant commutes with any statement ; 
        Empty statement commutes with any expression , everything else is assumed not to commute  *)
        let fun commute (T.EXP(T.CONST _), _)        = true 
              | commute (_, T.NAME _)                = true 
              | commute (_, T.CONST _)               = true 
              | commute _                            = false

            infix %
            fun (T.EXP(T.CONST _)) % x               = x 
              | x % (T.EXP(T.CONST _))               = x 
              | x % y                                = T.SEQ (x,y)

            fun if_exp (T.BINOP (p,e1,e2))           = then_exp ([e1,e2], fn[e1,e2] => T.BINOP(p,e1,e2) | _ => raise Error "Invalid Input")
              | if_exp (T.MEM a)                     = then_exp ([a], fn[a] => T.MEM(a) | _ => raise Error "Invalid Input")
              | if_exp (T.ESEQ (s,e))                = let val (s1,er) = (if_exp e) in (if_stm s % s1, er) end
              | if_exp (T.CALL (e,el))               = then_exp (e::el, fn (e::el) => T.CALL (e,el) | _ => raise Error "Invalid Input")
              | if_exp (e)                           = then_exp ([], fn[] => e | _ => raise Error "Invalid Input")

            and if_stm (T.JUMP (e,l))                = then_stm ([e],fn [e] => T.JUMP (e,l) | _ => raise Error "Invalid Input")
              | if_stm (T.CJUMP (p,e1,e2,t,f))       = then_stm ([e1,e2],fn[e1,e2] => T.CJUMP(p,e1,e2,t,f) | _ => raise Error "Invalid Input")
              | if_stm (T.SEQ(s1,s2))                = (if_stm s1 % if_stm s2)
              | if_stm (T.EXP e)                     = if_stm_exp e
              | if_stm (T.MOVE (e1,e2))              = if_stm_move (e1,e2)
              | if_stm (s)                           = then_stm ([], fn [] => s | _ => raise Error "Invalid Input")

            and if_stm_exp (T.CALL(e,el))            = then_stm (e::el, fn (e::el) => T.EXP(T.CALL(e,el)) | _ => raise Error "Invalid Input")
              | if_stm_exp (e)                       = then_stm ([e],fn [e] => T.EXP e | _ => raise Error "Invalid Input")

            and if_stm_move (T.TEMP t, T.CALL(e,el)) = then_stm (e::el, fn (e::el) => T.MOVE(T.TEMP t, T.CALL(e,el)) | _ => raise Error "Invalid Input")
              | if_stm_move (T.TEMP t, b)            = then_stm ([b], fn[b] => T.MOVE (T.TEMP t, b) | _ => raise Error "Invalid Input") 
              | if_stm_move (T.MEM e, b)             = then_stm ([e,b], fn[e,b] => T.MOVE(T.MEM e, b) | _ => raise Error "Invalid Input")
              | if_stm_move (T.ESEQ (s,e), b)        = if_stm (T.SEQ(s, T.MOVE(e,b))) 
              | if_stm_move (T.CONST a, b)           = raise Error "Invalid Input"
              | if_stm_move (T.NAME a, b)            = raise Error "Invalid Input"
              | if_stm_move (T.BINOP (p,e1,e2), b)   = raise Error "Invalid Input"
              | if_stm_move (T.CALL (e,el), b)       = raise Error "Invalid Input"

            and then_exp (el, f)                     = let val (s1,er) = (reorder el) in (s1, f er) end                      

            and then_stm (el, f)                     = let val (s1,er) = (reorder el) in (s1 % f er) end

            and reorder ((T.CALL (e,el)):: rem)      = let val t = Temp.newtemp() in reorder (T.ESEQ(T.MOVE(T.TEMP t, T.CALL(e,el)), T.TEMP t)::rem) end
              | reorder (a::rem)                     = let val (s1,e1) = if_exp a 
                                                           val (s2,e2) = reorder rem 
                                                       in if commute (s2,e1) then (s1 % s2,e1::e2) 
                                                          else let val t = Temp.newtemp() in (s1 % T.MOVE(T.TEMP t, e1) % s2, T.TEMP t :: e2) end
                                                       end
              | reorder nil                          = (T.EXP (T.CONST 0),nil)

            fun linear (T.SEQ (a,b),L)               = linear (a,linear(b,L))
              | linear (s,L)                         = s::L

        in 
            linear (if_stm stm, nil)
        end

    fun basicBlocks (stms) = 
        let 
            val finish = Temp.newlabel ()

            fun rev_list []         = []
              | rev_list (x::xs)    = (rev_list xs) @ [x] 

            fun one_b ((top as T.LABEL _) :: bottom, list_blocks)   = new_b (bottom,[top],list_blocks)
              | one_b (nil, list_blocks)                            = (rev_list list_blocks)
              | one_b (stms, list_blocks)                           = one_b (T.LABEL(Temp.newlabel())::stms, list_blocks) 

            and new_b ((s as (T.JUMP _))::rem, current_b,lb)        = end_b(rem,s::current_b,lb)
              | new_b ((s as (T.CJUMP _)):: rem, current_b,lb)      = end_b (rem, s::current_b,lb)
              | new_b (s as (T.LABEL l::_), current_b,lb)           = new_b(T.JUMP(T.NAME l,[l])::s, current_b,lb)
              | new_b (s::rem, current_b,lb)                        = new_b (rem, s::current_b,lb)
              | new_b (nil, current_b,lb)                           = new_b([T.JUMP(T.NAME finish, [finish])], current_b,lb)
            
            and end_b (s, current_b, list_blocks)                   = one_b (s, rev_list current_b :: list_blocks)

        in 
            (one_b (stms, nil), finish)
        end

end
