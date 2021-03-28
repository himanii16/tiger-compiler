## TIGER COMPILER

The folder Tiger contains the tiger files - tiger.lex, tiger.grm, tc.sml, printast.sml and ast.sml. 

The folder Target contains the target files - mips.sml and pp.sml.

The folder test contains some test files of the tiger language. There are 4 such example files. 

### COMPILING

To generate the tiger executable, run one of the following command 
```bash
make 
make all
```

### GENERATING AST 

To print ast after compiling of ex1.tig from the test folder(similar can be done for other .tig files), run the following command(giving argument ast)
```bash
./tiger test/ex1.tig ast
```

### PRETTY PRINTING

To pretty print the program after compiling of ex1.tig from the test folder(similar can be done for other .tig files), run the following command(giving argument pp)
```bash
./tiger test/ex1.tig pp
```
### BOTH

To print ast and the program both, run the following command(giving no argument)
```bash
./tiger test/ex1.tig
```

### TEST CASES

To run all the test cases
```bash
make test
```