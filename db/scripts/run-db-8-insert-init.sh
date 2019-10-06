
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db insert-init\n"


cmd="psql -U $USER -d $DB_NAME"

echo
show "YELLOW" "postgresql: insert data into table\n"

file="$PGSQL_DIR/data/insert-init.pgsql"
eval $cmd -f $file
show "GREEN" "done\n"


show "GREEN" "\nend\n"
