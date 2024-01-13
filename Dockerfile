FROM ubuntu:22.04

ARG FSTAR_VERSION=2022.01.15

ENV FSTAR_HOME=/root/.opam/default

ENV OCAMLPATH=$FSTAR_HOME/bin

ENV PATH=$OCAMLPATH:$PATH

WORKDIR /workspace

RUN apt-get update

RUN apt-get install -y opam ocaml python2.7 libgmp-dev

RUN opam init -y --disable-sandboxing && \
    opam install -v -y --no-self-upgrade fstar.${FSTAR_VERSION} && \
    opam clean -a -y

WORKDIR /root/.opam/default

RUN mv bin/fstar.exe bin/fstar

WORKDIR /code

COPY bin .

CMD "./run.sh"