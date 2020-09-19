### Makefile for Emacs refcards (Japanese)

## This Makefile is based on etc/refcards/Makefile in Emacs
## distribution.

PDF_JAPANESE = ja-refcard.pdf

## For emacsver.tex.
ENVADD = TEXINPUTS=".:$(TEXINPUTS)"

.PHONY: all pdf

all: pdf
pdf: $(PDF_JAPANESE)

ja_refcard_deps = ja-refcard.tex emacsver.tex pdflayout.sty
ja-refcard.pdf: $(ja_refcard_deps)
	$(ENVADD) luatex ja-refcard.tex

.PHONY: clean

clean:
	-rm -f ./*.dvi ./*.log ./*.aux

distclean: clean

## This should really by maintainer-clean, but the handling of the
## refcards is funny.  So abuse extraclean for this.
extraclean: clean
	-rm -f $(PDF_JAPANESE)
