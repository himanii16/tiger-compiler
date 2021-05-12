%.lex.sml: %.lex
	mllex $<

%.grm.sml: %.grm
	mlyacc $<

all: tc 
	
test: all 
	  ./tc test/queens.tig --pp 
	  ./tc test/merge.tig --pp
	  ./tc test/test1.tig --pp
	  ./tc test/test2.tig --pp
	  ./tc test/test3.tig --pp
	  ./tc test/test4.tig --pp
	  ./tc test/test5.tig --pp
	  ./tc test/test6.tig --pp
	  ./tc test/test7.tig --pp
	  ./tc test/test8.tig --pp
	  ./tc test/test11.tig --pp
	  ./tc test/test12.tig --pp
	  ./tc test/test14.tig --pp
	  ./tc test/test15.tig --pp
	  ./tc test/test42.tig --pp
	  ./tc test/test46.tig --pp
	  ./tc test/test47.tig --pp
	  ./tc test/test48.tig --pp

.PHONY: all clean test

clean: 
	rm -f tiger/*.lex.sml
	rm -f tiger/*.grm.sml tiger/*.grm.desc tiger/*grm.sig tc 
	rm -f target/mips tiger/ast

tc: tiger/printast.sml tc.sml tc.mlb tiger/tiger.grm.sml tiger/tiger.lex.sml
	mlton tc.mlb

