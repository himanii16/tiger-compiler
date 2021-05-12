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
	  
	  ./tc test/queens.tig --ast > lab3/queens.out 
	  ./tc test/merge.tig --ast > lab3/merge.out
	  ./tc test/test1.tig --ast > lab3/test1.out
	  ./tc test/test2.tig --ast > lab3/test2.out
	  ./tc test/test3.tig --ast > lab3/test3.out
	  ./tc test/test4.tig --ast > lab3/test4.out
	  ./tc test/test5.tig --ast > lab3/test5.out
	  ./tc test/test6.tig --ast > lab3/test6.out
	  ./tc test/test7.tig --ast > lab3/test7.out
	  ./tc test/test8.tig --ast > lab3/test8.out
	  ./tc test/test11.tig --ast > lab3/test11.out
	  ./tc test/test12.tig --ast > lab3/test12.out
	  ./tc test/test14.tig --ast > lab3/test14.out
	  ./tc test/test15.tig --ast > lab3/test15.out
	  ./tc test/test42.tig --ast > lab3/test42.out
	  ./tc test/test46.tig --ast > lab3/test46.out
	  ./tc test/test47.tig --ast > lab3/test47.out
	  ./tc test/test48.tig --ast > lab3/test48.out

.PHONY: all clean test

clean: 
	rm -f tiger/*.lex.sml
	rm -f tiger/*.grm.sml tiger/*.grm.desc tiger/*grm.sig tc 
	rm -f target/mips tiger/ast

tc: tiger/printast.sml tc.sml tc.mlb tiger/tiger.grm.sml tiger/tiger.lex.sml
	mlton tc.mlb

