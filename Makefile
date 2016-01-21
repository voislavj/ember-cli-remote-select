PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean-docs clean build test dist publish

init:
	npm install

docs:
	docco src/*.coffee

clean-docs:
	rm -rf docs/

clean: clean-docs
	rm -rf build/ test/*.js

build:
	coffee -o build/ -c src/ && coffee -c test/index.coffee

test:
	nodeunit test/index.js

dist: clean init docs build test

publish: dist
	npm publish