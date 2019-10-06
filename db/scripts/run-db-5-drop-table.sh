
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\nstart db drop-table\n"

cmd="psql -U $USER -d $DB_NAME"

echo
declare -a tables=(
    "winners"
    )
show "YELLOW" "postgresql: drop ${#tables[@]} tables\n"

for table in "${tables[@]}"
do
    show "CYAN" "\npostgresql: drop $table\n"
    file="$PGSQL_DIR/db/drop-table.pgsql"
    eval $cmd -e -f $file -v v1='$table'
    show "GREEN" "done\n"
done

show "GREEN" "\nend\n"
