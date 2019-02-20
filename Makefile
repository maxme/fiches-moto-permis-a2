SOURCE_MD=$(wildcard *.md)
PROCESSED_MD=$(patsubst %.md, build/%.md, $(SOURCE_MD))

all: fiches-moto-permis-a2.epub

build/%.md : %.md build
	./tools/pre-process-for-pandoc.sh $< $@

build:
	mkdir build

clean:
	rm -rf build/

fiches-moto-permis-a2.epub: $(PROCESSED_MD)
	pandoc -o $@ title.txt build/README.md \
		build/fiche-1.md \
		build/fiche-2.md \
		build/fiche-3.md \
		build/fiche-4.md \
		build/fiche-5.md \
		build/fiche-6.md \
		build/fiche-7.md \
		build/fiche-8.md \
		build/fiche-9.md \
		build/fiche-10.md \
		build/fiche-11.md \
		build/fiche-12.md \
		build/fiches-interrogations.md \
		build/verifications-techniques.md
