#!/bin/bash

python_version=$1

command="pixi run \
--manifest-path src/ecoscope-workflows-ext-{{cookiecutter.project_name}}/pyproject.toml \
--locked --environment test-py${python_version} \
pytest src/ecoscope-workflows-{{cookiecutter.project_name}}/tests -vv"

shift 2
if [ -n "$*" ]; then
    extra_args=$*
    command="$command $extra_args"
fi

echo "Running command: $command"
eval $command
