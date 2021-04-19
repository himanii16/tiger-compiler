signature TREE =
sig

    datatype binop = PLUS | MINUS | MUL | DIV | AND | OR | LSHIFT | RSHIFT | ARSHIFT | XOR
    datatype relop = EQ | NEQ | GT | LT | GEQ | LEQ | UGT | ULT | UGEQ | ULEQ

    datatype expr = CONST of int
                  | NAME  of Temp.label
                  | TEMP  of Temp.temp
                  | BINOP of binop * expr * expr
                  | MEM   of expr 
                  | CALL  of expr * expr list 
                  | ESEQ  of stmt * expr

         and stmt = MOVE  of expr * expr
                  | EXP   of expr
                  | JUMP  of expr * Temp.label list
                  | CJUMP of relop * expr * expr * Temp.label * Temp.label
                  | SEQ   of stmt * stmt
                  | LABEL of Temp.label

end

