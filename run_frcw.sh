#!/bin/bash

echo "Running FRCW"

frcw --graph-json ./JSON/square_multigraph.json \
    --n-steps 1000000000 \
    --n-threads 10 \
    --pop-col TOTPOP \
    --rng-seed 42 \
    --tol 0.00001 \
    --batch-size 10 \
    --variant reversible \
    --assignment-col assignment \
    --cut-edges-count \
    --balance-ub 30 \
    --writer ben -o square_rev_1B.jsonl.ben

frcw --graph-json ./JSON/linear_multigraph.json \
    --n-steps 1000000000 \
    --n-threads 10 \
    --pop-col TOTPOP \
    --rng-seed 42 \
    --tol 0.00001 \
    --batch-size 10 \
    --variant reversible \
    --assignment-col assignment \
    --cut-edges-count \
    --balance-ub 30 \
    --writer ben -o linear_rev_1B.jsonl.ben


vars=("cut-edges-rmst" "district-pairs-rmst" "cut-edges-ust" "district-pairs-ust") 
var_names=("A" "B" "C" "D")

for i in {0..3}
do
    frcw --graph-json ./JSON/square_multigraph.json \
        --n-steps 10000000 \
        --n-threads 1 \
        --pop-col TOTPOP \
        --rng-seed 42 \
        --tol 0.00001 \
        --batch-size 1 \
        --variant ${vars[$i]} \
        --assignment-col assignment \
        --writer ben -o "square_${var_names[$i]}_10M.jsonl.ben" &

    echo "Done with square $i"

    frcw --graph-json ./JSON/linear_multigraph.json \
        --n-steps 10000000 \
        --n-threads 1 \
        --pop-col TOTPOP \
        --rng-seed 42 \
        --tol 0.00001 \
        --batch-size 1 \
        --variant ${vars[$i]} \
        --assignment-col assignment \
        --writer ben -o "linear_${var_names[$i]}_10M.jsonl.ben" &

    echo "Done with linear $i"
done 


# echo "Running FRCW"

# frcw --graph-json ./JSON/square_multigraph.json \
#     --n-steps 10000 \
#     --n-threads 10 \
#     --pop-col TOTPOP \
#     --rng-seed 42 \
#     --tol 0.00001 \
#     --batch-size 10 \
#     --variant reversible \
#     --assignment-col assignment \
#     --cut-edges-count \
#     --balance-ub 30 \
#     --writer ben -o square_rev_1B.jsonl.ben

# frcw --graph-json ./JSON/linear_multigraph.json \
#     --n-steps 10000 \
#     --n-threads 10 \
#     --pop-col TOTPOP \
#     --rng-seed 42 \
#     --tol 0.00001 \
#     --batch-size 10 \
#     --variant reversible \
#     --assignment-col assignment \
#     --cut-edges-count \
#     --balance-ub 30 \
#     --writer ben -o linear_rev_1B.jsonl.ben


# vars=("cut-edges-rmst" "district-pairs-rmst" "cut-edges-ust" "district-pairs-ust") 
# var_names=("A" "B" "C" "D")

# for i in {0..3}
# do
#     frcw --graph-json ./JSON/square_multigraph.json \
#         --n-steps 100 \
#         --n-threads 1 \
#         --pop-col TOTPOP \
#         --rng-seed 42 \
#         --tol 0.00001 \
#         --batch-size 1 \
#         --variant ${vars[$i]} \
#         --assignment-col assignment \
#         --writer ben -o "square_${var_names[$i]}_10M.jsonl.ben" &

#     echo "Done with square $i"

#     frcw --graph-json ./JSON/linear_multigraph.json \
#         --n-steps 100 \
#         --n-threads 1 \
#         --pop-col TOTPOP \
#         --rng-seed 42 \
#         --tol 0.00001 \
#         --batch-size 1 \
#         --variant ${vars[$i]} \
#         --assignment-col assignment \
#         --writer ben -o "linear_${var_names[$i]}_10M.jsonl.ben" &

#     echo "Done with linear $i"
# done 