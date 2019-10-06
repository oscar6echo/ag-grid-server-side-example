#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db script build-insert-script\n"

show "YELLOW" "python path - make sure it is correct\n"
python -c 'import sys; print(sys.prefix)'
show "GREEN" "done\n"

file="$PGSQL_DIR/run-build-template-input.py"
show "YELLOW" "\npython: run script $file\n"
python $file
show "GREEN" "done\n"

file="$PGSQL_DIR/run-build-script-pgsql.py"
show "YELLOW" "\npython: run script $file\n"
python $file
show "GREEN" "done\n"


show "GREEN" "\nend\n"
