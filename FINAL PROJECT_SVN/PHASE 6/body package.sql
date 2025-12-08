CREATE OR REPLACE PACKAGE BODY pkg_security AS
    PROCEDURE log_operation(p_user_id NUMBER, p_operation VARCHAR2, p_target_table VARCHAR2, p_details VARCHAR2) IS
    BEGIN
        INSERT INTO operations_log (user_id, operation, target_table, details)
        VALUES (p_user_id, p_operation, p_target_table, p_details);
        COMMIT;
    END;

    PROCEDURE notify_admin(p_violation_id NUMBER) IS
        v_user VARCHAR2(50);
        v_details VARCHAR2(400);
    BEGIN
        SELECT u.username, o.details INTO v_user, v_details
        FROM violations v
        JOIN operations_log o ON v.log_id = o.log_id
        JOIN users u ON o.user_id = u.user_id
        WHERE v.violation_id = p_violation_id;
        DBMS_OUTPUT.PUT_LINE('ALERT: Violation detected! User: ' || v_user || ', Details: ' || v_details);
    END;

    PROCEDURE resolve_violation(p_violation_id NUMBER) IS
    BEGIN
        UPDATE violations
        SET status = 'RESOLVED'
        WHERE violation_id = p_violation_id;
        COMMIT;
    END;

    FUNCTION get_violation_status(p_violation_id NUMBER) RETURN VARCHAR2 IS
        v_status VARCHAR2(20);
    BEGIN
        SELECT status INTO v_status FROM violations WHERE violation_id = p_violation_id;
        RETURN v_status;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'NOT FOUND';
    END;

    FUNCTION count_user_violations(p_user_id NUMBER) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM violations v
        JOIN operations_log o ON v.log_id = o.log_id
        WHERE o.user_id = p_user_id;
        RETURN v_count;
    END;
END pkg_security;
/
