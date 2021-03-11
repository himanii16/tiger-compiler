(*syntax and the fields which are included in this file are referenced from:
1. The appel's book
2. EPITA Reference
3. https://www.cs.cornell.edu/courses/cs312/2008sp/recitations/rec02.html
*)

structure Ast = 
struct

	(*exp ::= expression, decs ::= declarations*)
	datatype program = exp | dec

	(*binaryOp datatype defines the valid operators*)
	(*GEQ : >= , LEQ : <= , EQ : = , NEQ : <> , GT : > , LT : <*)
	datatype binaryOp = Mul | Div | Plus | Minus | GEQ | LEQ | EQ | NEQ | GT | LT | AND | OR

	datatype exp = nil   (*null*)

				(*string constant (literal)*)
				| ID          of string

				(*integer constant (literal)*)
				| IntConst    of int
				
				(* Variables, field, elements of an array.*)
				| Lvalue      of var

				(*binary operation expressions*)
				| BinaryOpExp of {left: exp, oper: binaryOp, right: exp}

				(*function call expression*)
				| FuncCall    of {name: string, arguments: exp list}

				(*array expression : init - initial value*)
				| ArrExp      of {name: string, size: exp, init: exp}

				(*Sequence expression*)
				| SeqExp      of exp list

				(*Record expression*)
				| RecordExp   of {name: string, ty: (string*exp) list}

				(* assigning expression*)
				| AssignExp   of {variable: string, assignment: exp}

				(* Conditional expressions*)
				| IfExp       of {test: exp, elif: exp, otherwise: exp}
				| WhileExp    of {test: exp, body: exp}
				| ForExp      of {variable: string, init: exp, final: exp, body: exp}
				| BreakExp
				| LetExp      of {decl: dec list, body: exp}

		(*declarations*)
		and dec = TypeDec of typefield list   (*type declaration*)
				| FuncDec of funcfield list   (*function declaration*)
				| VarDec  of varfield         (*variable declaration*)

		and typ = alias  of string                   (*type alias*)
				| record of (string * string) list   (*record type*)
				| arr    of string                   (*array type*)

		and var = SimpleVar of string        (*variable*)
				| FieldVar  of var * string  (*field varibale*)
				| ArrVar    of var * exp     (*array variable*)

		(*classfields - including variable field, type field and function field*)
		and	varfield = Varf of { name   : string
								, ty    : string option
								, init  : exp
								}

		and typefield = Typef of { name : string
								, ty    : typ
								}

		and funcfield = Funcf of { name       : string
								, arguments   : typefield list
								, result_type : string option
								, body        : exp
								}

end
