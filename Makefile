
docker:
	docker build -t pdflatex .

pdf:
	docker run --rm -v "$(PWD)":/usr/src/project -w /usr/src/project pdflatex pdflatex main.tex
