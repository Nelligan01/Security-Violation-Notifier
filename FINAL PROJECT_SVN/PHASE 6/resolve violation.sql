CREATE OR REPLACE PROCEDURE resolve_violation(
    p_violation_id IN NUMBER
)
IS
BEGIN
    UPDATE violations
    SET status = 'RESOLVED'
    WHERE violation_id = p_violation_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error resolving violation: ' || SQLERRM);
END resolve_violation;
/
