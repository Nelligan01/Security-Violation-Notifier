CREATE TABLE audit_log (
    audit_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10) NOT NULL,
    operation VARCHAR2(50) NOT NULL,
    table_name VARCHAR2(50) NOT NULL,
    action_time DATE DEFAULT SYSDATE,
    status VARCHAR2(20) DEFAULT 'DENIED',
    details VARCHAR2(400)
);
