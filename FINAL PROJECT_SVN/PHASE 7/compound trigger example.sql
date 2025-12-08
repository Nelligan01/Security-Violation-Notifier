CREATE OR REPLACE TRIGGER trg_block_weekday_holiday
BEFORE INSERT OR UPDATE OR DELETE ON operations_log
FOR EACH ROW
DECLARE
    v_allowed BOOLEAN;
BEGIN
    v_allowed := check_restriction;

    IF NOT v_allowed THEN
        log_audit(:NEW.user_id, 'DML ATTEMPT', 'OPERATIONS_LOG', 'DENIED', 'Operation blocked by weekday/holiday rule');
        RAISE_APPLICATION_ERROR(-20001,'Operation not allowed on weekdays or public holidays');
    ELSE
        log_audit(:NEW.user_id, 'DML ATTEMPT', 'OPERATIONS_LOG', 'ALLOWED', 'Operation permitted');
    END IF;
END trg_block_weekday_holiday;
/
