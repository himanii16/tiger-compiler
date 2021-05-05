## Repository for Compiler Lab 

Name - Himani Jain

Roll No. - 111801016

## TIGER COMPILER

The folder tiger contains the tiger files - tiger.lex, tiger.grm, tc.sml, printast.sml and ast.sml. 

The folder target contains the target files - mips.sml and pp.sml.

The folder ir contains the intermediate representation files including - canon.sml, environment.sml, printtree.sml,temp.sml, tree.sml, tree.sig.

The ir part is doesn't yet support all the cases. 

### COMPILING

To generate the tiger executable, run one of the following command 
```bash
make 
make all
```

### GENERATING AST 

To print ast after compiling of test1.tig from the test folder(similar can be done for other .tig files), run one of the following command(giving argument --ast)
```bash
./tc test/test1.tig --ast
./tc --ast test/test1.tig 
```

### PRETTY PRINTING

To pretty print the program after compiling of test1.tig from the test folder(similar can be done for other .tig files), run one of the following command(giving argument --pp)
```bash
./tc test/test1.tig --pp
./tc --pp test/test1.tig
```

### Intermediate Representation

To print the ir tree of the program after compiling of test1.tig from the test folder(similar can be done for other .tig files), run one of the following command(giving argument --ir)
```bash
./tc test/test1.tig --ir
./tc --ir test/test1.tig
```

### TEST CASES

To run all the test cases
```bash
make test
```

### CLEAN

To remove all the intermediate files, and the executable tc from the root directory.
```bash
make clean
```




