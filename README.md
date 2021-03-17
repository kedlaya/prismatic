Hints for processing PreTeXt:

- To convert XML to LaTeX:
```
xsltproc --xinclude -o prismatic-ptx.tex ~/code/mathbook/xsl/pretext-latex.xsl ptx/index.ptx
```
- To convert the resulting LaTeX to PDF:
```
pdflatex prismatic-ptx
```
- To prepare images:
```
~/code/mathbook/pretext/pretext -c latex-image -f svg -d html/images/ ptx/index.ptx
```
- To convert XML to HTML:
```
xsltproc -xinclude -o html/ ~/code/mathbook/xsl/pretext-html.xsl ptx/index.ptx
```
