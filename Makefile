SOURCE_MD=$(wildcard *.md)
PROCESSED_MD=$(patsubst %.md, build/%.md, $(SOURCE_MD))
ORDERED_FILES=build/README.md \
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

OUT=out/fiches-moto-permis-a2.epub out/fiches-moto-permis-a2.asciidoc out/fiches-moto-permis-a2.html

all: $(OUT)

build/%.md : %.md build
	./tools/pre-process-for-pandoc.sh $< $@

out/fiches-moto-permis-a2.epub: $(PROCESSED_MD) out
	pandoc -o $@ title.txt $(ORDERED_FILES)

out/fiches-moto-permis-a2.asciidoc: $(PROCESSED_MD) out
	pandoc -t asciidoc -o $@ title.txt $(ORDERED_FILES)

out/fiches-moto-permis-a2.html: out/fiches-moto-permis-a2.asciidoc out
	asciidoc -o $@ $<

out/fiches-moto-permis-a2.pdf: out/fiches-moto-permis-a2.asciidoc out
	asciidoctor-pdf -o $@ $<

build:
	mkdir build

out:
	mkdir out

clean:
	rm -rf build/

distclean: clean
	rm -rf out/
