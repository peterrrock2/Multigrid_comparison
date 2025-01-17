#!/bin/bash

for f in $(find . -type f -name "square*.ben")
do
    ben-tally -m changed-assignments -g ./JSON/square_multigraph.json -b $f
done

for f in $(find . -type f -name "linear*.ben")
do
    ben-tally -m changed-assignments -g ./JSON/linear_multigraph.json -b $f
done
