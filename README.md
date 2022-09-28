# Refurb Plugin Example

This repo is meant to be a good starting point for those who are looking to
make plugins for Refurb.

For illustrative purposes, this plugin will emit an error when the following
`print` statement is found:

```python
print("Hello world!")
```

## Setup

First things first, fork this repo. Make sure to change the name, but keep
the `refurb-` prefix (for naming convention sake).

Next, clone:

```
$ git clone https://github.com/USERNAME/refurb-your-plugin
$ cd refurb-your-plugin
```

Of course, replacing `refurb-your-plugin` with the name you picked.

Then, update the `pyproject.toml` file with the your information.
You can run the `setup.sh` script to do this for you, which will ask you a series
of questions. If the script does not work, you will have to update it manually
(you should only need to update the first two sections).

## Check Discovery

In order for Refurb to find and use your check, 2 conditions must be met:

1. You must export a class that starts with `Error`, which will contain the error metadata. Note:
  * It must derive from `Error`
  * It cannot be named `ErrorCode`
2. You must have a function called `check`, which is the entry point for a given check.

The definition for a `check` function looks something like this:

```
def check(node: CallExpr, errors: list[Error]) -> None:
    ...
```

Where `CallExpr` is the node you want to accept, and `errors` is where you append an
error if one occurs. You can accept multiple node types using a type union, like so:

```
def check(node: UnaryExpr | OpExpr, errors: list[Error]) -> None:
    ...
```

This check will accept both unary and binary expressions.

Any nested folders must contain an `__init__.py` file. This might not be 100% necessary,
but from what I can tell, it is best to add it in anyways.
