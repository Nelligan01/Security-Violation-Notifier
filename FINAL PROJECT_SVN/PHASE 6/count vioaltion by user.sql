CREATE OR REPLACE FUNCTION count_user_violations(
    p_user_id IN NUMBER
) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM violations v
    JOIN operations_log o ON v.log_id = o.log_id
    WHERE o.user_id = p_user_id;

    RETURN v_count;
END count_user_violations;
/
