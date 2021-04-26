.PHONY : all pdf images html install
all: pdf images html install

pdf:
	xsltproc --xinclude -o prismatic-ptx.tex ~/code/mathbook/xsl/pretext-latex.xsl ptx/index.ptx; \
	pdflatex prismatic-ptx -interaction batchmode; \
	pdflatex prismatic-ptx -interaction batchmode

images:
	~/code/mathbook/pretext/pretext -c latex-image -f svg -d html/images/ ptx/index.ptx

html: 
	xsltproc -stringparam publisher publication.xml -xinclude -o html/unused.html.ignore ~/code/mathbook/xsl/pretext-html.xsl ptx/index.ptx

install:
	scp prismatic-ptx.pdf ~/www/papers/; \
	scp prismatic-ptx.pdf web:www/papers/; \
	scp -r html/* web:www/prismatic/

