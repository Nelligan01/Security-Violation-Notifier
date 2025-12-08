CREATE OR REPLACE FUNCTION check_restriction RETURN BOOLEAN IS
    v_day VARCHAR2(10);
    v_count NUMBER;
BEGIN
    -- Get current day abbreviation
    SELECT TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=ENGLISH') INTO v_day FROM dual;

    -- Weekday restriction
    IF v_day IN ('MON','TUE','WED','THU','FRI') THEN
        RETURN FALSE;
    END IF;

    -- Public holiday restriction
    SELECT COUNT(*) INTO v_count 
    FROM holidays 
    WHERE holiday_date = TRUNC(SYSDATE);

    IF v_count > 0 THEN
        RETURN FALSE;
    END IF;

    -- Allowed
    RETURN TRUE;
END check_restriction;
/
