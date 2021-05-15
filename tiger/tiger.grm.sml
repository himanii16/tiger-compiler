functor TigerLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Tiger_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(*#line 1.2 "tiger.grm"*)(* user declaration here *)


(*#line 14.1 "tiger.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\016\000\002\000\015\000\003\000\014\000\004\000\013\000\
\\008\000\012\000\018\000\011\000\021\000\010\000\022\000\009\000\
\\025\000\008\000\029\000\007\000\040\000\006\000\000\000\
\\001\000\002\000\041\000\000\000\
\\001\000\002\000\049\000\000\000\
\\001\000\002\000\067\000\000\000\
\\001\000\002\000\068\000\000\000\
\\001\000\002\000\069\000\000\000\
\\001\000\002\000\074\000\000\000\
\\001\000\002\000\099\000\017\000\098\000\042\000\097\000\000\000\
\\001\000\002\000\100\000\000\000\
\\001\000\002\000\106\000\000\000\
\\001\000\002\000\123\000\000\000\
\\001\000\002\000\128\000\000\000\
\\001\000\002\000\131\000\000\000\
\\001\000\005\000\182\000\006\000\182\000\007\000\182\000\008\000\182\000\
\\009\000\182\000\010\000\182\000\011\000\182\000\012\000\182\000\
\\013\000\182\000\014\000\182\000\015\000\182\000\016\000\182\000\
\\019\000\182\000\020\000\182\000\023\000\182\000\024\000\182\000\
\\026\000\182\000\027\000\182\000\030\000\182\000\031\000\182\000\
\\032\000\182\000\035\000\182\000\037\000\182\000\039\000\182\000\
\\041\000\182\000\043\000\182\000\044\000\182\000\046\000\182\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\019\000\072\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\023\000\104\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\024\000\071\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\024\000\129\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\039\000\093\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\039\000\110\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\155\000\016\000\155\000\019\000\155\000\020\000\155\000\
\\023\000\155\000\024\000\155\000\026\000\155\000\027\000\155\000\
\\030\000\155\000\031\000\155\000\032\000\155\000\037\000\155\000\
\\039\000\155\000\041\000\155\000\043\000\155\000\044\000\155\000\
\\046\000\155\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\156\000\016\000\156\000\019\000\156\000\020\000\156\000\
\\023\000\156\000\024\000\156\000\026\000\156\000\027\000\156\000\
\\030\000\156\000\031\000\156\000\032\000\156\000\037\000\156\000\
\\039\000\156\000\041\000\156\000\043\000\156\000\044\000\156\000\
\\046\000\156\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\157\000\016\000\157\000\019\000\157\000\020\000\157\000\
\\023\000\157\000\024\000\157\000\026\000\157\000\027\000\157\000\
\\030\000\157\000\031\000\157\000\032\000\157\000\037\000\157\000\
\\039\000\157\000\041\000\157\000\043\000\157\000\044\000\157\000\
\\046\000\157\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\158\000\016\000\158\000\019\000\158\000\020\000\158\000\
\\023\000\158\000\024\000\158\000\026\000\158\000\027\000\158\000\
\\030\000\158\000\031\000\158\000\032\000\158\000\037\000\158\000\
\\039\000\158\000\041\000\158\000\043\000\158\000\044\000\158\000\
\\046\000\158\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\159\000\016\000\159\000\019\000\159\000\020\000\159\000\
\\023\000\159\000\024\000\159\000\026\000\159\000\027\000\159\000\
\\030\000\159\000\031\000\159\000\032\000\159\000\037\000\159\000\
\\039\000\159\000\041\000\159\000\043\000\159\000\044\000\159\000\
\\046\000\159\000\000\000\
\\001\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\015\000\160\000\016\000\160\000\019\000\160\000\020\000\160\000\
\\023\000\160\000\024\000\160\000\026\000\160\000\027\000\160\000\
\\030\000\160\000\031\000\160\000\032\000\160\000\037\000\160\000\
\\039\000\160\000\041\000\160\000\043\000\160\000\044\000\160\000\
\\046\000\160\000\000\000\
\\001\000\011\000\081\000\000\000\
\\001\000\011\000\090\000\000\000\
\\001\000\011\000\120\000\000\000\
\\001\000\011\000\126\000\036\000\125\000\000\000\
\\001\000\011\000\135\000\000\000\
\\001\000\026\000\065\000\000\000\
\\001\000\027\000\095\000\000\000\
\\001\000\028\000\113\000\000\000\
\\001\000\035\000\070\000\000\000\
\\001\000\035\000\083\000\036\000\082\000\000\000\
\\001\000\035\000\114\000\000\000\
\\001\000\040\000\084\000\000\000\
\\001\000\041\000\063\000\000\000\
\\001\000\041\000\091\000\000\000\
\\001\000\041\000\115\000\000\000\
\\001\000\043\000\089\000\044\000\088\000\000\000\
\\001\000\043\000\122\000\000\000\
\\001\000\046\000\000\000\000\000\
\\141\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\142\000\001\000\016\000\002\000\015\000\003\000\014\000\004\000\013\000\
\\008\000\012\000\018\000\011\000\021\000\010\000\022\000\009\000\
\\025\000\008\000\029\000\007\000\040\000\006\000\000\000\
\\143\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\037\000\064\000\000\000\
\\144\000\000\000\
\\145\000\000\000\
\\146\000\000\000\
\\147\000\000\000\
\\148\000\035\000\018\000\045\000\017\000\000\000\
\\149\000\000\000\
\\150\000\005\000\030\000\006\000\029\000\000\000\
\\151\000\005\000\030\000\006\000\029\000\000\000\
\\152\000\005\000\030\000\006\000\029\000\000\000\
\\153\000\000\000\
\\154\000\000\000\
\\161\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\000\000\
\\162\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\000\000\
\\163\000\000\000\
\\164\000\000\000\
\\165\000\000\000\
\\166\000\000\000\
\\167\000\020\000\105\000\000\000\
\\168\000\000\000\
\\169\000\000\000\
\\170\000\000\000\
\\171\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\172\000\000\000\
\\173\000\001\000\016\000\002\000\015\000\003\000\014\000\004\000\013\000\
\\008\000\012\000\018\000\011\000\021\000\010\000\022\000\009\000\
\\025\000\008\000\029\000\007\000\040\000\006\000\000\000\
\\174\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\044\000\092\000\000\000\
\\175\000\000\000\
\\176\000\000\000\
\\177\000\000\000\
\\178\000\000\000\
\\179\000\030\000\040\000\031\000\039\000\032\000\038\000\000\000\
\\180\000\000\000\
\\181\000\038\000\047\000\040\000\046\000\042\000\045\000\000\000\
\\181\000\038\000\078\000\000\000\
\\183\000\000\000\
\\183\000\028\000\109\000\000\000\
\\184\000\000\000\
\\185\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\186\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\187\000\032\000\038\000\000\000\
\\188\000\000\000\
\\189\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\030\000\040\000\000\000\
\\190\000\000\000\
\\191\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\
\\030\000\040\000\000\000\
\\192\000\000\000\
\\193\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\194\000\005\000\030\000\006\000\029\000\007\000\028\000\008\000\027\000\
\\009\000\026\000\010\000\025\000\011\000\024\000\012\000\023\000\
\\013\000\022\000\014\000\021\000\015\000\020\000\016\000\019\000\000\000\
\\195\000\000\000\
\\196\000\000\000\
\\197\000\000\000\
\\198\000\002\000\103\000\000\000\
\\199\000\036\000\117\000\044\000\116\000\000\000\
\\200\000\000\000\
\\201\000\044\000\133\000\000\000\
\\202\000\000\000\
\"
val actionRowNumbers =
"\000\000\052\000\051\000\044\000\
\\045\000\067\000\076\000\001\000\
\\000\000\000\000\000\000\049\000\
\\050\000\078\000\048\000\002\000\
\\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\
\\000\000\038\000\046\000\075\000\
\\074\000\073\000\031\000\076\000\
\\003\000\004\000\005\000\034\000\
\\016\000\014\000\053\000\006\000\
\\070\000\000\000\013\000\079\000\
\\068\000\059\000\058\000\025\000\
\\024\000\023\000\022\000\021\000\
\\020\000\055\000\054\000\057\000\
\\056\000\062\000\045\000\045\000\
\\077\000\026\000\035\000\037\000\
\\000\000\000\000\000\000\041\000\
\\027\000\039\000\071\000\018\000\
\\000\000\047\000\032\000\007\000\
\\008\000\000\000\096\000\015\000\
\\065\000\064\000\009\000\082\000\
\\000\000\060\000\070\000\081\000\
\\019\000\069\000\085\000\096\000\
\\033\000\093\000\036\000\091\000\
\\040\000\097\000\000\000\000\000\
\\028\000\083\000\072\000\000\000\
\\080\000\086\000\042\000\010\000\
\\000\000\029\000\096\000\011\000\
\\017\000\063\000\000\000\061\000\
\\094\000\095\000\092\000\012\000\
\\000\000\098\000\099\000\000\000\
\\084\000\030\000\087\000\096\000\
\\066\000\000\000\088\000\100\000\
\\089\000\090\000\043\000"
val gotoT =
"\
\\001\000\003\000\005\000\138\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\030\000\002\000\029\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\003\000\035\000\004\000\034\000\010\000\033\000\011\000\032\000\
\\012\000\031\000\000\000\
\\000\000\
\\001\000\040\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\041\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\042\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\046\000\000\000\
\\001\000\048\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\049\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\050\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\051\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\052\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\053\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\054\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\055\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\056\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\057\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\058\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\059\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\060\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\003\000\035\000\004\000\064\000\010\000\033\000\011\000\032\000\
\\012\000\031\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\071\000\000\000\
\\001\000\074\000\006\000\073\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\075\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\030\000\002\000\077\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\030\000\002\000\078\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\083\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\084\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\085\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\092\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\013\000\094\000\000\000\
\\000\000\
\\001\000\099\000\007\000\002\000\008\000\001\000\000\000\
\\014\000\100\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\105\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\001\000\074\000\006\000\106\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\109\000\000\000\
\\014\000\110\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\116\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\117\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\119\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\122\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\014\000\125\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\128\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\130\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\001\000\132\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\011\000\134\000\000\000\
\\014\000\135\000\000\000\
\\000\000\
\\001\000\136\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\011\000\137\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 139
val numrules = 62
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | STRING of  (string) | INT of  (int) | ID of  (Ast.id) | TYFIELD of  (Ast.tyfield list) | TY of  (Ast.typ) | VARDEC of  (Ast.varfield) | FUNCDEC of  (Ast.funcfield list) | TYPEDEC of  ( ( Ast.id * Ast.typ )  list) | ARGS of  ( ( Ast.id * Ast.exp )  list) | RECORD of  (Ast.exp) | LVALUE of  (Ast.var) | PARAM of  (Ast.exp list) | PROGRAM of  (Ast.program) | DECS of  (Ast.dec list) | DEC of  (Ast.dec) | EXPS of  (Ast.exp list) | EXP of  (Ast.exp)
end
type svalue = MlyValue.svalue
type result = Ast.program
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
(nil
,nil
 $$ (T 18))::
(nil
,nil
 $$ (T 19))::
(nil
,nil
 $$ (T 39))::
nil
val noShift = 
fn (T 45) => true | _ => false
val showTerminal =
fn (T 0) => "NIL"
  | (T 1) => "ID"
  | (T 2) => "INT"
  | (T 3) => "STRING"
  | (T 4) => "MUL"
  | (T 5) => "DIV"
  | (T 6) => "PLUS"
  | (T 7) => "MINUS"
  | (T 8) => "GEQ"
  | (T 9) => "LEQ"
  | (T 10) => "EQ"
  | (T 11) => "NEQ"
  | (T 12) => "GT"
  | (T 13) => "LT"
  | (T 14) => "AND"
  | (T 15) => "OR"
  | (T 16) => "ARRAY"
  | (T 17) => "IF"
  | (T 18) => "THEN"
  | (T 19) => "ELSE"
  | (T 20) => "WHILE"
  | (T 21) => "FOR"
  | (T 22) => "TO"
  | (T 23) => "DO"
  | (T 24) => "LET"
  | (T 25) => "IN"
  | (T 26) => "END"
  | (T 27) => "OF"
  | (T 28) => "BREAK"
  | (T 29) => "FUNCTION"
  | (T 30) => "VAR"
  | (T 31) => "TYPE"
  | (T 32) => "IMPORT"
  | (T 33) => "PRIMITIVE"
  | (T 34) => "ASSIGN"
  | (T 35) => "COLON"
  | (T 36) => "SEMICOLON"
  | (T 37) => "LBRAC"
  | (T 38) => "RBRAC"
  | (T 39) => "LPAREN"
  | (T 40) => "RPAREN"
  | (T 41) => "LBRACE"
  | (T 42) => "RBRACE"
  | (T 43) => "COMMA"
  | (T 44) => "DOT"
  | (T 45) => "EOF"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 64.32 "tiger.grm"*)Ast.Expression EXP(*#line 541.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, EXP1right), rest671)
end
|  ( 1, ( rest671)) => let val  result = MlyValue.EXPS ((*#line 66.33 "tiger.grm"*)[Ast.Nil](*#line 545.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 2, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 67.33 "tiger.grm"*)[EXP](*#line 549.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXP1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 68.33 "tiger.grm"*)EXP :: EXPS(*#line 553.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 4, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 70.30 "tiger.grm"*)Ast.Nil(*#line 557.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, NIL1left, NIL1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.STRING STRING, STRING1left, STRING1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 71.30 "tiger.grm"*)Ast.StringConst STRING(*#line 561.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, STRING1left, STRING1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.INT INT, INT1left, INT1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 72.30 "tiger.grm"*)Ast.IntConst INT(*#line 565.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, INT1left, INT1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, LVALUE1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 73.30 "tiger.grm"*)Ast.Lvalue LVALUE(*#line 569.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LVALUE1left, LVALUE1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.RECORD RECORD, RECORD1left, RECORD1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 74.30 "tiger.grm"*)RECORD(*#line 573.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, RECORD1left, RECORD1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: ( _, ( _, MINUS1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 75.30 "tiger.grm"*)Ast.NegativeExp EXP(*#line 577.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, MINUS1left, EXP1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 76.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Plus, right = EXP2})(*#line 581.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 77.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Minus, right = EXP2})(*#line 585.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 78.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Mul, right = EXP2})(*#line 589.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 79.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Div, right = EXP2})(*#line 593.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 80.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.GEQ, right = EXP2})(*#line 597.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 81.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.LEQ, right = EXP2})(*#line 601.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 82.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.EQ, right = EXP2})(*#line 605.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 83.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.NEQ, right = EXP2})(*#line 609.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 84.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.GT, right = EXP2})(*#line 613.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 85.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.LT, right = EXP2})(*#line 617.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 86.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.AND, right = EXP2})(*#line 621.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 87.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.OR, right = EXP2})(*#line 625.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 22, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.PARAM PARAM, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 88.33 "tiger.grm"*)Ast.FuncCall ({func_id = ID, fun_args = PARAM})(*#line 629.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, RPAREN1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 89.34 "tiger.grm"*)Ast.ArrExp ({arr_id = ID, arr_size = EXP1, first_i = EXP2})(*#line 633.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, EXP2right), rest671)
end
|  ( 24, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXPS EXPS, _, _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 90.30 "tiger.grm"*)Ast.SeqExp (EXPS)(*#line 637.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LPAREN1left, RPAREN1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 91.34 "tiger.grm"*)Ast.IfExp ({if_cond = EXP1, body_if = EXP2, otherwise = EXP3})(*#line 641.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, IF1left, EXP3right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 92.34 "tiger.grm"*)Ast.IfThenExp ({ifthen_cond = EXP1, body_ifthen = EXP2})(*#line 645.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, IF1left, EXP2right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 93.34 "tiger.grm"*)Ast.WhileExp ({test_cond = EXP1, body_while = EXP2})(*#line 649.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, WHILE1left, EXP2right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FOR1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 94.40 "tiger.grm"*)Ast.ForExp ({for_id = ID, first_e = EXP1, final_e = EXP2, body_for = EXP3})(*#line 653.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, FOR1left, EXP3right), rest671)
end
|  ( 29, ( ( _, ( _, BREAK1left, BREAK1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 95.35 "tiger.grm"*)Ast.BreakExp(*#line 657.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, BREAK1left, BREAK1right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 96.34 "tiger.grm"*)Ast.AssignExp ({assign_var = LVALUE, assignment = EXP})(*#line 661.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LVALUE1left, EXP1right), rest671)
end
|  ( 31, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.EXPS EXPS, _, _)) :: _ :: ( _, ( MlyValue.DECS DECS, _, _)) :: ( _, ( _, LET1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 97.35 "tiger.grm"*)Ast.LetExp ({decl = DECS, body_expr = Ast.SeqExp (EXPS)})(*#line 665.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 32, ( rest671)) => let val  result = MlyValue.PARAM ((*#line 99.30 "tiger.grm"*)[](*#line 669.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, defaultPos, defaultPos), rest671)
end
|  ( 33, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.PARAM ((*#line 100.30 "tiger.grm"*)[EXP](*#line 673.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, EXP1left, EXP1right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.PARAM PARAM, _, PARAM1right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.PARAM ((*#line 101.30 "tiger.grm"*)EXP :: PARAM(*#line 677.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, EXP1left, PARAM1right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.TYPEDEC TYPEDEC, TYPEDEC1left, TYPEDEC1right)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 103.30 "tiger.grm"*)Ast.TypeDec TYPEDEC(*#line 681.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, TYPEDEC1left, TYPEDEC1right), rest671)
end
|  ( 36, ( ( _, ( MlyValue.FUNCDEC FUNCDEC, FUNCDEC1left, FUNCDEC1right)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 104.30 "tiger.grm"*)Ast.FuncDec FUNCDEC(*#line 685.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, FUNCDEC1left, FUNCDEC1right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.VARDEC VARDEC, VARDEC1left, VARDEC1right)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 105.30 "tiger.grm"*)Ast.VarDec VARDEC(*#line 689.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, VARDEC1left, VARDEC1right), rest671)
end
|  ( 38, ( rest671)) => let val  result = MlyValue.DECS ((*#line 107.39 "tiger.grm"*)[](*#line 693.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, defaultPos, defaultPos), rest671)
end
|  ( 39, ( ( _, ( MlyValue.DECS DECS, _, DECS1right)) :: ( _, ( MlyValue.DEC DEC, DEC1left, _)) :: rest671)) => let val  result = MlyValue.DECS ((*#line 108.30 "tiger.grm"*)DEC :: DECS(*#line 697.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, DEC1left, DECS1right), rest671)
end
|  ( 40, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 110.36 "tiger.grm"*)Ast.SimpleVar (ID)(*#line 701.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, ID1right), rest671)
end
|  ( 41, ( ( _, ( MlyValue.LVALUE LVALUE2, _, LVALUE2right)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE1, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 111.38 "tiger.grm"*)Ast.FieldVar (LVALUE1, LVALUE2)(*#line 705.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, LVALUE1left, LVALUE2right), rest671)
end
|  ( 42, ( ( _, ( _, _, RBRAC1right)) :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 112.34 "tiger.grm"*)Ast.ArrVar (ID, EXP)(*#line 709.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, RBRAC1right), rest671)
end
|  ( 43, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.ARGS ARGS, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.RECORD ((*#line 114.34 "tiger.grm"*)Ast.RecordExp ({record_id = ID, field_elem = ARGS})(*#line 713.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, ID1left, RBRACE1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.ARGS ((*#line 116.34 "tiger.grm"*)(ID, EXP) :: [](*#line 717.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, ID1left, EXP1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: _ :: ( _, ( MlyValue.ARGS ARGS, ARGS1left, _)) :: rest671)) => let val  result = MlyValue.ARGS ((*#line 117.34 "tiger.grm"*)(ID, EXP) :: ARGS(*#line 721.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, ARGS1left, EXP1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.TY TY, _, TY1right)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, TYPE1left, _)) :: rest671)) => let val  result = MlyValue.TYPEDEC ((*#line 119.34 "tiger.grm"*)[(ID,TY)](*#line 725.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, TYPE1left, TY1right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.TYPEDEC TYPEDEC, _, TYPEDEC1right)) :: ( _, ( MlyValue.TY TY, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, TYPE1left, _)) :: rest671)) => let val  result = MlyValue.TYPEDEC ((*#line 120.37 "tiger.grm"*)(ID,TY)::TYPEDEC(*#line 729.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, TYPE1left, TYPEDEC1right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC ((*#line 122.53 "tiger.grm"*)[Ast.Funcf ({funcf_id = ID, fun_args = TYFIELD, result_type = NONE, funcf_body = EXP})](*#line 733.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 49, ( ( _, ( MlyValue.FUNCDEC FUNCDEC, _, FUNCDEC1right)) :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC ((*#line 123.61 "tiger.grm"*)Ast.Funcf ({funcf_id = ID, fun_args = TYFIELD, result_type = NONE, funcf_body = EXP}) :: FUNCDEC(*#line 737.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, FUNCTION1left, FUNCDEC1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC ((*#line 124.62 "tiger.grm"*)[Ast.Funcf ({funcf_id = ID1, fun_args = TYFIELD, result_type = SOME(ID2), funcf_body = EXP})](*#line 741.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.FUNCDEC FUNCDEC, _, FUNCDEC1right)) :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC ((*#line 125.70 "tiger.grm"*)Ast.Funcf ({funcf_id = ID1, fun_args = TYFIELD, result_type = SOME(ID2), funcf_body = EXP}) :: FUNCDEC(*#line 745.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, FUNCTION1left, FUNCDEC1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.VARDEC ((*#line 127.42 "tiger.grm"*)Ast.Varf ({varf_id = ID, varf_ty = NONE, varf_first = EXP})(*#line 749.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, VAR1left, EXP1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.VARDEC ((*#line 128.42 "tiger.grm"*)Ast.Varf ({varf_id = ID1, varf_ty = SOME(ID2), varf_first = EXP})(*#line 753.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, VAR1left, EXP1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.TY ((*#line 130.34 "tiger.grm"*)Ast.alias (ID)(*#line 757.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, ID1left, ID1right), rest671)
end
|  ( 55, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: ( _, ( _, LBRACE1left, _)) :: rest671)) => let val  result = MlyValue.TY ((*#line 131.34 "tiger.grm"*)Ast.record (TYFIELD)(*#line 761.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, LBRACE1left, RBRACE1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: _ :: ( _, ( _, ARRAY1left, _)) :: rest671)) => let val  result = MlyValue.TY ((*#line 132.34 "tiger.grm"*)Ast.arr (ID)(*#line 765.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, ARRAY1left, ID1right), rest671)
end
|  ( 57, ( rest671)) => let val  result = MlyValue.TYFIELD ((*#line 134.38 "tiger.grm"*)[](*#line 769.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, defaultPos, defaultPos), rest671)
end
|  ( 58, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 135.38 "tiger.grm"*)[(ID,NONE)](*#line 773.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, ID1left, ID1right), rest671)
end
|  ( 59, ( ( _, ( MlyValue.TYFIELD TYFIELD, _, TYFIELD1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 136.38 "tiger.grm"*)(ID,NONE)::TYFIELD(*#line 777.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, ID1left, TYFIELD1right), rest671)
end
|  ( 60, ( ( _, ( MlyValue.ID ID2, _, ID2right)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 137.38 "tiger.grm"*)[(ID1,SOME(ID2))](*#line 781.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, ID1left, ID2right), rest671)
end
|  ( 61, ( ( _, ( MlyValue.TYFIELD TYFIELD, _, TYFIELD1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 138.38 "tiger.grm"*)(ID1,SOME(ID2)) :: TYFIELD(*#line 785.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, ID1left, TYFIELD1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : Tiger_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.ID i,p1,p2))
fun INT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.INT i,p1,p2))
fun STRING (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.STRING i,p1,p2))
fun MUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.VOID,p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID,p1,p2))
fun GEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID,p1,p2))
fun LEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID,p1,p2))
fun EQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID,p1,p2))
fun NEQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.VOID,p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.VOID,p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.VOID,p1,p2))
fun ARRAY (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(ParserData.MlyValue.VOID,p1,p2))
fun OF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(ParserData.MlyValue.VOID,p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(ParserData.MlyValue.VOID,p1,p2))
fun FUNCTION (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(ParserData.MlyValue.VOID,p1,p2))
fun VAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(ParserData.MlyValue.VOID,p1,p2))
fun TYPE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(ParserData.MlyValue.VOID,p1,p2))
fun IMPORT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(ParserData.MlyValue.VOID,p1,p2))
fun PRIMITIVE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(ParserData.MlyValue.VOID,p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(ParserData.MlyValue.VOID,p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(ParserData.MlyValue.VOID,p1,p2))
fun LBRAC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(ParserData.MlyValue.VOID,p1,p2))
fun RBRAC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(ParserData.MlyValue.VOID,p1,p2))
fun LPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(ParserData.MlyValue.VOID,p1,p2))
fun RPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(ParserData.MlyValue.VOID,p1,p2))
fun LBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(ParserData.MlyValue.VOID,p1,p2))
fun RBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(ParserData.MlyValue.VOID,p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(ParserData.MlyValue.VOID,p1,p2))
fun DOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(ParserData.MlyValue.VOID,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(ParserData.MlyValue.VOID,p1,p2))
end
end
