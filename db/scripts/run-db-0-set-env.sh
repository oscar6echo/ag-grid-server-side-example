
#!/bin/bash

# exec this file as 'source [filename].sh' to modify current shell env

clear

C_RED="\e[31m"
C_GREEN="\e[32m"
C_BLUE="\e[34m"
C_YELLOW="\e[93m"
C_PURPLE="\e[35m"
C_CYAN="\e[36m"
C_WHITE="\e[37m"
C_RESET="\e[0m"


show () {
    reset="\e[0m"

    case "$1" in
    "RED")
    color="\e[31m"
    ;;
    "GREEN")
    color="\e[32m"
    ;;
    "BLUE")
    color="\e[34m"
    ;;
    "YELLOW")
    color="\e[93m"
    ;;
    "PURPLE")
    color="\e[35m"
    ;;
    "CYAN")
    color="\e[36m"
    ;;
    "WHITE")
    color="\e[37m"
    ;;
    *)
    echo "\n-----INVALID COLOR CODE------\n"
    return
    ;;
    esac

    printf "$color"
    printf "$2"
    printf "$reset"
}

update_pgpass() {
    echo
    new_line=$1

    PGPASS_EXISTS=$(ll -l ~/.pgpass | wc -l)
    if [ $PGPASS_EXISTS -eq "1" ];

    then
        if [ ! -z $(grep $new_line ~/.pgpass) ];
        then
            show "YELLOW" "credentials=$new_line already in ~/.pgpass\n"
            show "YELLOW" "nothing to do\n"
        else
            show "YELLOW" "credentials=$new_line added to ~/.pgpass\n"
            echo $new_line >> ~/.pgpass
        fi
    else
        show "YELLOW" "credentials=$new_line added to new file ~/.pgpass\n"
        echo "#server:port:database:username:password" > ~/.pgpass
        echo $new_line >> ~/.pgpass
        
    fi
    chmod 0600 ~/.pgpass
    show "GREEN" "done\n"
}


show_pgpass() {
    echo
    show "YELLOW" "show ~/.pgpass\n"
    cat ~/.pgpass
    show "GREEN" "done\n"
}

show "RED" "\nstart init set-env\n\n"

# dir
SCRIPT_DIR=$(cd . && pwd)
TOP_DIR=$(cd .. && pwd)
PGSQL_DIR=$(cd $SCRIPT_DIR/pgsql && pwd)
LOG_DIR=$(cd $SCRIPT_DIR/log && pwd)
DATA_DIR=$(cd $SCRIPT_DIR/pgsql/data && pwd)

# db
SUPERUSER_LOCAL="Olivier" # change to your macOS username
SUPERUSER_PWD="pwd" # replace with secure password
USER="aggrid"
USER_PWD="pwdd" # replace with secure password
DB_NAME="olympics" # replace with more expiicit name


# display
echo "SCRIPT_DIR = $SCRIPT_DIR (${#SCRIPT_DIR})"
echo "TOP_DIR = $TOP_DIR (${#TOP_DIR})"
echo "PGSQL_DIR = $PGSQL_DIR (${#PGSQL_DIR})"
echo "LOG_DIR = $LOG_DIR (${#LOG_DIR})"
echo "DATA_DIR = $DATA_DIR (${#DATA_DIR})"
echo

echo "SUPERUSER_LOCAL = $SUPERUSER_LOCAL (${#SUPERUSER_LOCAL})"
echo "SUPERUSER_PWD = $SUPERUSER_PWD (${#SUPERUSER_PWD})"
echo "USER = $USER (${#USER})"
echo "USER_PWD = $USER_PWD (${#USER_PWD})"
echo "DB_NAME = $DB_NAME (${#DB_NAME})"
echo

show "GREEN" "\nend\n"

