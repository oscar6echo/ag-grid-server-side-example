
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db create-table\n"


cmd="psql -U $USER -d $DB_NAME"

echo
declare -a tables=(
    "winners"
    )
show "YELLOW" "postgresql: create ${#tables[@]} tables\n"

for table in "${tables[@]}"
do
    file="$PGSQL_DIR/db/create-table-$table.pgsql"
    show "CYAN" "\npostgresql: create $table\n"
    eval $cmd -f $file
    show "GREEN" "done\n"
done


show "GREEN" "\nend\n"
