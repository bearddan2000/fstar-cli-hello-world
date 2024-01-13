#! /bin/sh

FILE=HelloWorld && fstar --codegen OCaml --odir out --extract $FILE $FILE.fst 1>&2 && \
    ocamlfind opt -package fstarlib -linkpkg -thread -o out/$FILE out/$FILE.ml 1>&2 && \
    out/$FILE