DOC=thesis
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

display! ${DOC}.pdf
	pv ${>} &

${DOC}.pdf: ${DOC}.Rnw
	R ${R_OPTS} -e "library(knitr);knit('${>}')"
	latexmk ${DOC}.tex

#${DOC}.pdf: ${DOC}.tex
#	latexmk ${DOC}.tex

#glos:
#	latex ${DOC}.tex
#	makeindex -s ${DOC} -o ${DOC}.gls ${DOC}.glo
clean:
	rm -rf auto cache figures/* ${DOC}.aux ${DOC}.bbl ${DOC}.blg ${DOC}.dvi \
${DOC}.fdb_latexmk ${DOC}.fls ${DOC}.glo ${DOC}.glg ${DOC}.gls ${DOC}.ist \
${DOC}.ilg ${DOC}.lof ${DOC}.log ${DOC}.lot ${DOC}.pdf ${DOC}.toc
