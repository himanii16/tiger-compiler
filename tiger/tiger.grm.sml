functor LrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : _TOKENS
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
\\001\000\001\000\014\000\002\000\013\000\003\000\012\000\005\000\168\000\
\\006\000\168\000\007\000\168\000\008\000\168\000\009\000\168\000\
\\010\000\168\000\011\000\168\000\012\000\168\000\013\000\168\000\
\\014\000\168\000\015\000\168\000\016\000\168\000\018\000\011\000\
\\021\000\010\000\022\000\009\000\025\000\008\000\027\000\132\000\
\\029\000\007\000\037\000\168\000\040\000\006\000\041\000\132\000\
\\045\000\168\000\000\000\
\\001\000\001\000\014\000\002\000\013\000\003\000\012\000\005\000\168\000\
\\006\000\168\000\007\000\168\000\008\000\168\000\009\000\168\000\
\\010\000\168\000\011\000\168\000\012\000\168\000\013\000\168\000\
\\014\000\168\000\015\000\168\000\016\000\168\000\018\000\011\000\
\\021\000\010\000\022\000\009\000\025\000\008\000\027\000\132\000\
\\029\000\007\000\037\000\168\000\040\000\006\000\045\000\168\000\000\000\
\\001\000\001\000\014\000\002\000\013\000\003\000\012\000\005\000\168\000\
\\006\000\168\000\007\000\168\000\008\000\168\000\009\000\168\000\
\\010\000\168\000\011\000\168\000\012\000\168\000\013\000\168\000\
\\014\000\168\000\015\000\168\000\016\000\168\000\018\000\011\000\
\\021\000\010\000\022\000\009\000\025\000\008\000\029\000\007\000\
\\037\000\168\000\040\000\006\000\041\000\132\000\045\000\168\000\000\000\
\\001\000\002\000\037\000\000\000\
\\001\000\002\000\044\000\000\000\
\\001\000\002\000\061\000\000\000\
\\001\000\002\000\062\000\000\000\
\\001\000\002\000\063\000\000\000\
\\001\000\002\000\094\000\017\000\093\000\042\000\092\000\000\000\
\\001\000\002\000\095\000\000\000\
\\001\000\002\000\101\000\000\000\
\\001\000\002\000\116\000\000\000\
\\001\000\002\000\120\000\000\000\
\\001\000\002\000\123\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\019\000\066\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\023\000\099\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\024\000\065\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\024\000\121\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\037\000\058\000\041\000\057\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\037\000\089\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\039\000\087\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\143\000\016\000\143\000\019\000\143\000\020\000\143\000\
\\023\000\143\000\024\000\143\000\026\000\143\000\030\000\143\000\
\\031\000\143\000\032\000\143\000\037\000\143\000\039\000\143\000\
\\041\000\143\000\043\000\143\000\044\000\143\000\046\000\143\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\144\000\016\000\144\000\019\000\144\000\020\000\144\000\
\\023\000\144\000\024\000\144\000\026\000\144\000\030\000\144\000\
\\031\000\144\000\032\000\144\000\037\000\144\000\039\000\144\000\
\\041\000\144\000\043\000\144\000\044\000\144\000\046\000\144\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\145\000\016\000\145\000\019\000\145\000\020\000\145\000\
\\023\000\145\000\024\000\145\000\026\000\145\000\030\000\145\000\
\\031\000\145\000\032\000\145\000\037\000\145\000\039\000\145\000\
\\041\000\145\000\043\000\145\000\044\000\145\000\046\000\145\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\146\000\016\000\146\000\019\000\146\000\020\000\146\000\
\\023\000\146\000\024\000\146\000\026\000\146\000\030\000\146\000\
\\031\000\146\000\032\000\146\000\037\000\146\000\039\000\146\000\
\\041\000\146\000\043\000\146\000\044\000\146\000\046\000\146\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\147\000\016\000\147\000\019\000\147\000\020\000\147\000\
\\023\000\147\000\024\000\147\000\026\000\147\000\030\000\147\000\
\\031\000\147\000\032\000\147\000\037\000\147\000\039\000\147\000\
\\041\000\147\000\043\000\147\000\044\000\147\000\046\000\147\000\000\000\
\\001\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\015\000\148\000\016\000\148\000\019\000\148\000\020\000\148\000\
\\023\000\148\000\024\000\148\000\026\000\148\000\030\000\148\000\
\\031\000\148\000\032\000\148\000\037\000\148\000\039\000\148\000\
\\041\000\148\000\043\000\148\000\044\000\148\000\046\000\148\000\000\000\
\\001\000\011\000\075\000\000\000\
\\001\000\011\000\084\000\000\000\
\\001\000\011\000\113\000\000\000\
\\001\000\011\000\119\000\036\000\118\000\000\000\
\\001\000\011\000\127\000\000\000\
\\001\000\026\000\059\000\000\000\
\\001\000\027\000\090\000\000\000\
\\001\000\028\000\107\000\000\000\
\\001\000\035\000\064\000\000\000\
\\001\000\035\000\077\000\036\000\076\000\000\000\
\\001\000\035\000\108\000\000\000\
\\001\000\036\000\110\000\000\000\
\\001\000\040\000\078\000\000\000\
\\001\000\041\000\085\000\000\000\
\\001\000\041\000\088\000\000\000\
\\001\000\041\000\109\000\000\000\
\\001\000\043\000\083\000\044\000\082\000\000\000\
\\001\000\043\000\115\000\000\000\
\\001\000\046\000\000\000\000\000\
\\131\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\133\000\000\000\
\\134\000\000\000\
\\135\000\001\000\043\000\038\000\042\000\040\000\041\000\042\000\040\000\000\000\
\\136\000\000\000\
\\137\000\045\000\015\000\000\000\
\\138\000\000\000\
\\139\000\005\000\027\000\006\000\026\000\000\000\
\\140\000\005\000\027\000\006\000\026\000\000\000\
\\141\000\000\000\
\\142\000\000\000\
\\149\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\000\000\
\\150\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\000\000\
\\151\000\000\000\
\\152\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\153\000\000\000\
\\154\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\155\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\020\000\100\000\000\000\
\\156\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\157\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\158\000\000\000\
\\159\000\000\000\
\\160\000\000\000\
\\161\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\
\\044\000\086\000\000\000\
\\162\000\000\000\
\\163\000\000\000\
\\164\000\000\000\
\\165\000\000\000\
\\166\000\030\000\036\000\031\000\035\000\032\000\034\000\000\000\
\\167\000\000\000\
\\168\000\001\000\014\000\002\000\013\000\003\000\012\000\018\000\011\000\
\\021\000\010\000\022\000\009\000\025\000\008\000\029\000\007\000\
\\040\000\006\000\000\000\
\\169\000\000\000\
\\170\000\028\000\104\000\000\000\
\\171\000\000\000\
\\172\000\000\000\
\\173\000\004\000\068\000\000\000\
\\174\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\175\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\176\000\000\000\
\\177\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\178\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\179\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\180\000\005\000\027\000\006\000\026\000\007\000\025\000\008\000\024\000\
\\009\000\023\000\010\000\022\000\011\000\021\000\012\000\020\000\
\\013\000\019\000\014\000\018\000\015\000\017\000\016\000\016\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\002\000\098\000\000\000\
\\185\000\044\000\125\000\000\000\
\\186\000\000\000\
\"
val actionRowNumbers =
"\076\000\052\000\051\000\046\000\
\\076\000\066\000\074\000\003\000\
\\076\000\076\000\050\000\049\000\
\\048\000\004\000\076\000\076\000\
\\076\000\076\000\076\000\076\000\
\\076\000\076\000\076\000\076\000\
\\076\000\076\000\018\000\073\000\
\\072\000\071\000\032\000\074\000\
\\005\000\006\000\007\000\035\000\
\\016\000\014\000\081\000\076\000\
\\076\000\079\000\077\000\058\000\
\\057\000\026\000\025\000\024\000\
\\023\000\022\000\021\000\054\000\
\\053\000\056\000\055\000\068\000\
\\002\000\001\000\075\000\027\000\
\\036\000\039\000\076\000\076\000\
\\076\000\043\000\028\000\040\000\
\\069\000\020\000\041\000\019\000\
\\033\000\008\000\009\000\076\000\
\\092\000\015\000\064\000\063\000\
\\010\000\080\000\076\000\059\000\
\\076\000\078\000\061\000\000\000\
\\067\000\084\000\092\000\034\000\
\\089\000\037\000\087\000\042\000\
\\038\000\076\000\076\000\029\000\
\\082\000\070\000\076\000\047\000\
\\044\000\011\000\076\000\030\000\
\\012\000\017\000\062\000\076\000\
\\060\000\090\000\091\000\088\000\
\\013\000\076\000\093\000\076\000\
\\083\000\031\000\085\000\092\000\
\\065\000\076\000\094\000\086\000\
\\045\000"
val gotoT =
"\
\\001\000\003\000\005\000\128\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\026\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\003\000\031\000\004\000\030\000\010\000\029\000\011\000\028\000\
\\012\000\027\000\000\000\
\\000\000\
\\001\000\036\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\037\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\043\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\044\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\045\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\046\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\047\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\048\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\049\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\050\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\051\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\052\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\053\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\054\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\003\000\031\000\004\000\058\000\010\000\029\000\011\000\028\000\
\\012\000\027\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\065\000\000\000\
\\001\000\068\000\006\000\067\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\069\000\007\000\002\000\008\000\001\000\000\000\
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
\\001\000\071\000\002\000\070\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\071\000\002\000\072\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\077\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\078\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\079\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\013\000\089\000\000\000\
\\000\000\
\\001\000\094\000\007\000\002\000\008\000\001\000\000\000\
\\014\000\095\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\100\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\001\000\068\000\006\000\101\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\001\000\071\000\002\000\103\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\014\000\104\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\109\000\007\000\002\000\008\000\001\000\000\000\
\\001\000\110\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\112\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\115\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\120\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\122\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\001\000\124\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\014\000\126\000\000\000\
\\000\000\
\\001\000\127\000\007\000\002\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 129
val numrules = 56
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
datatype svalue = VOID | ntVOID of unit ->  unit | STRING of unit ->  (string) | INT of unit ->  (int) | ID of unit ->  (string) | TYFIELD of unit ->  (Ast.typefield) | TY of unit ->  (Ast.typ) | VARDEC of unit ->  (Ast.VarDec) | FUNCDEC of unit ->  (Ast.FuncDec) | TYPEDEC of unit ->  (Ast.TypeDec) | ARGS of unit ->  (STRING*Ast.exp list) | RECORD of unit ->  (Ast.RecordExp) | LVALUE of unit ->  (Ast.Lvalue) | PARAM of unit ->  (Ast.exp list) | PROGRAM of unit ->  (Ast.program list) | DECS of unit ->  (Ast.dec list) | DEC of unit ->  (Ast.dec) | EXPS of unit ->  (Ast.exp list) | EXP of unit ->  (Ast.exp)
end
type svalue = MlyValue.svalue
type result = Ast.program list
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
of  ( 0, ( ( _, ( MlyValue.EXP EXP1, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.PROGRAM (fn _ => let val  EXP1 = EXP1 ()
 in ((*#line 58.32 "tiger.grm"*)PROGRAM(*#line 530.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 4, ( result, EXP1left, EXP1right), rest671)
end
|  ( 1, ( rest671)) => let val  result = MlyValue.EXPS (fn _ => ((*#line 60.33 "tiger.grm"*)[](*#line 536.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 2, ( ( _, ( MlyValue.EXPS EXPS1, _, EXPS1right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS (fn _ => let val  (EXP as EXP1) = EXP1 ()
 val  (EXPS as EXPS1) = EXPS1 ()
 in ((*#line 61.33 "tiger.grm"*)EXP :: EXPS(*#line 540.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 3, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => ((*#line 63.30 "tiger.grm"*)Ast.nil(*#line 547.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 0, ( result, NIL1left, NIL1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.ID ID1, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (ID as ID1) = ID1 ()
 in ((*#line 64.30 "tiger.grm"*)Ast.ID(*#line 551.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, ID1left, ID1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.INT INT1, INT1left, INT1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  INT1 = INT1 ()
 in ((*#line 65.30 "tiger.grm"*)Ast.IntConst(*#line 557.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, INT1left, INT1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.LVALUE LVALUE1, LVALUE1left, LVALUE1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (LVALUE as LVALUE1) = LVALUE1 ()
 in ((*#line 66.30 "tiger.grm"*)LVALUE(*#line 563.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, LVALUE1left, LVALUE1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.RECORD RECORD1, RECORD1left, RECORD1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (RECORD as RECORD1) = RECORD1 ()
 in ((*#line 67.30 "tiger.grm"*)RECORD(*#line 569.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, RECORD1left, RECORD1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 68.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Plus, right = EXP2})(*#line 575.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 69.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Minus, right = EXP2})(*#line 582.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 70.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Mul, right = EXP2})(*#line 589.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 71.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.Div, right = EXP2})(*#line 596.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 72.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.GEQ, right = EXP2})(*#line 603.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 73.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.LEQ, right = EXP2})(*#line 610.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 74.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.EQ, right = EXP2})(*#line 617.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 75.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.NEQ, right = EXP2})(*#line 624.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 76.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.GT, right = EXP2})(*#line 631.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 77.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.LT, right = EXP2})(*#line 638.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 78.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.AND, right = EXP2})(*#line 645.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 79.30 "tiger.grm"*)Ast.BinOpExp ({left = EXP1, oper = Ast.OR, right = EXP2})(*#line 652.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 20, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.PARAM PARAM1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (ID as ID1) = ID1 ()
 val  (PARAM as PARAM1) = PARAM1 ()
 in ((*#line 80.33 "tiger.grm"*)Ast.FuncCall ({id_name: ID, fun_args: PARAM})(*#line 659.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, ID1left, RPAREN1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (ID as ID1) = ID1 ()
 val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 81.34 "tiger.grm"*)Ast.ArrExp ({id_name: ID, arr_size: EXP1, first_i: EXP2})(*#line 666.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, ID1left, EXP2right), rest671)
end
|  ( 22, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXPS EXPS1, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (EXP as EXP1) = EXP1 ()
 val  (EXPS as EXPS1) = EXPS1 ()
 in ((*#line 82.44 "tiger.grm"*)Ast.SeqExp (EXP::EXPS)(*#line 674.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, LPAREN1left, RPAREN1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 val  EXP3 = EXP3 ()
 in ((*#line 83.34 "tiger.grm"*)Ast.IfExp ({test_cond: EXP1, body_expr: EXP2, otherwise: EXP3})(*#line 681.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, IF1left, EXP3right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 84.34 "tiger.grm"*)Ast.IfThenExp ({test_cond: EXP1, body_expr: EXP2})(*#line 689.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, IF1left, EXP2right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in ((*#line 85.34 "tiger.grm"*)Ast.WhileExp ({{test_cond: EXP1, body_expr: EXP2}})(*#line 696.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, WHILE1left, EXP2right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, FOR1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (ID as ID1) = ID1 ()
 val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 val  EXP3 = EXP3 ()
 in ((*#line 86.40 "tiger.grm"*)Ast.ForExp ({{id_name: ID, first_i: EXP1, final: EXP2, body_expr: EXP3}})(*#line 703.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, FOR1left, EXP3right), rest671)
end
|  ( 27, ( ( _, ( _, BREAK1left, BREAK1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => ((*#line 87.35 "tiger.grm"*)Ast.BreakExp(*#line 712.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 0, ( result, BREAK1left, BREAK1right), rest671)
end
|  ( 28, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.EXPS EXPS1, _, _)) :: _ :: ( _, ( MlyValue.DECS DECS1, _, _)) :: ( _, ( _, LET1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (DECS as DECS1) = DECS1 ()
 val  (EXPS as EXPS1) = EXPS1 ()
 in ((*#line 88.35 "tiger.grm"*)Ast.LetExp ({decl: DECS, body_expr: EXPS})(*#line 716.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 29, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (EXP as EXP1) = EXP1 ()
 in ((*#line 89.35 "tiger.grm"*)EXP(*#line 723.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 0, ( result, LPAREN1left, RPAREN1right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.EXP EXP1, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.PARAM (fn _ => let val  (EXP as EXP1) = EXP1 ()
 in ((*#line 92.32 "tiger.grm"*)[EXP](*#line 729.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 5, ( result, EXP1left, EXP1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.PARAM PARAM1, _, PARAM1right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.PARAM (fn _ => let val  (EXP as EXP1) = EXP1 ()
 val  (PARAM as PARAM1) = PARAM1 ()
 in ((*#line 93.30 "tiger.grm"*)EXP :: PARAM(*#line 735.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 5, ( result, EXP1left, PARAM1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.TYPEDEC TYPEDEC1, TYPEDEC1left, TYPEDEC1right)) :: rest671)) => let val  result = MlyValue.DEC (fn _ => let val  (TYPEDEC as TYPEDEC1) = TYPEDEC1 ()
 in ((*#line 95.30 "tiger.grm"*)TYPEDEC(*#line 742.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, TYPEDEC1left, TYPEDEC1right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.FUNCDEC FUNCDEC1, FUNCDEC1left, FUNCDEC1right)) :: rest671)) => let val  result = MlyValue.DEC (fn _ => let val  (FUNCDEC as FUNCDEC1) = FUNCDEC1 ()
 in ((*#line 96.30 "tiger.grm"*)FUNCDEC(*#line 748.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, FUNCDEC1left, FUNCDEC1right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.VARDEC VARDEC1, VARDEC1left, VARDEC1right)) :: rest671)) => let val  result = MlyValue.DEC (fn _ => let val  (VARDEC as VARDEC1) = VARDEC1 ()
 in ((*#line 97.30 "tiger.grm"*)VARDEC(*#line 754.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 2, ( result, VARDEC1left, VARDEC1right), rest671)
end
|  ( 35, ( rest671)) => let val  result = MlyValue.DECS (fn _ => ((*#line 99.30 "tiger.grm"*)[](*#line 760.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 3, ( result, defaultPos, defaultPos), rest671)
end
|  ( 36, ( ( _, ( MlyValue.DECS DECS1, _, DECS1right)) :: ( _, ( MlyValue.DEC DEC1, DEC1left, _)) :: rest671)) => let val  result = MlyValue.DECS (fn _ => let val  (DEC as DEC1) = DEC1 ()
 val  (DECS as DECS1) = DECS1 ()
 in ((*#line 100.30 "tiger.grm"*)DEC :: DECS(*#line 764.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 3, ( result, DEC1left, DECS1right), rest671)
end
|  ( 37, ( rest671)) => let val  result = MlyValue.LVALUE (fn _ => ((*#line 102.34 "tiger.grm"*)Ast.SimpleVar (ID)(*#line 771.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 6, ( result, defaultPos, defaultPos), rest671)
end
|  ( 38, ( ( _, ( MlyValue.ID ID1, _, ID1right)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE1, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE (fn _ => let val  (LVALUE as LVALUE1) = LVALUE1 ()
 val  (ID as ID1) = ID1 ()
 in ((*#line 103.34 "tiger.grm"*)Ast.FieldVar (LVALUE, ID)(*#line 775.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 6, ( result, LVALUE1left, ID1right), rest671)
end
|  ( 39, ( ( _, ( _, _, RBRAC1right)) :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE (fn _ => let val  (ID as ID1) = ID1 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 104.34 "tiger.grm"*)Ast.ArrVar (ID, EXP)(*#line 782.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 6, ( result, ID1left, RBRAC1right), rest671)
end
|  ( 40, ( ( _, ( _, _, NIL1right)) :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.RECORD (fn _ => let val  (ID as ID1) = ID1 ()
 in ((*#line 106.34 "tiger.grm"*)Ast.RecordExp ({id_name: ID, field_elem: []})(*#line 789.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 7, ( result, ID1left, NIL1right), rest671)
end
|  ( 41, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.ARGS ARGS1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.RECORD (fn _ => let val  (ID as ID1) = ID1 ()
 val  (ARGS as ARGS1) = ARGS1 ()
 in ((*#line 107.34 "tiger.grm"*)Ast.RecordExp ({id_name: ID, field_elem: ARGS})(*#line 795.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 7, ( result, ID1left, RBRACE1right), rest671)
end
|  ( 42, ( rest671)) => let val  result = MlyValue.ARGS (fn _ => ((*#line 109.34 "tiger.grm"*)NIL(*#line 802.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 8, ( result, defaultPos, defaultPos), rest671)
end
|  ( 43, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( MlyValue.STRING STRING1, STRING1left, _)) :: rest671)) => let val  result = MlyValue.ARGS (fn _ => let val  STRING1 = STRING1 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 110.34 "tiger.grm"*)ID, EXP :: NIL(*#line 806.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 8, ( result, STRING1left, EXP1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: _ :: ( _, ( MlyValue.ARGS ARGS1, ARGS1left, _)) :: rest671)) => let val  result = MlyValue.ARGS (fn _ => let val  (ARGS as ARGS1) = ARGS1 ()
 val  (ID as ID1) = ID1 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 111.34 "tiger.grm"*)ID, EXP :: ARGS(*#line 813.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 8, ( result, ARGS1left, EXP1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.TY TY1, _, TY1right)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, TYPE1left, _)) :: rest671)) => let val  result = MlyValue.TYPEDEC (fn _ => let val  (ID as ID1) = ID1 ()
 val  (TY as TY1) = TY1 ()
 in ((*#line 113.34 "tiger.grm"*)Ast.Typef ({id_name: ID, ty: TY})(*#line 821.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 9, ( result, TYPE1left, TY1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC (fn _ => let val  (ID as ID1) = ID1 ()
 val  (TYFIELD as TYFIELD1) = TYFIELD1 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 115.53 "tiger.grm"*)Ast.Funcf ({id_name: ID, fun_args: TYFIELD, result_type: NONE, body_expr: EXP})(*#line 828.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 10, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD1, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.FUNCDEC (fn _ => let val  ID1 = ID1 ()
 val  (TYFIELD as TYFIELD1) = TYFIELD1 ()
 val  ID2 = ID2 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 116.62 "tiger.grm"*)Ast.Funcf ({id_name: ID1, fun_args: TYFIELD, result_type: SOME ID2, body_expr: EXP})(*#line 836.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 10, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.VARDEC (fn _ => let val  (ID as ID1) = ID1 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 118.42 "tiger.grm"*)Ast.Varf ({id_name: ID, ty: NONE, first_i: EXP})(*#line 845.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 11, ( result, VAR1left, EXP1right), rest671)
end
|  ( 49, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.VARDEC (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (EXP as EXP1) = EXP1 ()
 in ((*#line 119.42 "tiger.grm"*)Ast.Varf ({id_name: ID1, ty: SOME ID2, first_i: EXP})(*#line 852.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 11, ( result, VAR1left, EXP1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.ID ID1, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.TY (fn _ => let val  (ID as ID1) = ID1 ()
 in ((*#line 121.34 "tiger.grm"*)Ast.alias (ID)(*#line 860.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, ID1left, ID1right), rest671)
end
|  ( 51, ( ( _, ( _, _, RBRACE1right)) :: ( _, ( MlyValue.TYFIELD TYFIELD1, _, _)) :: ( _, ( _, LBRACE1left, _)) :: rest671)) => let val  result = MlyValue.TY (fn _ => let val  (TYFIELD as TYFIELD1) = TYFIELD1 ()
 in ((*#line 122.34 "tiger.grm"*)Ast.record (TYFIELD)(*#line 866.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, LBRACE1left, RBRACE1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.ID ID1, _, ID1right)) :: _ :: ( _, ( _, ARRAY1left, _)) :: rest671)) => let val  result = MlyValue.TY (fn _ => let val  (ID as ID1) = ID1 ()
 in ((*#line 123.34 "tiger.grm"*)Ast.arr (ID)(*#line 872.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 12, ( result, ARRAY1left, ID1right), rest671)
end
|  ( 53, ( rest671)) => let val  result = MlyValue.TYFIELD (fn _ => ((*#line 125.38 "tiger.grm"*)[](*#line 878.1 "tiger.grm.sml"*)
))
 in ( LrTable.NT 13, ( result, defaultPos, defaultPos), rest671)
end
|  ( 54, ( ( _, ( MlyValue.ID ID2, _, ID2right)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 in ((*#line 126.38 "tiger.grm"*)[(ID1,ID2)](*#line 882.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 13, ( result, ID1left, ID2right), rest671)
end
|  ( 55, ( ( _, ( MlyValue.TYFIELD TYFIELD1, _, TYFIELD1right)) :: _ :: ( _, ( MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD (fn _ => let val  ID1 = ID1 ()
 val  ID2 = ID2 ()
 val  (TYFIELD as TYFIELD1) = TYFIELD1 ()
 in ((*#line 127.38 "tiger.grm"*)(ID1,ID2) :: TYFIELD(*#line 889.1 "tiger.grm.sml"*)
)
end)
 in ( LrTable.NT 13, ( result, ID1left, TYFIELD1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : _TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.ID (fn () => i),p1,p2))
fun INT (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.INT (fn () => i),p1,p2))
fun STRING (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.STRING (fn () => i),p1,p2))
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
