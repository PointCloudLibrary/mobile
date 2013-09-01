#!/bin/sh

set -e

ver=41_20121003oss

rm -rf src/tbb

mkdir src/tbb
cd src/tbb

wget -vO- \
  "http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb${ver}_src.tgz" \
  | tar -xz --strip-components=2
