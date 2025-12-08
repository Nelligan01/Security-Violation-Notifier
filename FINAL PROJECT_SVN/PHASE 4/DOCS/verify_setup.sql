-- verify_setup.sql
-- Run these queries to verify the environment

-- List PDBs and status (run as CDB)
SELECT pdb_name, status FROM cdb_pdbs;

-- Check tablespaces in this PDB
SELECT tablespace_name, status, contents FROM dba_tablespaces;

-- Check created admin user
SELECT username, account_status, default_tablespace FROM dba_users WHERE username = 'C27960_ARNAUD_ADMIN';

-- Memory parameters
SELECT name, value FROM v$parameter WHERE name IN ('sga_target', 'pga_aggregate_target', 'memory_target');

-- Archive mode status
SELECT log_mode FROM v$database;
