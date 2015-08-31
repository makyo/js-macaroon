.PHONY: deps
deps:
	npm install
	cat sjcl-header.js node_modules/sjcl/sjcl.js footer.js > sjcl-wrapped.js
	cat nacl-header.js node_modules/tweetnacl/nacl-fast.js > nacl-wrapped.js

.PHONY: test
test:
	npm test

.PHONY: clean
clean:
	rm -rf node_modules
