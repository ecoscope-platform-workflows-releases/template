# [generated]
# by = { compiler = "ecoscope-workflows-core", version = "9999" }
# from-spec-sha256 = "643d239161219e7c904abd28bd05cad82077f35ecd9be771115b88e0730aa8cc"


from pathlib import Path

from ecoscope_workflows_core.testing import TestCase, run_cli_test_case


def test_cli(
    entrypoint: str,
    execution_mode: str,
    mock_io: bool,
    case: TestCase,
    tmp_path: Path,
):
    run_cli_test_case(entrypoint, execution_mode, mock_io, case, tmp_path)
