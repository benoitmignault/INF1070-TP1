#!/bin/bash

cd "$GASH_HOME" && find . -not -name 'solutions-tp1.md' -delete

mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
cp -p "$mission_dir/trop_long" "$GASH_HOME"
