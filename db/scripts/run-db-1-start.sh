
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db script start\n"
show "YELLOW" "\nstart postgresql database\n"

LOG_FILE=$LOG_DIR/log-psql.txt
mkdir -p $LOG_DIR

cmd="pg_ctl -D /usr/local/var/postgres -l $LOG_FILE start"
show "YELLOW" "$cmd\n"
eval $cmd

show "YELLOW" "\nsee logs in file $LOG_FILE\n"

show "GREEN" "\nend\n"

