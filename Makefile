all: clean
	$(MAKE) spanish
	$(MAKE) english
	pdftoppm cv-en.pdf cv -png -rx 300 -ry 300

spanish: clean
	xelatex cv.tex
	xelatex cv.tex
	mv cv.pdf cv-light.pdf
	xelatex cv.tex
	mv cv.pdf cv-es.pdf
	$(MAKE) clean

english: clean
	xelatex "\def\inenglish{1} \input{cv.tex}"
	xelatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-light.pdf
	xelatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-en.pdf
	$(MAKE) clean

clean:
	rm -rf *.aux *.log *.out *.fls *.fdb_latexmk

cleanclean: clean
	rm -rf *.pdf *.png