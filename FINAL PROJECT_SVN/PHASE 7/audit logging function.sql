CREATE OR REPLACE FUNCTION log_audit(
    p_user_id NUMBER,
    p_operation VARCHAR2,
    p_table_name VARCHAR2,
    p_status VARCHAR2,
    p_details VARCHAR2
) RETURN NUMBER IS
    v_audit_id NUMBER;
BEGIN
    SELECT NVL(MAX(audit_id),0)+1 INTO v_audit_id FROM audit_log;

    INSERT INTO audit_log(audit_id, user_id, operation, table_name, status, details)
    VALUES(v_audit_id, p_user_id, p_operation, p_table_name, p_status, p_details);

    COMMIT;
    RETURN v_audit_id;
END log_audit;
/
