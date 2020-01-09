module H_list = Snarky.H_list
open H_list

type 'a t = {a: 'a; b: 'a; c: 'a} [@@deriving fields, bin_io]

let to_hlist {a; b; c} = [a; b; c]

let of_hlist ([a; b; c] : (unit, _) H_list.t) = {a; b; c}

let typ (type a b f) (g : (a, b, f) Snarky.Typ.t) : (a t, b t, f) Snarky.Typ.t
    =
  Snarky.Typ.of_hlistable [g; g; g] ~var_to_hlist:to_hlist
    ~var_of_hlist:of_hlist ~value_to_hlist:to_hlist ~value_of_hlist:of_hlist

let map {a; b; c} ~f = {a= f a; b= f b; c= f c}
