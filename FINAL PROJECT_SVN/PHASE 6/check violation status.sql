CREATE OR REPLACE FUNCTION get_violation_status(
    p_violation_id IN NUMBER
) RETURN VARCHAR2
IS
    v_status VARCHAR2(20);
BEGIN
    SELECT status INTO v_status
    FROM violations
    WHERE violation_id = p_violation_id;

    RETURN v_status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NOT FOUND';
END get_violation_status;
/
