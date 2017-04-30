all: html pdf docx clean 
 
pdf: resume.pdf clean
resume.pdf: resume.md
	pandoc --standalone --template styles/main.tex --from markdown --to context -V papersize=A4 -o resume.tex resume.md 
	context resume.tex
	mv resume.html cv/. 
 
html: resume.html 
resume.html: styles/main.css resume.md 
	pandoc --standalone -H styles/main.css --from markdown --to html -o resume.html resume.md 
	mv resume.html cv/. 
 
docx: resume.docx 
resume.docx: resume.md 
	pandoc -s -S resume.md -o resume.docx 
	mv resume.docx cv/.   

clean:
	rm -f *.html *.pdf *.tuc *.aux *.out *.log

