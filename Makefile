.PHONY: install flake8 mypy black isort test test-e2e self-test

all: flake8 black isort test self-test

install:
	pip install -r requirements.txt
	pip install -r dev-requirements.txt

install-local:
	pip install -e .

flake8:
	flake8

mypy:
	mypy -p refurb_plugin_example
	mypy -p test --exclude "test/data/*"

black:
	black refurb_plugin_example test

isort:
	isort . --diff --check

test:
	pytest

test-e2e: install-local
	refurb test/e2e/dummy.py

self-test:
	refurb refurb_plugin_example
