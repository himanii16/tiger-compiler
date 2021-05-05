(* Tiger Compiler*)
structure TC =
struct 

structure TigerLrVals = TigerLrValsFun(structure Token = LrParser.Token)
structure TigerLex    = TigerLexFun(structure Tokens = TigerLrVals.Tokens)
structure TigerParser = Join( structure ParserData = TigerLrVals.ParserData
                            structure Lex        = TigerLex
                            structure LrParser   = LrParser
                        )

(* Build Lexers *)
fun makeTigerLexer strm = TigerParser.makeLexer (fn n => TextIO.inputN(strm,n))
val makeFileLexer      = makeTigerLexer o TextIO.openIn


(* Parse command line and set a suitable lexer *)

val thisLexer = case CommandLine.arguments() of
		    []  => makeTigerLexer TextIO.stdIn
		 |  [x] => makeFileLexer x
         |  [x1,x2] => let fun lexer (x) = makeFileLexer (x)
                        in 
                        if (x1="--ast") then  lexer (x2)
                        else if (x1="--pp") then lexer(x2)
                        else if (x1="--ir") then lexer(x2)
                        else lexer(x1) 
                        end 
		 |  _   => (TextIO.output(TextIO.stdErr, "usage: tc file"); OS.Process.exit OS.Process.failure)

fun print_error (s,i:int,_) = TextIO.output(TextIO.stdErr, "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")

val (program,_) = TigerParser.parse (0,thisLexer,print_error,()) (* parsing *)

val s = CommandLine.arguments() 

fun customized_printing() = let fun PP () = TextIO.output(TextIO.stdOut,pp.compile(program)) 
                                fun Ast () = PrintAst.print(TextIO.stdOut, program)
                                fun IR  () = Printtree.printtree(TextIO.stdOut, Translate.translate (program))
                                
                                fun head (xs) = case xs of []  => "empty"
                                                | ["--ast",_]  => "ast"
                                                | ["--pp",_]   => "pp"
                                                | [_,"--ast"]  => "ast"
                                                | [_,"--pp"]   => "pp" 
                                                | [_,"--ir"]   => "ir"
                                                | ["--ir",_]   => "ir"
                                                | _            => "none"
                            in 
                                if head(s) = "ast" then Ast()
                                else if head(s) = "ir" then IR()
                                else PP()
                            end 

val _ = customized_printing() 

end

