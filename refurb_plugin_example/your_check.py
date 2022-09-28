from dataclasses import dataclass

from mypy.nodes import CallExpr, NameExpr, StrExpr

from refurb.error import Error


@dataclass
class ErrorYourCheck(Error):
    """
    TODO: fill this in

    Bad:

    ```
    # TODO: fill this in
    ```

    Good:

    ```
    # TODO: fill this in
    ```
    """

    prefix = "XYZ"
    code = 100
    msg: str = "Your message here"


def check(node: CallExpr, errors: list[Error]) -> None:
    match node:
        case CallExpr(
            callee=NameExpr(fullname="builtins.print"),
            args=[StrExpr(value="Hello world!")],
        ):
            errors.append(ErrorYourCheck(node.line, node.column))
