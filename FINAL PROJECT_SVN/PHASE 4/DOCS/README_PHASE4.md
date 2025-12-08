# Phase IV — Database Creation (Oracle SQL Developer environment)

Project: Security Violation Notifier
Group: C
Student: Nshuro Arnaud Nelligan (27960)
PDB Name: C_27960_Arnaud_SecurityViolationNotifier_DB
Admin user: c27960_arnaud_admin  (password: Arnaud)

## Overview
These scripts are intended to be run on an Oracle Database server where you have SYSDBA privileges (or via Oracle SQL Developer connected as SYS).

## Run order
1. create_pdb.sql  -- Run as SYSDBA (if you must create a PDB)
2. tablespaces_create.sql  -- Run connected to the new PDB
3. create_admin_user.sql  -- Run in PDB to create the schema owner
4. set_memory_params.sql  -- Optional (requires SYS privileges)
5. enable_archivelog.sql  -- Optional (requires SYS and restart)
6. verify_setup.sql  -- Run to validate configuration

## Notes & Environment
- Update file paths in tablespace script to match the host filesystem (C:\APP\ORADATA\FREE\SYSTEM01.DBF).
- If using Oracle Cloud Autonomous DB/ATP, you cannot run PDB or tablespace scripts. Document limitations in README.
- Password used for admin follows assignment instruction (first name). Change before production use.

## GitHub structure
- database/
  - scripts/
    - create_pdb.sql
    - tablespaces_create.sql
    - create_admin_user.sql
    - set_memory_params.sql
    - enable_archivelog.sql
    - verify_setup.sql
  - documentation/
    - README_PHASE4.md

## Checklist before running
- Have SYSDBA privileges or coordinate with DBA
- Ensure sufficient disk space for datafiles
- Backup any important data before enabling ARCHIVELOG or changing parameters
