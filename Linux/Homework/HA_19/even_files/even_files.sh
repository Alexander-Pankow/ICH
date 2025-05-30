#!/bin/bash

set -e

src_dir="/opt/210225-ptm/Pankow/HW_19/ran_files"
dst_dir="/opt/210225-ptm/Pankow/HW_19/even_files"

cd "$src_dir"

for file in *
do
    if [[ -f "$file" ]]; then
        if (( file % 2 == 0 )); then
            mv "$file" "$dst_dir/"
        fi
    fi
done

echo "Done"
