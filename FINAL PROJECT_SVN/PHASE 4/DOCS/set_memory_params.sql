-- set_memory_params.sql
-- Run as SYSDBA if you need to change CDB/PDB memory parameters
-- Example settings (adjust based on host resources):
ALTER SYSTEM SET sga_target = 2G SCOPE = BOTH;
ALTER SYSTEM SET pga_aggregate_target = 512M SCOPE = BOTH;
-- If using automatic memory management:
-- ALTER SYSTEM SET memory_target = 3G SCOPE = SPFILE;
