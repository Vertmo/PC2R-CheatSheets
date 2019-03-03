all: fairthreads.pdf ocaml-event.pdf

%.pdf: %.md
	pandoc -s -o $@ $^

.PHONY: all
