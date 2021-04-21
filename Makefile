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
	  ./tc test/queens.tig 
	  ./tc test/merge.tig
	  ./tc test/test1.tig
	  ./tc test/test2.tig
	  ./tc test/test3.tig
	  ./tc test/test4.tig
	  ./tc test/test5.tig
	  ./tc test/test6.tig
	  ./tc test/test7.tig
	  ./tc test/test8.tig
	  ./tc test/test11.tig
	  ./tc test/test12.tig
	  ./tc test/test14.tig
	  ./tc test/test15.tig
	  ./tc test/test42.tig
	  ./tc test/test46.tig
	  ./tc test/test47.tig
	  ./tc test/test48.tig

.PHONY: all clean test

clean: 
	rm -f tiger/*.lex.sml
	rm -f tiger/*.grm.sml tiger/*.grm.desc tiger/*grm.sig tc 
	rm -f target/mips tiger/ast

tc: tiger/printast.sml tc.sml tc.mlb tiger/tiger.grm.sml tiger/tiger.lex.sml
	mlton tc.mlb

