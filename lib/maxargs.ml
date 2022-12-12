open Ast

let rec maxargs s =
  match s with
  | CompoundStm (s1, s2) -> max (maxargs s1) (maxargs s2)
  | AssignStm (_, e) -> maxargs_exp e
  | PrintStm l -> max (List.length l) (maxargs_exp_list l)
