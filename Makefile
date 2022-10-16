
DOCKERIMG=texlive
DOCKERCMD=docker run --rm -v "$(PWD)":/usr/src/project -w /usr/src/project $(DOCKERIMG) 
#LATEXC=latexmk --pdf
LATEXC=tectonic

docker:
	docker build -t $(DOCKERIMG) .

pdf:
	$(LATEXC) main.tex
