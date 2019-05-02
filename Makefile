all: fairthreads.pdf ocaml-event.pdf esterel.pdf lustre.pdf

%.pdf: %.md
	pandoc -s -o $@ $^

.PHONY: all
