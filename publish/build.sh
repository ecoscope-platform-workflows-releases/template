#!/bin/bash

RECIPES=(
    "release/ecoscope-workflows-ext-template"
)
project_root=$(pwd)/src/ecoscope-workflows-ext-template
export HATCH_VCS_VERSION=$(cd $project_root && hatch version)
echo "HATCH_VCS_VERSION=$HATCH_VCS_VERSION"


echo "Building recipes: ${RECIPES[@]}"

pixi clean cache --yes
rm -rf ./workflows/template/ecoscope-workflows-template-workflow/.pixi

rm -rf /tmp/ecoscope-workflows/release/artifacts
mkdir -p /tmp/ecoscope-workflows/release/artifacts

for rec in "${RECIPES[@]}"; do
    echo "Building $rec"
    rattler-build build \
    --recipe $(pwd)/publish/recipes/${rec}.yaml \
    --output-dir /tmp/ecoscope-workflows/release/artifacts \
    --channel file:///tmp/ecoscope-workflows/release/artifacts \
    --channel https://prefix.dev/ecoscope-workflows \
    --channel conda-forge
done
