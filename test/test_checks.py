from pathlib import Path

from refurb.main import run_refurb
from refurb.settings import Settings

TEST_DATA_PATH = Path("test/data")


def test_checks() -> None:
    errors = run_refurb(
        Settings(files=["test/data/"], load=["refurb_plugin_example"])
    )
    got = "\n".join([str(error) for error in errors])

    files = sorted(TEST_DATA_PATH.glob("*.txt"), key=lambda p: p.name)
    expected = "\n".join(file.read_text()[:-1] for file in files)

    assert got == expected
