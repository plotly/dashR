all: update document install

update:
	Rscript inst/update_components.R

document:
	Rscript -e "devtools::document()"

install:
	R CMD install .
