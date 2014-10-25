#!/usr/bin/env bash
set -e

tmpdir=$(mktemp -t -d vimcdoc)
cd ${tmpdir}

curl -O https://github.com/yianwillis/vimcdoc/releases/download/v1.9.0/vimcdoc-1.9.0.tar.gz
tar xf vimcdoc-1.9.0.tar.gz

tar vimcdoc-1.9.0
./vimcdoc.sh -i
