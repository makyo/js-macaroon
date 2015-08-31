.PHONY: deps
deps:
	npm install

.PHONY: test
test:
	$(MAKE) -j2 test-server test-browser

.PHONY: test-server
test-server:
	python -m SimpleHTTPServer

.PHONY: test-browser
test-browser:
	xdg-open http://localhost:8000/test/index.html

.PHONY: clean
clean:
	rm -rf node_modules
