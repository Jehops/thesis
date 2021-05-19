# Sample Makefile for thesis preparation
THESIS_NAME=thesis

help:
	@echo make all

.PHONY: all

all:
	-make clean
	pdflatex $(THESIS_NAME).tex
	bibtex $(THESIS_NAME)
	pdflatex $(THESIS_NAME).tex
	pdflatex $(THESIS_NAME).tex
	latex $(THESIS_NAME).tex    # making ps too
	dvips -t letter $(THESIS_NAME).dvi -o $(THESIS_NAME).ps

body:
	latex $(THESIS_NAME).tex

glossary:
	latex $(THESIS_NAME).tex
	makeindex -s $(THESIS_NAME) -o $(THESIS_NAME).gls $(THESIS_NAME).glo

bibliography:
	latex $(THESIS_NAME).tex
	bibtex $(THESIS_NAME)

clean:
	-rm *.dvi *.aux *.bbl *.blg *.log *.toc *.lof *.lot *.glo *.gls *.ist
	-rm *.ilg *~ $(THESIS_NAME).pdf $(THESIS_NAME).dvi $(THESIS_NAME).ps

spotless: clean
	-rm *.pdf
