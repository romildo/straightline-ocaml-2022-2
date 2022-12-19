open Ast

(* print(8) *)
let p1 = PrintStm [NumExp 8.0]

let () = print_int (Maxargs.maxargs p1)
