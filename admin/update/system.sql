DROP TRIGGER IF EXISTS trg_before_insert_monthly;
DROP TRIGGER IF EXISTS trg_before_update_monthly;

CREATE TRIGGER trg_before_insert_monthly
BEFORE INSERT ON monthly_draw_entries
FOR EACH ROW
SET NEW.cum_key = IF(
    NEW.cumulative = 1,
    CONCAT(NEW.customer_id, '-', NEW.month_ref),
    NULL
);

CREATE TRIGGER trg_before_update_monthly
BEFORE UPDATE ON monthly_draw_entries
FOR EACH ROW
SET NEW.cum_key = IF(
    NEW.cumulative = 1,
    CONCAT(NEW.customer_id, '-', NEW.month_ref),
    NULL
);