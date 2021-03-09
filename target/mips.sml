(*Reference - 
1. https://www.dsi.unive.it/~architet/LAB/spim.htm#SPIM%20Interface
*)

structure MIPS = 
struct

	(*The MIPS (and SPIM) central processing unit contains 32 
	  general purpose registers that are numbered 0--31. *)
	datatype regs = zero | at | v0 | v1 | a0 | a1 | a2 | a3
                  	| t0 | t1 | t2 | t3 | t4 | t5 | t6 | t7 
                  	| s0 | s1 | s2 | s3 | s4 | s5 | s6 | s7 
                  	| t8 | t9 | k0 | k1 | gp | sp | fp | ra


	datatype ('l,'t) inst = add of 't * 't * 't
	                      | jump of 'l

	datatype ('l,'t) inst = (*Load and Store Instructions*)
								(*load instructions*)
								la   of 't * 'l 	(*Load Address*)
							|	lb   of 't * 'l 	(*Load Byte*)
							|	lbu  of 't * 'l 	(*Load Unsigned Byte*)
							|	ld   of 't * 'l 	(*Load Double word*)
							|	lh   of 't * 'l 	(*Load Half word*)
							|	lhu  of 't * 'l 	(*Load unsigned halfword*)
							|	lw   of 't * 'l 	(*Load word*)
							|	lwcz of 't * 'l 	(*Load word coprocessor*)
							|	lwl  of 't * 'l 	(*Load word left*)
							|	lwr  of 't * 'l 	(*Load word right*)

								(*store instruction*)
							|	sb   of 't * 'l 	(*Store Byte*)
							|	sd   of 't * 'l 	(*Store Double word*)
							|	sh   of 't * 'l 	(*Store Half word*)
							|	sw   of 't * 'l 	(*Store word*)
							|	swcz of 't * 'l 	(*Store word coprocessor*)
							|	swl  of 't * 'l 	(*Store word left*)
							|	swr  of 't * 'l 	(*Store word right*)

								(*load and store unaligned address*)
							|   ulh  of 't * 'l 	(*Unaligned Load Halfword*)
							| 	ulhu of 't * 'l 	(*Unaligned Load Halfword Unsigned*)
							|   ulw  of 't * 'l 	(*Unaligned Load Word*)
							|   ush  of 't * 'l 	(*Unaligned Store Halfword*)
							|   usw  of 't * 'l 	(*Unaligned Store Word*)

								(*Exception and Trap Instructions*)
							| 	rfe 				(*Return From Exception*)
							| 	syscall				(*System call*)
							|	break				(*nBreak*)
							| 	nop					(*no operation*)

								(*Constant-Manipulating Instructions*)
							|	li   of 't * int 	(*load immediate*)
							|	lui  of 't * int 	(*load upper immediate*)

								(*Arithmetic and Logical Instructions*)
							|	abs   of 't * 't 			(*abosulte value*)
							| 	add   of 't * 't * 't 		(*Addition (with overflow)*)
							| 	addi  of 't * 't * int 		(*Addition Immediate (with overflow)*)
							| 	addu  of 't * 't * 't 		(*Addition (without overflow)*)	
							| 	addiu of 't * 't * int 		(*Addition Immediate (without overflow)*)
							| 	andOp of 't * 't * 't 		(*AND*)
							| 	andi  of 't * 't * int 		(*AND IMMEDIATE*)
							| 	div   of 't * 't * 't 		(*Divide (with overflow)*)
							| 	divu  of 't * 't * 't 		(*Divide (without overflow)*)
							| 	mul   of 't * 't * 't 		(*Multiply (without overflow)*)
							| 	mulo  of 't * 't * 't 		(*Multiply (with overflow)*)
							| 	mulou of 't * 't * 't 		(*Unsigned Multiply (with overflow)*)
							| 	mult  of 't * 't 			(*Multiply*)	
							| 	multu of 't * 't 			(*Unsigned Multiply*)
							| 	neg   of 't * 't 			(*Negate Value (with overflow)*)	
							| 	negu  of 't * 't 			(*Negate Value (without overflow)*)
							|   nor   of 't * 't * 't 		(*NOR*)
							|   notOp of 't * 't 			(*NOT*)
							|   or    of 't * 't * 't 		(*OR*)
							|   ori   of 't * 't * int 		(*OR Immediate*)
							|   rem   of 't * 't * 't 		(*Remainder*)
							|   remu  of 't * 't * 't 		(*Unsigned Remainder*)
							|   rol   of 't * 't * 't 		(*Rotate Left*)
							|   ror   of 't * 't * 't 		(*Rotate Right*)
							|   sll   of 't * 't * 't     	(*Shift Left Logical*)
							|   sllv  of 't * 't * 't 		(*Shift Left Logical Variable*)
							|   sra   of 't * 't * 't 		(*Shift Right Arithmetic*)
							|   srav  of 't * 't * 't 		(*Shift Right Arithmetic Variable*)
							|   srl   of 't * 't * 't 		(*Shift Right Logical*)
							|   srlv  of 't * 't * 't 		(*Shift Right Logical Variable*)
							|  	sub   of 't * 't * 't 		(*Subtract (with overflow)*)
							|  	subu  of 't * 't * 't 		(*Subtract (without overflow)*)
							|   xor   of 't * 't * 't 		(*XOR*)
							|   xori  of 't * 't * int 		(*XOR Immediate*)

								(*Comparison Instructions*)
							|   seq   of 't * 't * 't 		(*Set Equal*)
							|   sge   of 't * 't * 't 		(*Set Greater Than Equal*)
							|   sgeu  of 't * 't * 't 		(*Set Greater Than Equal Unsigned*)
							|   sgt   of 't * 't * 't 		(*Set Greater Than*)
							|   sgtu  of 't * 't * 't 		(*Set Greater Than Unsigned*)
							|   sle   of 't * 't * 't 		(*Set Less Than Equal*)
							|   sleu  of 't * 't * 't 		(*Set Less Than Equal Unsigned*)
							|   slt   of 't * 't * 't 		(*Set Less Than*)
							|   slti  of 't * 't * int 		(*Set Less Than Immediate*)
							|   sltu  of 't * 't * 't 		(*Set Less Than Unsigned*)
							|   sltiu of 't * 't * int 		(*Set Less Than Unsigned Immediate*)
							|   sne   of 't * 't * 't  		(*Set Not Equal*)

								(*Branch and Jump Instructions*)
							|   b      of 'l 				(*Branch instruction*)
							|   bczt   of 'l 				(*Branch Coprocessor z True*)
							|   bczf   of 'l 				(*Branch Coprocessor z False*)
							|   beq    of 't * 't * 'l 		(*Branch on Equal*)
							|   beqz   of 't * 'l 			(*Branch on Equal Zero*)
							|   bge    of 't * 't * 'l 		(*Branch on Greater Than Equal*)
							|   bgeu   of 't * 't * 'l 		(*Branch on GTE Unsigned*)
							|   bgez   of 't * 'l 			(*Branch on Greater Than Equal Zero*)
							|   bgezal of 't * 'l 			(*Branch on Greater Than Equal Zero And Link*)
							|   bltzal of 't * 'l 			(*Branch on Less Than And Link*)
							|   bgt    of 't * 't * 'l 		(*Branch on Greater Than*)
							|   bgtu   of 't * 't * 'l 		(*Branch on Greater Than Unsigned*)
							|   bgtz   of 't * 'l 			(*Branch on Greater Than Zero*)
							|   ble    of 't * 't * 'l 		(*Branch on Less Than Equal*)
							|   bleu   of 't * 't * 'l 		(*Branch on LTE Unsigned*)
							|   blez   of 't * 'l 			(*Branch on Less Than Equal Zero*)                
							|   blt    of 't * 't * 'l 		(*Branch on Less Than*)
							|   bltu   of 't * 't * 'l 		(*Branch on Less Than Unsigned*)
							|   bltz   of 't * 'l 			(*Branch on Less Than Zero*)
							|   bne    of 't * 't * 'l 		(*Branch on Not Equal*)
							|   bnez   of 't * 'l 			(*Branch on Not Equal Zero*)
							|   j      of 'l 				(*Jump*)
							|   jal    of 'l 				(*Jump and Link*)
							|   jalr   of 't 				(*Jump and Link Register*)	
							|   jr     of 't 				(*Jump Register*)

								(*Data Movement Instructions*)
							|   move  of 't * 't 			(*Move*)
							|   mfhi  of 't 				(*Move From HI*)
							|   mflo  of 't 				(*Move From LO*)
							|   mthi  of 't 				(*Move To HI*)
							|   mtlo  of 't 				(*Move To LO*)
							|   mfcz  of 't * 't 			(*Move From Coprocessor z*)
							|   mtcz  of 't * 't 			(*Move To Coprocessor z*)


	datatype Label =  LUser of string
	            	| LTemp of int


end