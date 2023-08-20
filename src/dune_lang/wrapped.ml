open Stdune
open Dune_sexp.Decoder

type t =
  | Simple of bool
  | Yes_as of string
  | Yes_with_transition of string

let equal = Poly.equal

let decode =
  sum
    [ "true", return (Simple true)
    ; "false", return (Simple false)
    ; ( "transition"
      , Dune_sexp.Syntax.since Stanza.syntax (1, 2)
        >>> let+ x = string in
            Yes_with_transition x )
    ; ( "as"
      , Dune_sexp.Syntax.since Stanza.syntax (3, 9)
        >>> let+ x = string in
            Yes_as x )
    ]
;;

let encode =
  let open Dune_sexp.Encoder in
  function
  | Simple b -> bool b
  | Yes_as name -> pair string string ("as", name)
  | Yes_with_transition m -> pair string string ("transition", m)
;;

let to_bool = function
  | Simple b -> b
  | Yes_as _ -> true
  | Yes_with_transition _ -> true
;;

let to_dyn =
  let open Dyn in
  function
  | Simple s -> variant "Simple" [ bool s ]
  | Yes_as name -> variant "Yes_as" [ string name ]
  | Yes_with_transition s -> variant "Yes_with_transition" [ string s ]
;;
