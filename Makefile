.PHONY: install
install:
	npm install --global elm elm-format uglify-js

.PHONY: format-fix-all
format-fix-all:
	elm-format --yes .

.PHONY: format-validate
format-validate:
	elm-format --validate .

.PHONY: build
build:
	elm make src/Main.elm --optimize --output elm.js
	uglifyjs elm.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output elm.min.js
	echo "Compiled size:$(cat elm.js | wc -c) bytes  (elm.js)"
	echo "Minified size:$(cat elm.min.js | wc -c) bytes  (elm.min.js)"
	echo "Gzipped size: $(cat elm.min.js | gzip -c | wc -c) bytes"