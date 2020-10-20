# Makefile
# 
# Converts Markdown to other formats (HTML, PDF, DOCX, RTF, ODT, EPUB) using Pandoc
# <http://johnmacfarlane.net/pandoc/>
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files

# Convert all files in this directory that have a .md suffix

RSS_FEED_PATH = docs/feed.rss

GENERATED_SOURCE_DOCS := $(wildcard docs/*.md)
GENERATED_RSS_FEEDS := $(wildcard docs/*.rss)

EXPORTED_HTML_POST_DOCS = $(GENERATED_SOURCE_DOCS:docs/%.md=docs/posts/%.html)
EXPORTED_PDF_DOCS = $(GENERATED_SOURCE_DOCS:docs/%.md=docs/pdfs/%.pdf)
EXPORTED_CITATION_DOCS = $(GENERATED_SOURCE_DOCS:docs/%.md=docs/%.citations.txt)

EXPORTED_DOCS=\
 $(EXPORTED_HTML_POST_DOCS) \
 $(EXPORTED_PDF_DOCS) \
 $(EXPORTED_CITATION_DOCS)

RM=/bin/rm

PANDOC=pandoc

PANDOC_OPTIONS=--standalone --bibliography=bibliography.bib --csl=chicago-inline.csl

PANDOC_HTML_OPTIONS=--to html5 --template=template.html
PANDOC_PDF_OPTIONS=--include-after-body=/dev/null

DHALL_COMMAND = dhall to-directory-tree --file content/site.dhall --output docs --explain

# Targets and dependencies

all : $(EXPORTED_DOCS) docs/feed.rss docs/index.html

html : $(EXPORTED_HTML_POST_DOCS) docs/feed.rss

clean:
	$(RM) $(EXPORTED_DOCS) $(GENERATED_SOURCE_DOCS) $(GENERATED_RSS_FEEDS)

# Pattern-matching Rules

docs/posts/%.html : docs/%.md
	$(PANDOC) $(PANDOC_OPTIONS) --css "../pandoc.css" $(PANDOC_HTML_OPTIONS) -o $@ $<

docs/index.html : docs/index.md
	$(PANDOC) $(PANDOC_OPTIONS) --css "pandoc.css" $(PANDOC_HTML_OPTIONS) -o $@ $<

docs/pdfs/%.pdf : docs/%.md
	echo "PDF" $@
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<

%.citations.txt : %.md
	pandoc --bibliography=bibliography.bib -t json --lua-filter bibexport.lua -s $< -M auxfile=$@ > /dev/null

%.md : content/site.dhall
	$(DHALL_COMMAND)

docs/feed.sh : content/site.dhall
	$(DHALL_COMMAND)

docs/feed.rss : docs/feed.sh
	sh ./docs/feed.sh > docs/feed.rss