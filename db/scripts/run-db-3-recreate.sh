
#!/bin/bash

# exec this file as 'source [filename].sh' to be in current shell env

clear 

show "RED" "\n(re)create db\n\n"

echo
DB_EXISTS=$(psql -l | grep $DB_NAME | wc -l)
if [ $DB_EXISTS -eq "1" ]
then
    show "YELLOW" "postgresql: force drop database $DB_NAME as user $SUPERUSER_LOCAL\n"
    psql -d postgres -U $SUPERUSER_LOCAL -e -f pgsql/db/force-drop-db.pgsql -v v1="$DB_NAME" -v v2="'$DB_NAME'"
    show "GREEN" "done\n"
else
    show "YELLOW" "postgresql: $DB_NAME does not exist\n"
    show "GREEN" "nothing to do\n"
fi

echo
show "YELLOW" "postgresql: drop user $USER\n"
psql -U $SUPERUSER_LOCAL -d postgres -f pgsql/db/drop-aggrid-user.pgsql -v v1="$USER"
show "GREEN" "done\n"

echo
show "YELLOW" "postgresql: create user $USER with superuser privileges\n"
psql -U $SUPERUSER_LOCAL -d postgres -e -f pgsql/db/create-aggrid-user.pgsql -v v1="$USER" -v v2="'$USER_PWD'"
show "GREEN" "done\n"

echo
show "YELLOW" "postgresql: create database $DB_NAME as user $SUPERUSER_LOCAL\n"
psql -d postgres -U $SUPERUSER_LOCAL -e -c "CREATE DATABASE $DB_NAME;"
show "GREEN" "done\n"


update_pgpass "localhost:5432:$DB_NAME:$SUPERUSER_LOCAL:$SUPERUSER_PWD"
update_pgpass "localhost:5432:$DB_NAME:$USER:$USER_PWD"
show_pgpass

show "GREEN" "\nend\n"


