const fs = require("fs");
const csv = require("csv-parser");
const pool = require("../config/db");
async function importCSV(filePath) {
    const rows = [];

    return new Promise((resolve, reject) => {
        fs.createReadStream(filePath)
            .pipe(csv())
            .on("data", (row) => {
                rows.push(row);
            })
            .on("end", async () => {
                                try {
                    for (const row of rows) {
                        await pool.query(
                            `INSERT INTO Retail_Raw_Data
                            (Invoice, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
                            VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`,
                            [
                                row.Invoice,
                                row.StockCode,
                                row.Description,
                                parseInt(row.Quantity),
                                row.InvoiceDate,
                                parseFloat(row.UnitPrice),
                                row["Customer ID"] || null,
                                row.Country
                            ]
                        );
                    }

                    console.log(`Imported ${rows.length} rows from ${filePath}`);
                    resolve();

                } catch (err) {
                    reject(err);
                }
                            })
            .on("error", (err) => {
                reject(err);
            });
    });
}
                (async () => {
    try {
        await importCSV("./data/Retail_2009_2010.csv");
        await importCSV("./data/Retail_2010_2011.csv");

        console.log("🎉 All data imported successfully!");

    } catch (err) {
        console.error("Import failed:");
        console.error(err);

    } finally {
        await pool.end();
    }
})();