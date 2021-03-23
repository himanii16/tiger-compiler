(*syntax and the fields which are included in this file are referenced from:
1. The appel's book
2. EPITA Reference
3. https://www.cs.cornell.edu/courses/cs312/2008sp/recitations/rec02.html
*)

structure Ast = 
struct

	(*exp ::= expression, decs ::= declarations*)
	type id = string
	type type_id = id
	type tyfield = id * type_id
	
	(*binaryOp datatype defines the valid operators*)
	(*GEQ : >= , LEQ : <= , EQ : = , NEQ : <> , GT : > , LT : <*)
	datatype binaryOp = Mul | Div | Plus | Minus | GEQ | LEQ | EQ | NEQ | GT | LT | AND | OR

	datatype program = Expression of exp 
	and		 exp = Nil 		 (*null*)

				(*string constant (literal)*)
				| StringConst of string

				(*integer constant (literal)*)
				| IntConst    of int
				
				(* Variables, field, elements of an array.*)
				| Lvalue      of var

				(*binary operation expressions*)
				| BinOpExp    of {left: exp, oper: binaryOp, right: exp}

				(*function call expression*)
				| FuncCall    of {func_id: id, fun_args: exp list}

				(*array expression : init - initial value*)
				| ArrExp      of {arr_id: id, arr_size: exp, first_i: exp}

				(*Sequence expression*)
				| SeqExp      of exp list

				(*Record expression*)
				| RecordExp   of {record_id: id, field_elem: (id*exp) list}

				(* assigning expression*)
				| AssignExp   of {assign_var: var, assignment: exp}

				| NegativeExp of exp	

				(* Conditional expressions*)
				| IfExp       of {if_cond: exp, body_if: exp, otherwise: exp}
				| IfThenExp   of {ifthen_cond: exp, body_ifthen: exp}
				| WhileExp    of {test_cond: exp, body_while: exp}
				| ForExp      of {for_id: id, first_e: exp, final_e: exp, body_for: exp}
				| BreakExp
				| LetExp      of {decl: dec list, body_expr: exp}

		(*declarations*)
		and dec = TypeDec of (type_id*typ) list   (*type declaration*)
				| FuncDec of funcfield list   (*function declaration*)
				| VarDec  of varfield         (*variable declaration*)

		and typ = alias  of type_id                   (*type alias*)
				| record of tyfield list   (*record type*)
				| arr    of type_id                   (*array type*)

		and var = SimpleVar of id        (*variable*)
				| FieldVar  of var * id  (*field varibale*)
				| ArrVar    of id * exp     (*array variable*)

		(*classfields - including variable field, type field and function field*)
		and	varfield = Varf of { varf_id   : id
								, varf_ty    : type_id option
								, varf_first  : exp
								}

		and funcfield = Funcf of { funcf_id      : id
								, fun_args   : tyfield list
								, result_type : type_id option
								, funcf_body       : exp
								}

end
