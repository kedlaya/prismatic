.PHONY : all latex pdf images html install
all: latex pdf images html install

latex:
	xsltproc -stringparam publisher publication.xml --xinclude -o prismatic-ptx.tex ~/code/mathbook/xsl/pretext-latex.xsl ptx/index.ptx

pdf:
	pdflatex -halt-on-error prismatic-ptx || [$$? -eq 0];
	pdflatex prismatic-ptx

images:
	~/code/mathbook/pretext/pretext -c latex-image -f svg -d html/images/ ptx/index.ptx

html: 
	xsltproc -stringparam publisher publication.xml -xinclude -o html/unused.html.ignore ~/code/mathbook/xsl/pretext-html.xsl ptx/index.ptx

install:
	cp prismatic-ptx.pdf ~/www/papers/;
	scp prismatic-ptx.pdf web:www/papers/;
	rsync -au html/ ~/www/prismatic/;
	rsync -au -e "ssh" html/ web:www/prismatic/

