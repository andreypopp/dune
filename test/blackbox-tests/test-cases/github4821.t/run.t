Ensure that a public, non-optional library can be disabled.
  $ cat > dune-project<<EOF
  > (lang dune 3.0)
  > (package (name foo) (allow_empty))
  > EOF
  $ cat > dune <<EOF
  > (library (name foo) (public_name foo) (enabled_if false))
  > EOF
  $ dune build @install;
  > cat _build/install/default/lib/foo/dune-package;
  (lang dune 3.0)
  (name foo)
  (sections
   (lib
    $TESTCASE_ROOT/_build/install/default/lib/foo))
  (files (lib (META dune-package)))
