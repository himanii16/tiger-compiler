signature TEMP =
sig
    type label
    type temp
    val  newlabel : unit -> label  (* generate a new label *)
    val  newtemp  : unit -> temp
end

structure Temp : TEMP = struct

    type label = int (* 2⁶⁴ = ∞ many variables *)
    type temp  = int
    
    (* you can use IntInf.int *)

    val nextLabel = ref 0
    val nextTemp  = ref 4

    fun newlabel _ = (nextLabel := !nextLabel + 1; !nextLabel)
    fun newtemp  _ = (nextTemp := !nextTemp + 1; !nextTemp)
end

