%.lex.sml: %.lex
	mllex $<

%.grm.sml: %.grm
	mlyacc $<

all: tc 
	
test: all 
	  ./tc test/queens.tig --pp > lab4/queens.out 
	  ./tc test/merge.tig --pp > lab4/merge.out
	  ./tc test/test1.tig --pp > lab4/test1.out
	  ./tc test/test2.tig --pp > lab4/test2.out
	  ./tc test/test3.tig --pp > lab4/test3.out
	  ./tc test/test4.tig --pp > lab4/test4.out
	  ./tc test/test5.tig --pp > lab4/test5.out
	  ./tc test/test6.tig --pp > lab4/test6.out
	  ./tc test/test7.tig --pp > lab4/test7.out
	  ./tc test/test8.tig --pp > lab4/test8.out
	  ./tc test/test9.tig --pp > lab4/test9.out
	  ./tc test/test10.tig --pp > lab4/test10.out
	  ./tc test/test11.tig --pp > lab4/test11.out
	  ./tc test/test12.tig --pp > lab4/test12.out
	  ./tc test/test13.tig --pp > lab4/test13.out
	  ./tc test/test14.tig --pp > lab4/test14.out
	  ./tc test/test15.tig --pp > lab4/test15.out
	  ./tc test/test16.tig --pp > lab4/test16.out
	  ./tc test/test17.tig --pp > lab4/test17.out
	  ./tc test/test18.tig --pp > lab4/test18.out
	  ./tc test/test19.tig --pp > lab4/test19.out
	  ./tc test/test20.tig --pp > lab4/test20.out
	  ./tc test/test21.tig --pp > lab4/test21.out
	  ./tc test/test22.tig --pp > lab4/test22.out
	  ./tc test/test23.tig --pp > lab4/test23.out
	  ./tc test/test24.tig --pp > lab4/test24.out
	  ./tc test/test25.tig --pp > lab4/test25.out
	  ./tc test/test26.tig --pp > lab4/test26.out
	  ./tc test/test27.tig --pp > lab4/test27.out
	  ./tc test/test28.tig --pp > lab4/test28.out
	  ./tc test/test29.tig --pp > lab4/test29.out
	  ./tc test/test30.tig --pp > lab4/test30.out
	  ./tc test/test31.tig --pp > lab4/test31.out
	  ./tc test/test32.tig --pp > lab4/test32.out
	  ./tc test/test34.tig --pp > lab4/test34.out
	  ./tc test/test35.tig --pp > lab4/test35.out
	  ./tc test/test36.tig --pp > lab4/test36.out
	  ./tc test/test37.tig --pp > lab4/test37.out
	  ./tc test/test38.tig --pp > lab4/test38.out
	  ./tc test/test39.tig --pp > lab4/test39.out
	  ./tc test/test40.tig --pp > lab4/test40.out
	  ./tc test/test41.tig --pp > lab4/test41.out
	  ./tc test/test42.tig --pp > lab4/test42.out
	  ./tc test/test43.tig --pp > lab4/test43.out
	  ./tc test/test44.tig --pp > lab4/test44.out
	  ./tc test/test45.tig --pp > lab4/test45.out
	  ./tc test/test46.tig --pp > lab4/test46.out
	  ./tc test/test47.tig --pp > lab4/test47.out
	  ./tc test/test48.tig --pp > lab4/test48.out
	  
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
	  ./tc test/test9.tig --ast > lab3/test9.out
	  ./tc test/test10.tig --ast > lab3/test10.out
	  ./tc test/test11.tig --ast > lab3/test11.out
	  ./tc test/test12.tig --ast > lab3/test12.out
	  ./tc test/test13.tig --ast > lab3/test13.out
	  ./tc test/test14.tig --ast > lab3/test14.out
	  ./tc test/test15.tig --ast > lab3/test15.out
	  ./tc test/test16.tig --ast > lab3/test16.out
	  ./tc test/test17.tig --ast > lab3/test17.out
	  ./tc test/test18.tig --ast > lab3/test18.out
	  ./tc test/test19.tig --ast > lab3/test19.out
	  ./tc test/test20.tig --ast > lab3/test20.out
	  ./tc test/test21.tig --ast > lab3/test21.out
	  ./tc test/test22.tig --ast > lab3/test22.out
	  ./tc test/test23.tig --ast > lab3/test23.out
	  ./tc test/test24.tig --ast > lab3/test24.out
	  ./tc test/test25.tig --ast > lab3/test25.out
	  ./tc test/test26.tig --ast > lab3/test26.out
	  ./tc test/test27.tig --ast > lab3/test27.out
	  ./tc test/test28.tig --ast > lab3/test28.out
	  ./tc test/test29.tig --ast > lab3/test29.out
	  ./tc test/test30.tig --ast > lab3/test30.out
	  ./tc test/test31.tig --ast > lab3/test31.out
	  ./tc test/test32.tig --ast > lab3/test32.out
	  ./tc test/test34.tig --ast > lab3/test34.out
	  ./tc test/test35.tig --ast > lab3/test35.out
	  ./tc test/test36.tig --ast > lab3/test36.out
	  ./tc test/test37.tig --ast > lab3/test37.out
	  ./tc test/test38.tig --ast > lab3/test38.out
	  ./tc test/test39.tig --ast > lab3/test39.out
	  ./tc test/test40.tig --ast > lab3/test40.out
	  ./tc test/test41.tig --ast > lab3/test41.out
	  ./tc test/test42.tig --ast > lab3/test42.out
	  ./tc test/test43.tig --ast > lab3/test43.out
	  ./tc test/test44.tig --ast > lab3/test44.out
	  ./tc test/test45.tig --ast > lab3/test45.out
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

