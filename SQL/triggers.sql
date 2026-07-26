-- ==========================================
-- Trigger 1: Audit Product Changes
-- ==========================================

CREATE TABLE IF NOT EXISTS ProductAudit (
    AuditID SERIAL PRIMARY KEY,
    StockCode VARCHAR(20),
    ActionType VARCHAR(20),
    OldPrice DECIMAL(10,2),
    NewPrice DECIMAL(10,2),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION LogProductChanges()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF TG_OP = 'INSERT' THEN

        INSERT INTO ProductAudit
        (
            StockCode,
            ActionType,
            NewPrice
        )
        VALUES
        (
            NEW.StockCode,
            'INSERT',
            NEW.UnitPrice
        );

        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN

        INSERT INTO ProductAudit
        (
            StockCode,
            ActionType,
            OldPrice,
            NewPrice
        )
        VALUES
        (
            NEW.StockCode,
            'UPDATE',
            OLD.UnitPrice,
            NEW.UnitPrice
        );

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ProductAudit
        (
            StockCode,
            ActionType,
            OldPrice
        )
        VALUES
        (
            OLD.StockCode,
            'DELETE',
            OLD.UnitPrice
        );

        RETURN OLD;

    END IF;

END;
$$;

CREATE TRIGGER trg_product_audit
AFTER INSERT OR UPDATE OR DELETE
ON Products
FOR EACH ROW
EXECUTE FUNCTION LogProductChanges();


-- ==========================================
-- Trigger 2: Validate Product Price
-- ==========================================

CREATE OR REPLACE FUNCTION ValidateProductPrice()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF NEW.UnitPrice < 0 THEN
        RAISE EXCEPTION 'UnitPrice cannot be negative';
    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_validate_price
BEFORE INSERT OR UPDATE
ON Products
FOR EACH ROW
EXECUTE FUNCTION ValidateProductPrice();


-- ==========================================
-- Trigger 3: Update Last Modified Timestamp
-- ==========================================

ALTER TABLE Products
ADD COLUMN IF NOT EXISTS LastModified TIMESTAMP;

CREATE OR REPLACE FUNCTION UpdateLastModified()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    NEW.LastModified = CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_last_modified
BEFORE UPDATE
ON Products
FOR EACH ROW
EXECUTE FUNCTION UpdateLastModified();