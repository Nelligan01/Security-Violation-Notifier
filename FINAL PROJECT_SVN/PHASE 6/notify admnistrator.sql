CREATE OR REPLACE PROCEDURE notify_admin(
    p_violation_id IN NUMBER
)
IS
    v_user      VARCHAR2(50);
    v_details   VARCHAR2(400);
BEGIN
    SELECT u.username, o.details
    INTO v_user, v_details
    FROM violations v
    JOIN operations_log o ON v.log_id = o.log_id
    JOIN users u ON o.user_id = u.user_id
    WHERE v.violation_id = p_violation_id;

    DBMS_OUTPUT.PUT_LINE('ALERT: Violation detected! User: ' || v_user || ', Details: ' || v_details);

    -- Optional: email logic using UTL_MAIL package
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No violation found for ID ' || p_violation_id);
END notify_admin;
/
