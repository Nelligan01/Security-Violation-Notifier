CREATE PLUGGABLE DATABASE C_27960_Arnaud_SecurityViolationNotifier_DB
  ADMIN USER pdb_admin IDENTIFIED BY "Arnaud"
  FILE_NAME_CONVERT = (
    'C:\APP\ORADATA\FREE\PDBSEED\',
    'C:\APP\ORADATA\FREE\C_27960_Arnaud_SecurityViolationNotifier_DB\'
  );
