(*syntax and the fields which are included in this file are referenced from:
1. The appel's book
2. EPITA Reference
3. https://www.cs.cornell.edu/courses/cs312/2008sp/recitations/rec02.html
*)

structure Ast = 
struct

	(*exp ::= expression, decs ::= declarations*)
	datatype program = exp | dec
	type id = string
	type type_id = id
	type tyfield = id * type_id
	
	(*binaryOp datatype defines the valid operators*)
	(*GEQ : >= , LEQ : <= , EQ : = , NEQ : <> , GT : > , LT : <*)
	datatype binaryOp = Mul | Div | Plus | Minus | GEQ | LEQ | EQ | NEQ | GT | LT | AND | OR

	datatype exp = nil   (*null*)

				(*string constant (literal)*)
				| StringConst of string

				(*integer constant (literal)*)
				| IntConst    of int
				
				(* Variables, field, elements of an array.*)
				| Lvalue      of var

				(*binary operation expressions*)
				| BinOpExp    of {left: exp, oper: binaryOp, right: exp}

				(*function call expression*)
				| FuncCall    of {id_name: id, fun_args: exp list}

				(*array expression : init - initial value*)
				| ArrExp      of {id_name: id, arr_size: exp, first_i: exp}

				(*Sequence expression*)
				| SeqExp      of exp list

				(*Record expression*)
				| RecordExp   of {id_name: id, field_elem: (id*exp) list}

				(* assigning expression*)
				| AssignExp   of {id_name: id, assignment: exp}

				(* Conditional expressions*)
				| IfExp       of {test_cond: exp, body_expr: exp, otherwise: exp}
				| IfThenExp   of {test_cond: exp, body_expr: exp}
				| WhileExp    of {test_cond: exp, body_expr: exp}
				| ForExp      of {id_name: id, first_i: exp, final: exp, body_expr: exp}
				| BreakExp
				| LetExp      of {decl: dec list, body_expr: exp list}

		(*declarations*)
		and dec = TypeDec of typefield list   (*type declaration*)
				| FuncDec of funcfield list   (*function declaration*)
				| VarDec  of varfield         (*variable declaration*)

		and typ = alias  of type_id                   (*type alias*)
				| record of typefield list   (*record type*)
				| arr    of type_id                   (*array type*)

		and var = SimpleVar of id        (*variable*)
				| FieldVar  of var * id  (*field varibale*)
				| ArrVar    of var * exp     (*array variable*)

		(*classfields - including variable field, type field and function field*)
		and	varfield = Varf of { id_name   : id
								, ty    : type_id option
								, first_i  : exp
								}

		and typefield = Typef of { id_name : id
								, ty    : typ
								}

		and funcfield = Funcf of { id_name       : id
								, fun_args   : typefield list
								, result_type : type_id option
								, body_expr        : exp
								}

end
