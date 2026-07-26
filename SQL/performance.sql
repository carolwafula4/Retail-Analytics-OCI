-- ==========================================
-- Query Performance Analysis
-- ==========================================

-- Query using Primary Key

EXPLAIN ANALYZE

SELECT *

FROM Products

WHERE StockCode = '10002';


-- Query using Description

EXPLAIN ANALYZE

SELECT *

FROM Products

WHERE Description = 'ROBOT PENCIL SHARPNER';


-- ==========================================
-- Create Index
-- ==========================================

CREATE INDEX IF NOT EXISTS idx_products_description

ON Products (Description);


-- ==========================================
-- Query After Creating Index
-- ==========================================

EXPLAIN ANALYZE

SELECT *

FROM Products

WHERE Description = 'ROBOT PENCIL SHARPNER';