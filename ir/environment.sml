(* Finite map from strings to 'a *)
signature ENVIRONMENT = sig 
    type env
    type fenv
    val Envt : env
    val FEnvt : fenv
    val lookupVar  : string -> env -> Temp.temp option
    val lookupFunc  : string -> fenv -> (Temp.label * int) option
    val update : string -> Temp.temp -> env -> env 
    val Fupdate : string -> Temp.label -> fenv -> int -> fenv 
    val predefined : fenv -> fenv
    (* val lookupFunc : *)
end

(* PLAN - Will be making a new lookup table incase there will be a new variable encountered 
          and not just updating the previous lookup table. Now the plan is to use sml implemented Maps for that *)

(* Process of creating a new lookup table t' = previous look up table t components plus the new (variable ,temp) pair
    Incase the variable is pre-existing, will be replaced - right associativity will be used here. The value of the right variable's temp
    will then be considered. *)

structure Env : ENVIRONMENT =
struct

    exception Error

	structure EnvMap = RedBlackMapFn (struct type ord_key = string 
                                      val compare = String.compare end) 

	type env  = Temp.temp EnvMap.map 
    type fenv = (Temp.label * int) EnvMap.map

	val Envt : env = EnvMap.empty
    val FEnvt : fenv = EnvMap.empty

	fun lookupVar str currentEnv = EnvMap.find (currentEnv, str) 
    fun lookupFunc str currentEnv = EnvMap.find (currentEnv, str) 

    fun update str temp_ currentEnv = EnvMap.insert (currentEnv, str,temp_) 
    fun Fupdate str lab currentEnv n = EnvMap.insert (currentEnv, str,(lab,n)) 

    fun predefined f_env  = let val f1  = EnvMap.insert (f_env, "print", (Temp.newlabel(),1))
                                val f2  = EnvMap.insert (f1, "flush", (Temp.newlabel(),0))
                                val f3  = EnvMap.insert (f2, "getchar", (Temp.newlabel(),0))
                                val f4  = EnvMap.insert (f3, "ord", (Temp.newlabel(),1))
                                val f5  = EnvMap.insert (f4, "chr", (Temp.newlabel(),1))
                                val f6  = EnvMap.insert (f5, "size", (Temp.newlabel(),1))
                                val f7  = EnvMap.insert (f6, "substring", (Temp.newlabel(),3))
                                val f8  = EnvMap.insert (f7, "concat", (Temp.newlabel(),2))
                                val f9  = EnvMap.insert (f8, "not", (Temp.newlabel(),1))
                                val f10  = EnvMap.insert (f9, "exit", (Temp.newlabel(),1))
                            in
                               f10
                            end 

end

