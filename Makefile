all:

%.pdf: %.md
	pandoc -s -o $@ $^

.PHONY: all
