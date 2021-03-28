%.lex.sml: %.lex
	mllex $<

%.grm.sml: %.grm
	mlyacc $<

all: tiger target
	
test: all 
	  ./tiger test/ex1.tig 
	  ./tiger test/ex2.tig 
	  ./tiger test/ex3.tig 
	  ./tiger test/ex4.tig 

.PHONY: all clean test

clean: 
	rm -f Tiger/*.lex.sml
	rm -f Tiger/*.grm.sml Tiger/*.grm.desc Tiger/*grm.sig tiger 
	rm -f Target/mips Tiger/ast

tiger: Tiger/printast.sml Tiger/tc.sml tiger.mlb Tiger/tiger.grm.sml Tiger/tiger.lex.sml
	mlton tiger.mlb
	
target: Target/mips.sml
	mlton Target/mips.sml