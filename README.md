## Repository for Compiler Lab 

Name - Himani Jain

Roll No. - 111801016

## TIGER COMPILER

The folder tiger contains the tiger files - tiger.lex, tiger.grm, tc.sml, printast.sml and ast.sml. 

The folder target contains the target files - mips.sml and pp.sml.

The folder test contains some test files of the tiger language. There are 4 such example files. It should be noted that to run the test file, command line argument must have 2 commands which should be like the ones shown below in printing section. 

The ir part is incomplete since the deadline is not yet over and we can submit it by next week. Kindly don't consider it as per now. 

### COMPILING

To generate the tiger executable, run one of the following command 
```bash
make 
make all
```

### GENERATING AST 

To print ast after compiling of ex1.tig from the test folder(similar can be done for other .tig files), run one of the following command(giving argument ast)
```bash
./tc test/test1.tig --ast
./tc --ast test/test1.tig 
```

### PRETTY PRINTING

To pretty print the program after compiling of ex1.tig from the test folder(similar can be done for other .tig files), run one of the following command(giving argument pp)
```bash
./tc test/test1.tig --pp
./tc --pp test/test1.tig
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




