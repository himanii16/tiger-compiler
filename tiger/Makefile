%.lex.sml: %.lex
	mllex $<

%.grm.sml: %.grm
	mlyacc $<

all: tiger
	
test: all
	  ${CURDIR}/rp test.inp

.PHONY: all clean test

clean: 
	rm -f *.lex.sml
	rm -f *.grm.sml *.grm.desc *grm.sig tiger

tiger: PrintAst.sml tc.sml tiger.mlb tiger.grm.sml tiger.lex.sml
	mlton tiger.mlb
	