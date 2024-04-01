  $ ocamlc_where="$(ocamlc -where)"
  $ export BUILD_PATH_PREFIX_MAP="/OCAMLC_WHERE=$ocamlc_where:$BUILD_PATH_PREFIX_MAP"
  $ ocamlfind_libs="$(ocamlfind printconf path | while read line; do printf lib=${line}:; done)"
  $ export BUILD_PATH_PREFIX_MAP="$ocamlfind_libs:$BUILD_PATH_PREFIX_MAP"
  $ melc_compiler="$(which melc)"
  $ export BUILD_PATH_PREFIX_MAP="/MELC_COMPILER=$melc_compiler:$BUILD_PATH_PREFIX_MAP"

CRAM sanitization
  $ dune build ./exe/.merlin-conf/exe-x --profile release
  $ dune ocaml merlin dump-config $PWD/exe
  X: _build/default/exe/x.mlx
  ((STDLIB /OCAMLC_WHERE)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/exe/.x.eobjs/byte)
   (S
    $TESTCASE_ROOT/exe)
   (FLG (-w -40 -g))
   (SUFFIX ".mlx .mli")
   (READER (mlx)))
  X: _build/default/exe/x.mlx.mli
  ((STDLIB /OCAMLC_WHERE)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/exe/.x.eobjs/byte)
   (S
    $TESTCASE_ROOT/exe)
   (FLG (-w -40 -g))
   (SUFFIX ".mlx .mli"))

CRAM sanitization
  $ dune build ./lib/.merlin-conf/lib-x --profile release
  $ dune ocaml merlin dump-config $PWD/lib
  X: _build/default/lib/x.mlx
  ((STDLIB /OCAMLC_WHERE)
   (EXCLUDE_QUERY_DIR)
   (B
    $TESTCASE_ROOT/_build/default/lib/.x.objs/byte)
   (S
    $TESTCASE_ROOT/lib)
   (FLG (-w -40 -g))
   (SUFFIX ".mlx .mli")
   (READER (mlx)))

CRAM sanitization
  $ dune build ./melange/.merlin-conf/lib-x_mel --profile release
  $ dune ocaml merlin dump-config $PWD/melange
  X_mel: _build/default/melange/x_mel.mlx
  ((STDLIB lib/melange/melange)
   (EXCLUDE_QUERY_DIR)
   (B lib/melange/js/melange)
   (B lib/melange/melange)
   (B
    $TESTCASE_ROOT/_build/default/melange/.x_mel.objs/melange)
   (S lib/melange)
   (S lib/melange/js)
   (S
    $TESTCASE_ROOT/melange)
   (FLG (-w -40 -g))
   (SUFFIX ".mlx .mli")
   (READER (mlx)))
