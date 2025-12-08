CREATE INDEX idx_log_user       ON operations_log(user_id);
CREATE INDEX idx_violation_policy ON violations(policy_id);
CREATE INDEX idx_violation_log    ON violations(log_id);
