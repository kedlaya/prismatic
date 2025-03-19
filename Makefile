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
	rsync -au output/web/ ~/www/prismatic/;
	rsync -au -e "ssh" output/web/ web:www/prismatic/

