structure Tree : TREE =
struct

    (* Integer bitwise logic operators - AND OR XOR *)
    (* Integer Logic shift operators - LSHIFT RSHIFT *)
    (* Integer arithmetic right-shift - ARSHIFT *)
    (* Though tiger language has no logical operators, but the ir language is meant to be 
        independent of any source language *)

    datatype binop = PLUS | MINUS | MUL | DIV | AND | OR | LSHIFT | RSHIFT | ARSHIFT | XOR

    (* signed and unsigned [U in starting] integer inequalities  *)
    datatype relop = EQ | NEQ | GT | LT | GEQ | LEQ | UGT | ULT | UGEQ | ULEQ  (*comparator of 2 expressions*)

    datatype expr  = CONST of int           (*Integer constant*)
                  | NAME  of Temp.label    (* Symbolic constant n [assembly language label*)
                  | TEMP  of Temp.temp     (* Like register in a real machine*) 
                  | BINOP of binop * expr * expr   (* e1 oper e2*)
                  (* mem (e) yields address a after evaluationg e *)
                  | MEM   of expr                  (* contents of wordSize(frame module) bytes of memory starting at expr e
                                                      When left child of move - store; when right child of move - fetch*) 
                  | CALL  of expr * expr list      (* a procedure call, expr - function ; expr list - arguments
                                                      function is evaluated then arguments from left to right*)
                  | ESEQ  of stmt * expr           (* statement s is evaluated for side effects; 
                                                      then expr e is evaluated for a results*)

        (* Statements of the tree language performs side effects and control flow *)

         and stmt = MOVE  of expr * expr  (*evaluates expr2 and stores in address expr1[can be mem or temp]*)
                  | EXP   of expr   (* evaluates expr e and discard the result*)

                  (* The temp.label list has possible locations where e can evaluate to *)
                  | JUMP  of expr * Temp.label list   (*Transfer control*)
                  (* o, e1,e2,t,f : if e1 o e2 is true, then jump to t, else jump to f *)
                  | CJUMP of relop * expr * expr * Temp.label * Temp.label  (*conditional jump*)
                  | SEQ   of stmt * stmt    (*sequence statement, s1 followed by s2*)
                  | LABEL of Temp.label   (*constant value of name n to be the current machine code addr*)

end
(* 
translate.exp = tree.stm | tree.expr

translate : AST -> translate.exp  CJUM | MEM        printtreee : IF (MEM) : []
                                                                 IF (CJUM) : CJUM (MEM, LKJFASDL)           

  t1:  type something = int  => CJUMP ()  tree.stm

   t2:  if (2+3 == 4 )    => MEM ()  tree.expr 

FLAG = (2>3 | 4 <5) cx -> ex 

nx : var a = 5 ; a = a+1 (b) 


IR PROGRAM = Prog of translate.exp list  *)