all: html pdf docx clean

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template styles/main.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex
	mv resume.pdf draft/.

html: resume.html
resume.html: styles/main.css resume.md
	pandoc --standalone -H styles/main.css \
        --from markdown --to html \
        -o resume.html resume.md
	mv resume.html draft/.

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx
	mv resume.docx draft/.	

clean:
	rm resume.tex
	rm resume.tuc
	rm resume.log
