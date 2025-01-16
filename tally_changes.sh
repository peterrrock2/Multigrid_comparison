#!/bin/bash

for f in $(find . -type f -name "square*.ben")
do
    ben-tally -m changed-assignments -g ./JSON/square_multigraph.json -b $f --normalize
done

for f in $(find . -type f -name "linear*.ben")
do
    ben-tally -m changed-assignments -g ./JSON/linear_multigraph.json -b $f --normalize
done