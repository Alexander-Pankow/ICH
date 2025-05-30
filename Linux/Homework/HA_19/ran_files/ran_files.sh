#!/bin/bash

set -e

cd /opt/210225-ptm/Pankow/HW_19/ran_files

for i in {1..100}
do
    filename=$RANDOM
    touch "$filename"
done


echo "Done"
