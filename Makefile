.PHONY: html images pdf

html: 
	xsltproc -xinclude -o html/unused.html.ignore ~/code/mathbook/xsl/pretext-html.xsl ptx/index.ptx

images:
	~/code/mathbook/pretext/pretext -c latex-image -f svg -d html/images/ ptx/index.ptx

pdf:
	xsltproc --xinclude -o prismatic-ptx.tex ~/code/mathbook/xsl/pretext-latex.xsl ptx/index.ptx; \
	pdflatex prismatic-ptx -interaction batchmode; \
	pdflatex prismatic-ptx -interaction batchmode
