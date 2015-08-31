.PHONY: deps
deps:
	npm install

.PHONY: test
test:
	node_modules/mocha/bin/mocha test/node-test.js
	$(MAKE) -j2 test-server test-browser

.PHONY: test-server
test-server:
	python -m SimpleHTTPServer

.PHONY: test-browser
test-browser:
	xdg-open http://localhost:8000/test/index.html

.PHONY: clean
clean:
	rm -rf node_modules build

.PHONY: build
build:
	mkdir -p build
	cat templates/yui-header.js \
		node_modules/sjcl/sjcl.js \
		node_modules/tweetnacl/nacl-fast.js \
		macaroon.js \
		templates/yui-footer.js > build/yui-macaroon.js

	cat templates/node-header.js \
		macaroon.js \
		templates/node-footer.js > build/node-macaroon.js

.PHONY: lint
lint:
	node_modules/jslint/bin/jslint.js macaroon.js test/test.js test/node-test.js
