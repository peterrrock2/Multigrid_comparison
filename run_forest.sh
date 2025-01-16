#!/bin/bash

julia ./aux_script_files/run_square_multi.jl | msms_parser -g ./JSON/square_multigraph.json -o square_multigraph_1M_jl.jsonl.ben -b -r precinct -s precinct -v

julia ./aux_script_files/run_linear_multi.jl | msms_parser -g ./JSON/linear_multigraph.json -o linear_multigraph_1M_jl.jsonl.ben -b -r precinct -s precinct -v