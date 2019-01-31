Reproduction case for #1789. The issue was that executables where not
relinked when the C stubs of libraries they depended on changed.

  $ echo '#define MSG "Message 1"' > lib/message.h
  $ (cd lib && dune build -p foo)

  $ (cd app && OCAMLPATH="../lib/_build/install/default/lib" dune exec ./main.exe)
  Message 1

  $ echo '#define MSG "Message 2"' > lib/message.h
  $ (cd lib && dune build -p foo)

  $ (cd app && OCAMLPATH="../lib/_build/install/default/lib" dune exec ./main.exe)
  Message 2
