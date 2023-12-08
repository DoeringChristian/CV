
DOCKERIMG=texlive
DOCKERCMD=podman run --privileged -v "$(PWD)":/usr/src/project -w /usr/src/project $(DOCKERIMG)
#LATEXC=latexmk --pdf
LATEXC=latexmk --pdf
TEXFILE=main.tex

docker:
	docker build -t $(DOCKERIMG) .
	
podman:
	podman build -t $(DOCKERIMG) .

pdf:
	$(DOCKERCMD) $(LATEXC) $(TEXFILE)
