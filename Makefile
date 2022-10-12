
DOCKERIMG=texlive
DOCKERCMD=docker run --rm -v "$(PWD)":/usr/src/project -w /usr/src/project $(DOCKERIMG) 

docker:
	docker build -t $(DOCKERIMG) .

pdf:
	#docker run --rm -v "$(PWD)":/usr/src/project -w /usr/src/project texlive latexmk --pdf main.tex
	$(DOCKERCMD)  latexmk --pdf main.tex
