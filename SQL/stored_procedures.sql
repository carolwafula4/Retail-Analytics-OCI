-- ==========================================
-- Procedure 1: Calculate Total Sales
-- ==========================================

CREATE OR REPLACE PROCEDURE CalculateTotalSales(
    IN start_date TIMESTAMP,
    IN end_date TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN

    DROP TABLE IF EXISTS temp_total_sales;

    CREATE TEMP TABLE temp_total_sales AS

    SELECT
        SUM(ii.Quantity * p.UnitPrice) AS total_sales
    FROM InvoiceItems ii
    JOIN Products p
        ON ii.StockCode = p.StockCode
    JOIN Invoices i
        ON ii.InvoiceID = i.InvoiceID
    WHERE i.InvoiceDate BETWEEN start_date AND end_date;

END;
$$;

-- ==========================================
-- Procedure 2: Get Top Customers
-- ==========================================

CREATE OR REPLACE PROCEDURE GetTopCustomers()
LANGUAGE plpgsql
AS $$
BEGIN

    DROP TABLE IF EXISTS temp_top_customers;

    CREATE TEMP TABLE temp_top_customers AS

    SELECT

        i.customerid,

        SUM(ii.quantity * ii.unitprice) AS total_spent

    FROM invoiceitems ii

    JOIN invoices i

    ON ii.invoiceid = i.invoiceid

    GROUP BY i.customerid

    ORDER BY total_spent DESC

    LIMIT 10;

END;
$$;


-- ==========================================
-- Procedure 3: Monthly Sales Report
-- ==========================================

CREATE OR REPLACE PROCEDURE GetMonthlySalesReport()
LANGUAGE plpgsql
AS $$
BEGIN

    DROP TABLE IF EXISTS temp_monthly_sales;

    CREATE TEMP TABLE temp_monthly_sales AS

    SELECT

        DATE_TRUNC('month', i.invoicedate) AS month,

        SUM(ii.quantity * ii.unitprice) AS total_sales

    FROM invoiceitems ii

    JOIN invoices i

    ON ii.invoiceid = i.invoiceid

    GROUP BY DATE_TRUNC('month', i.invoicedate)

    ORDER BY month;

END;
$$;