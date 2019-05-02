all: fairthreads.pdf ocaml-event.pdf lustre.pdf

%.pdf: %.md
	pandoc -s -o $@ $^

.PHONY: all
