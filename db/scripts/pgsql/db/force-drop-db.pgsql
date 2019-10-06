
-- v1 is db_name
-- v1 is  'db_name'

-- Make sure no one can connect to this database
UPDATE pg_database SET datallowconn = 'false' WHERE datname = :v2;

-- Force disconnection of all clients connected to this database
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = :v2;

-- Drop the database
DROP DATABASE :v1;
