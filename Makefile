bin        = $(shell npm bin)
lsc        = $(bin)/lsc
browserify = $(bin)/browserify
groc       = $(bin)/groc
uglify     = $(bin)/uglifyjs
VERSION    = $(shell node -e 'console.log(require("./package.json").version)')


lib: src/*.ls
	$(lsc) -o lib -c src/*.ls

dist:
	mkdir -p dist

dist/versione.umd.js: compile dist
	$(browserify) lib/index.js --standalone versione > $@

dist/versione.umd.min.js: dist/versione.umd.js
	$(uglify) --mangle - < $^ > $@

# ----------------------------------------------------------------------
bundle: dist/versione.umd.js

minify: dist/versione.umd.min.js

compile: lib

documentation:
	$(groc) --index "README.md"                                              \
	        --out "docs/literate"                                            \
	        src/*.ls test/*.ls test/specs/**.ls README.md

clean:
	rm -rf dist build lib

test:
	$(lsc) test/tap.ls

package: compile documentation bundle minify
	mkdir -p dist/versione-$(VERSION)
	cp -r docs/literate dist/versione-$(VERSION)/docs
	cp -r lib dist/versione-$(VERSION)
	cp dist/*.js dist/versione-$(VERSION)
	cp package.json dist/versione-$(VERSION)
	cp README.md dist/versione-$(VERSION)
	cp LICENCE dist/versione-$(VERSION)
	cd dist && tar -czf versione-$(VERSION).tar.gz versione-$(VERSION)

publish: clean
	npm install
	npm publish

bump:
	node tools/bump-version.js $$VERSION_BUMP

bump-feature:
	VERSION_BUMP=FEATURE $(MAKE) bump

bump-major:
	VERSION_BUMP=MAJOR $(MAKE) bump


.PHONY: test
