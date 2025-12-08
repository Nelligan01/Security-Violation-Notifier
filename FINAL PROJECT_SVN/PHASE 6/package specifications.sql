CREATE OR REPLACE PACKAGE pkg_security AS
    PROCEDURE log_operation(p_user_id NUMBER, p_operation VARCHAR2, p_target_table VARCHAR2, p_details VARCHAR2);
    PROCEDURE notify_admin(p_violation_id NUMBER);
    PROCEDURE resolve_violation(p_violation_id NUMBER);
    FUNCTION get_violation_status(p_violation_id NUMBER) RETURN VARCHAR2;
    FUNCTION count_user_violations(p_user_id NUMBER) RETURN NUMBER;
END pkg_security;
/
