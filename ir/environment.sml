(* Finite map from strings to 'a *)
signature ENVIRONMENT = sig 
    type env
    type fenv
    val Envt : env
    val FEnvt : fenv
    val lookupVar  : string -> env -> Temp.temp option
    val lookupFunc  : string -> env -> Temp.label option
    val update : string -> Temp.temp -> env -> env 
    val Fupdate : string -> Temp.label -> env -> env 
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
    type fenv = Temp.label EnvMap.map

	val Envt : env = EnvMap.empty
    val FEnvt : fenv = EnvMap.empty

	fun lookupVar str currentEnv = EnvMap.find (currentEnv, str) 
    fun lookupFunc str currentEnv = EnvMap.find (currentEnv, str) 

    fun update str temp_ currentEnv = EnvMap.insert (currentEnv, str,temp_) 
    fun Fupdate str lab currentEnv = EnvMap.insert (currentEnv, str,lab) 

end

