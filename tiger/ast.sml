(*syntax and the fields which are included in this file are referenced from:
1. The appel's book
2. EPITA Reference
3. https://www.cs.cornell.edu/courses/cs312/2008sp/recitations/rec02.html
*)

structure Tiger = 
struct

	(*exp ::= expression, decs ::= declarations*)
	datatype ast = exp | decs


	(*binaryOp datatype defines the valid operators*)
	(*GEQ : >= , LEQ : <= , EQ : = , NEQ : <> , GT : > , LT : <*)
	datatype binaryOp = Mul | Div | Plus | Minus | GEQ | LEQ | EQ | NEQ | GT | LT | AND | OR

	datatype var = SimpleVar of string        (*variable*)
				 | FieldVar  of var * string  (*field varibale*)
				 | ArrVar    of var * exp     (*array variable*)

		and exp      = nil   (*null*)

					 (*string constant (literal)*)
					 | strConstant of string

					 (*integer constant (literal)*)
					 | intConst    of int
					 
					 (*array operations*)
					 | lvalue      of var

					 (*doing binary operation on expressions*)
					 | OpCall      of {left: exp, oper: binaryOp, right: exp}

					 (*function call*)
					 | FunCall     of {name: string, arguments: exp list}

					 (*array expression : init - initial value*)
					 | ArrExp      of {name: string, size: exp, init: exp}

					 (*negative of expression*)
					 | NegExp      of exp

					 (* assigning expression*)
					 | AssignExp   of {variable: string, assignment: exp}

					 (* Conditional expressions*)
					 | IfExp       of {test: exp, elif: exp, otherwise: exp}
					 | WhileExp    of {test: exp, body: exp}
					 | ForExp      of {variable: string, init: exp, final: exp, body: exp}
					 | BreakExp
					 | LetExp      of {decl: dec list, body: exp}

		(*declarations*)
		and dec 	 = TypeDec of typefield list   (*type declaration*)
					 | FuncDec of funcfield list   (*function declaration*)
					 | VarDec  of varfield         (*variable declaration*)

		and typ      = alias  of string                   (*type alias*)
					 | record of (string * string) list   (*record type*)
					 | arr    of string                   (*array type*)


	(*classfields - including variable field, type field and function field*)
	withtype  varfield = { name   : string
						 , ty     : string option
						 , init   : exp
						 }

		   and typefield = { name  : string
					       , ty    : typ
					       }

	       and funcfield = { name       : string
	                   	  , arguments   : typefield list
	                      , result_type : string option
	                      , body        : exp
	                      }

end