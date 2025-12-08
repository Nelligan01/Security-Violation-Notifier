-- enable_archivelog.sql
-- WARNING: Run only with DBA approval. Requires database shutdown/startup in MOUNT mode.
-- Run as SYSDBA on the CDB (container database), not inside PDB.
SELECT log_mode FROM v$database;
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
-- Configure archive destination (example - adjust path):
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/u01/app/oracle/oradata/archivelog' SCOPE=SPFILE;
