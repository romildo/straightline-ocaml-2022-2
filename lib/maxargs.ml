open Ast

let rec maxargs stm =
  match stm with
  | CompoundStm (s1, s2) -> max (maxargs s1) (maxargs s2)
  | AssignStm (_, e) -> maxargs_exp e
  | PrintStm l -> max (List.length l) (maxargs_exp_list l)

and maxargs_exp exp =
  match exp with
  | IdExp _ -> 0
  | NumExp _ -> 0
  | OpExp (_, e1, e2) -> max (maxargs_exp e1) (maxargs_exp e2)
  | EseqExp (s, e) -> max (maxargs s) (maxargs_exp e)
  | CallExp (_, l) -> maxargs_exp_list l

and maxargs_exp_list lst =
  match lst with
  | [] -> 0
  | h::t -> max (maxargs_exp h) (maxargs_exp_list t)
