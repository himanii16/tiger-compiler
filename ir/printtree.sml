structure Printtree : 
    sig val printtree : TextIO.outstream * Tree.stmt list -> unit end =
struct

structure T = Tree 
fun printtree (outstream, s0) = 
    let fun ps s = TextIO.output(outstream,s)
        fun pse s = (ps s ; ps "\n")

        fun space 0 = ""
          | space n = (ps " "; space (n-1)) 

        val indent = ref 0 
        fun inc_indent () =(indent := !indent + 4)
        fun dec_indent () =(indent := !indent - 4)

        fun stmt_l []                   = ps ""
          | stmt_l (x::xs)              = (stmt x ; pse ""; stmt_l xs)

        and stmt (T.SEQ(s1,s2))          = (pse "SEQ("; inc_indent(); space(!indent);stmt (s1); pse ", " ; space (!indent); stmt (s2); dec_indent(); ps ")" )
          | stmt (T.LABEL l)            = (ps "LABEL "; ps (Int.toString l)) 
          | stmt (T.EXP e)              = (ps "EXP(";expr (e);ps ")")
          | stmt (T.MOVE (e1,e2))        = (ps "MOVE("; expr (e1); ps ", "; expr (e2); ps ")") 
          | stmt (T.JUMP (e,_))          = (ps "JUMP("; expr (e); ps ")")
          | stmt (T.CJUMP (p,e1,e2,t,f)) = (ps "CJUMP("; expr (e1); ps ", "; relOp p; ps ", ";expr(e2); 
                                              ps ", "; ps (Int.toString t); ps ", "; ps (Int.toString f); ps ")")

        (* WARNING : the name of the variable of operator in T.CJUMP cannot be o or op *)
        (* WARNING : the name of the variable of operator in T.BINOP cannot be o or op [took 2 hrs to find the mistake] *)  

        and expr (T.CONST i)             = (ps "CONST "; ps (Int.toString i))
          | expr (T.NAME n)              = (ps "NAME "; ps (Int.toString n))
          | expr (T.TEMP t)              = (ps "TEMP "; ps (Int.toString t))  
          | expr (T.BINOP (p,e1,e2))     = (ps "BINOP("; binop p; ps ", "; expr(e1); ps ", "; expr(e2); ps ")") 
          | expr (T.MEM m)              = (pse "MEM("; expr(m); ps ")")
          | expr (T.CALL (e,el))         = (pse "CALL("; expr(e); app (fn a => (pse ", "; expr(a))) el; ps ")")  
          | expr (T.ESEQ (s,e))          = (ps "ESEQ(\n"; inc_indent(); space(!indent); stmt(s); pse ","; space(!indent); expr(e); dec_indent(); ps ")") 

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
        stmt_l(s0) ; TextIO.flushOut outstream  
    end

end