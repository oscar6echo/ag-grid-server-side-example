
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db script start\n"
show "YELLOW" "\nstop postgresql database\n"

cmd="pg_ctl -D /usr/local/var/postgres stop"
show "YELLOW" "$cmd\n"
eval $cmd

show "GREEN" "\nend\n"

