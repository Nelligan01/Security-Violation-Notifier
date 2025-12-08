CREATE OR REPLACE PROCEDURE log_operation(
    p_user_id      IN NUMBER,
    p_operation    IN VARCHAR2,
    p_target_table IN VARCHAR2,
    p_details      IN VARCHAR2
)
IS
BEGIN
    INSERT INTO operations_log (user_id, operation, target_table, details)
    VALUES (p_user_id, p_operation, p_target_table, p_details);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error logging operation: ' || SQLERRM);
END log_operation;
/
