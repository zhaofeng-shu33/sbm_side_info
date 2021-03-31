BUILD_DIR = ./build

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(BUILD_DIR)/main.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/


$(BUILD_DIR)/main.pdf: main.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) main.tex
	cd $(BUILD_DIR) && bibtex main.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) main.tex
	pdflatex -output-directory=$(BUILD_DIR) main.tex
