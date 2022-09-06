.PHONY : all pdf images web install
all: pdf web install

pdf:
	pretext build print --clean
	
images:
	pretext generate latex-image

web:
	pretext build web

install:
	cp output/print/main.pdf ~/www/papers/prismatic-ptx.pdf;
	scp output/print/main.pdf web:www/papers/prismatic-ptx.pdf;
	rsync -au output/html/ ~/www/prismatic/;
	rsync -au -e "ssh" output/html/ web:www/prismatic/

