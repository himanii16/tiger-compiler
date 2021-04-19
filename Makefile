%.lex.sml: %.lex
	mllex $<

%.grm.sml: %.grm
	mlyacc $<

all: tc 
	
test: all 
	  ./tc test/ex1.tig 
	  ./tc test/ex2.tig 
	  ./tc test/ex3.tig 
	  ./tc test/ex4.tig 

.PHONY: all clean test

clean: 
	rm -f tiger/*.lex.sml
	rm -f tiger/*.grm.sml tiger/*.grm.desc tiger/*grm.sig tc 
	rm -f target/mips tiger/ast

tc: tiger/printast.sml tc.sml tc.mlb tiger/tiger.grm.sml tiger/tiger.lex.sml
	mlton tc.mlb

