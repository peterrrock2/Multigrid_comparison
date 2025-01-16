#!/bin/bash


julia aux_script_files/setup.jl

python3 -m venv .venv 

source .venv/bin/activate
pip3 install -r py_requirements.txt


cargo install binary-ensemblea
cargo install --git https://github.com/mggg/frcw.rs
cargo install --git https://github.com/peterrrock2/msms_parser.git
cargo install --path ./Ben_Tally


chmod +x run_frcw.sh
chmod +x run_forest.sh
chmod +x tally_changes.sh
chmod +x run_all.sh