Retail Analytics System
Overview

The Retail Analytics System is a database-driven application developed as part of the BCS 4103 – Advanced Database Systems unit at St. Paul's University Nairobi.

The project demonstrates how PostgreSQL can be used to store, manage and analyze retail transaction data while following good database design principles. The application uses Node.js, Express.js, and PostgreSQL to provide RESTful APIs for interacting with retail data.

Objectives

The system aims to:

Store retail transaction records efficiently
Organize customer, product and invoice information
Demonstrate database normalization
Provide REST APIs for data access
Implement transaction management using PostgreSQL
Demonstrate database security best practices
Technologies Used
PostgreSQL
Node.js
Express.js
pg (PostgreSQL Driver)
Postman
Visual Studio Code
Git & GitHub

Database Structure

The project contains the following tables:

retail_raw_data
customers
products
invoices
invoiceitems
productaudit

These tables are connected using primary keys and foreign keys to reduce redundancy and maintain data integrity.

Features
Import retail transaction data
Customer management
Product management
Invoice management
Invoice item management
Product audit logging
RESTful API endpoints
PostgreSQL transaction management
Secure database connection using environment variables

Project Structure
Retail-Analytics-OCI/
│
├── config/
├── controllers/
├── data/
├── Documentation/
├── models/
├── Postman/
├── routes/
├── scripts/
├── SQL/
├── app.js
├── server.js
├── package.json
└── README.md

Installation

Clone the repository

git clone https://github.com/carolwafula4/Retail-Analytics-OCI.git

Install dependencies

npm install

Create a .env file and configure your PostgreSQL credentials.

Example:

DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=your_password
DB_NAME=RetailAnalytics

Run the application

npm start


API Testing

The API endpoints can be tested using the Postman collection included in the project.

Database Security

The project implements several PostgreSQL security practices, including:
Environment variables for database credentials
Parameterized SQL queries to prevent SQL injection
User authentication
Audit logging
Transaction management

Documentation
The project report is available in the Documentation folder and includes:

Database Design
ERD
Database Architecture
Data Flow Analysis
PostgreSQL Security Considerations
Transaction Management

Authors

Group B:
BSCNRB332125
BOBITNRB494624
BSCNRB501824
BOBITNRB616624
BSCNRB154723

Academic Information

Institution: St. Paul's University Nairobi
Unit: BCS 4103 – Advanced Database Systems