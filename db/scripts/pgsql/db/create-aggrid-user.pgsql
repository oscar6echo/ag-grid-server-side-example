
-- create a separate user for hasura

-- v1 is $USER
-- v2 is '$USER_PWD'

CREATE ROLE :v1 WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD :v2;
-- CREATE ROLE :v1 WITH SUPERUSER LOGIN ENCRYPTED PASSWORD :v2;