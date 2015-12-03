INCLUDES  := $(wildcard www-lib/*.html)
NOTEBOOKS := $(patsubst %.Rmd, %.html, $(wildcard *.Rmd))

all : $(NOTEBOOKS)

%.html : %.Rmd $(INCLUDES)
	R --slave -e "set.seed(100); rmarkdown::render('$(<F)')"

.PHONY : clean
clean :
	rm -rf $(NOTEBOOKS)
