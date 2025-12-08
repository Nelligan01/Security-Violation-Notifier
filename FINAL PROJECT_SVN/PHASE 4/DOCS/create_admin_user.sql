-- Create admin user
CREATE USER c27960_arnaud_admin IDENTIFIED BY "Arnaud"
  DEFAULT TABLESPACE svn_data
  TEMPORARY TABLESPACE svn_temp
  QUOTA UNLIMITED ON svn_data;

-- Grant system privileges
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, 
      CREATE SEQUENCE, CREATE TRIGGER, CREATE TYPE, CREATE SYNONYM,
      UNLIMITED TABLESPACE
TO c27960_arnaud_admin;

-- Create and assign role
CREATE ROLE svn_admin_role;
GRANT ALL PRIVILEGES TO svn_admin_role;
GRANT svn_admin_role TO c27960_arnaud_admin;
