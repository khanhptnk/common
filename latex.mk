PHONY: clean

%.pdf: %.tex $(DEPEND)
	latexmk -bibtex -pdf  $<
clean:
	rm -rf *.aux *.blg *.log *.toc *.snm *.out *.nav *.dvi tags
