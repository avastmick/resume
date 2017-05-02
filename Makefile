all: cv letter clean 
 
cv: resume.pdf
resume.pdf: resume.md
	pandoc --latex-engine=xelatex --template resume-template.tex --from markdown -o cv/resume.pdf resume.md
 
letter: cover-letter.pdf
cover-letter.pdf: cover-letter.md
	pandoc --latex-engine=xelatex --template cover-letter-template.tex --from markdown -o cv/cover-letter.pdf cover-letter.md

html: resume.html 
resume.html: styles/main.css resume.md 
	pandoc --standalone -H styles/main.css --from markdown --to html -o cv/resume.html resume.md 
	mv resume.html cv/. 
 
docx: resume.docx 
resume.docx: resume.md 
	pandoc -s -S resume.md -o resume.docx 
	mv resume.docx cv/.   

clean:
	rm -f *.html *.pdf *.tuc *.aux *.out *.log

