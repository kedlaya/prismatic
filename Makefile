.PHONY : all latex pdf images html install
all: latex pdf images html install

latex:
	pretext build latex --clean

pdf:
	pretext build pdf
	
images:
	pretext build -d

html:
	pretext build html

install:
	cp output/pdf/index.pdf ~/www/papers/prismatic-ptx.pdf;
	scp output/pdf/index.pdf web:www/papers/prismatic-ptx.pdf;
	rsync -au output/html/ ~/www/prismatic/;
	rsync -au -e "ssh" output/html/ web:www/prismatic/

