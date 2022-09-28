.PHONY: install flake8 mypy black isort test self-test

all: flake8 black isort test self-test

install:
	pip install -r requirements.txt
	pip install -r dev-requirements.txt

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

self-test:
	refurb refurb_plugin_example
