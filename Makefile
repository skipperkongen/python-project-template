venv:
	python3 -m venv venv
	source venv/bin/activate && pip install -e '.[tests]'
	
lint: venv
	source venv/bin/activate && flake8 --max-line-length 100 src
.PHONY: lint

test: venv
	source venv/bin/activate && pytest
.PHONY: test

build:
	source venv/bin/activate && python -m build
.PHONY: test

publish: build
	source venv/bin/activate && twine upload dist/*
.PHONY: build

clean:
	rm -rf dist
.PHONY: clean