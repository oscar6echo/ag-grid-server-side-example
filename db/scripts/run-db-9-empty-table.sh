
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db empty-all-table\n"


cmd="psql -U $USER -d $DB_NAME"

echo
show "YELLOW" "postgresql: empty all tables\n"

file="$PGSQL_DIR/db/empty-table.pgsql"
eval $cmd -f $file -v v1="winners"
show "GREEN" "done\n"


show "GREEN" "\nend\n"
