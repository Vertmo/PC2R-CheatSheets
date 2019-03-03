all: fairthreads.pdf

%.pdf: %.md
	pandoc -s -o $@ $^

.PHONY: all
