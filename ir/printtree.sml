structure Printtree : 
    sig val printtree : TextIO.outstream * Tree.stmt -> unit end =
struct

structure T = Tree 
fun printtree (outstream, s0) = 
    let fun ps s = TextIO.output(outstream,s)
        fun pse s = (ps s ; ps "\n")

        fun space 0 = ""
          | space n = (ps " "; space (n-1)) 

        fun stmt (T.SEQ(s1,s2),d)          = (space d; pse "SEQ("; stmt (s1,d+1); pse "," ; stmt (s2,d+1); ps ")" )
          | stmt (T.LABEL l, d)            = (space d; ps "LABEL "; ps (Int.toString l)) 
          | stmt (T.EXP e, d)              = (space d; pse "EXP("; expr (e,d+1); ps ")")
          | stmt (T.MOVE (e1,e2),d)        = (space d; pse "MOVE("; expr (e1,d+1); pse ","; expr (e2,d+1); pse ")") 
          | stmt (T.JUMP (e,_),d)          = (space d; pse "JUMP("; expr (e,d+1); ps ")")
          | stmt (T.CJUMP (p,e1,e2,t,f),d) = (space d; ps "CJUMP("; expr (e1,d+1); ps ","; relOp p; ps ",";expr(e2,d+1); 
                                              ps ","; space (d+1); ps (Int.toString t); ps ","; ps (Int.toString f); ps ")")

        (* WARNING : the name of the variable of operator in T.CJUMP cannot be o or op *)
        (* WARNING : the name of the variable of operator in T.BINOP cannot be o or op [took 2 hrs to find the mistake] *)  

        and expr (T.CONST i,d)             = (space d; ps "CONST "; ps (Int.toString i))
          | expr (T.NAME n,d)              = (space d; ps "NAME "; ps (Int.toString n))
          | expr (T.TEMP t,d)              = (space d; ps "TEMP "; ps (Int.toString t))  
          | expr (T.BINOP (p,e1,e2),d)     = (space d; ps "BINOP( "; binop p; pse ","; expr(e1,d+1); pse ","; expr(e2,d+1); ps ")") 
          | expr (T.MEM m, d)              = (space d; pse "MEM("; expr(m,d+1); ps ")")
          | expr (T.CALL (e,el),d)         = (space d; pse "CALL("; expr(e,d+1); app (fn a => (pse ","; expr(a,d+2))) el; ps ")")  
          | expr (T.ESEQ (s,e),d)          = (space d; ps "ESEQ("; stmt(s,d+1); pse ","; expr(e,d+1); ps ")") 

        and binop T.PLUS     = ps "PLUS"
          | binop T.MINUS    = ps "MINUS"
          | binop T.MUL      = ps "MUL"
          | binop T.DIV      = ps "DIV"
          | binop T.AND      = ps "AND"
          | binop T.OR       = ps "OR"
          | binop T.LSHIFT   = ps "LSHIFT"
          | binop T.RSHIFT   = ps "RSHIFT"
          | binop T.ARSHIFT  = ps "ARSHIFT"
          | binop T.XOR      = ps "XOR"

        and relOp T.EQ       = ps "EQ"
          | relOp T.NEQ      = ps "NEQ"
          | relOp T.LT       = ps "LT"
          | relOp T.GT       = ps "GT"
          | relOp T.LEQ      = ps "LEQ"
          | relOp T.GEQ      = ps "GEQ"
          | relOp T.ULT      = ps "ULT"
          | relOp T.ULEQ     = ps "ULEQ"
          | relOp T.UGT      = ps "UGT"
          | relOp T.UGEQ     = ps "UGEQ"
     
    in   
        stmt(s0,0) ; pse "" ; TextIO.flushOut outstream  
    end

end