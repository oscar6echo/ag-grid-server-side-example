

-- re https://stackoverflow.com/questions/3023583/postgresql-how-to-quickly-drop-a-user-with-existing-privileges
-- v1 is username
-- v2 is superuser

REASSIGN OWNED BY :v1 TO :v2;

DROP OWNED BY :v1;

DROP USER :v1;
