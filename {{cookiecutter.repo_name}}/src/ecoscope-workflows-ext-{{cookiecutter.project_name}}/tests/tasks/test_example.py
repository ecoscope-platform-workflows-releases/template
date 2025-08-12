from ecoscope_workflows_ext_{{cookiecutter.project_name | replace('-', '_') }}.tasks import (
    add_one_thousand,
)


def test_add_one_thousand():
    assert 1001 == add_one_thousand(1)
