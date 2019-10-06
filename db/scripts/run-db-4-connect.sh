
#!/bin/bash

# exec this file as 'source [filename].sh' to modify current shell env

show "RED" "\nstart db-connect\n\n"

psql -U $USER -d $DB_NAME
