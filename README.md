# Retail Analytics API with PostgreSQL Optimization using Oracle Cloud Infrastructure (OCI)

## Project Overview

This project is a Retail Analytics System developed using Node.js, Express.js, PostgreSQL, and Oracle Cloud Infrastructure (OCI). It provides RESTful APIs for managing retail data and demonstrates database optimization techniques through stored procedures, triggers, and query performance analysis.

---

## Objectives

- Develop a RESTful API using Node.js and Express.js.
- Connect the application to a PostgreSQL database.
- Implement CRUD operations for retail products.
- Optimize database performance using indexes and EXPLAIN ANALYZE.
- Implement stored procedures and triggers.
- Prepare the application for deployment on Oracle Cloud Infrastructure (OCI).

---

## Technologies Used

- Node.js
- Express.js
- PostgreSQL
- pgAdmin 4
- Postman
- Oracle Cloud Infrastructure (OCI)

---

## Project Structure

```
RetailAnalytics-OCI
│
├── config
├── controllers
├── models
├── routes
├── scripts
├── SQL
│   ├── stored_procedures.sql
│   ├── triggers.sql
│   └── performance.sql
├── Postman
│   ├── RetailAnalytics_API.postman_collection.json
│   └── RetailAnalytics.postman_environment.json
├── package.json
├── server.js
└── README.md
```

---

## Database Tables

- Customers
- Products
- Invoices
- InvoiceItems
- ProductAudit

---

## API Endpoints

### Products

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /products | Retrieve all products |
| GET | /products/:stockcode | Retrieve one product |
| POST | /products | Create a product |
| PUT | /products/:stockcode | Update a product |
| DELETE | /products/:stockcode | Delete a product |

---

## Stored Procedures

- CalculateTotalSales
- GetTopCustomers
- GetMonthlySalesReport

---

## Trigger

ProductAudit Trigger automatically records:

- Product updates
- Product deletions

---

## Performance Optimization

Database optimization includes:

- Primary Key Index
- Description Index
- EXPLAIN ANALYZE
- Query performance evaluation

---

## Testing

The API was tested using Postman.

Included:

- CRUD operations
- Success scenarios
- Error scenarios
- Invalid requests

---

## Authors

Group Project

Module:
PostgreSQL Database Optimization using Oracle Cloud Infrastructure (OCI)
