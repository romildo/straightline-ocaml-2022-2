type id = string

type operator =
  | Plus
  | Minus
  | Times
  | Div

type stm =
  | CompoundStm of stm * stm
  | AssignStm of id * exp
  | PrintStm of exp list

and exp =
  | IdExp of id
  | NumExp of float
  | OpExp of operator * exp * exp
  | EseqExp of stm * exp
