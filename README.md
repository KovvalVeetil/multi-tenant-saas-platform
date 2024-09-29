# Multi Tenant Saas Platform

This is a multi-tenant legal SaaS platform built with Ruby on Rails, designed for law firms to manage law frim, clients, legal cases, documents, and billing. It allows users to create and manage legal cases, associate documents with cases, and track invoices and payments.

### Technologies Used
 - Ruby on Rails 7
 - PostgreSQL
 - RSpec for testing
 - FactoryBot for test data generation


Key functionalities include:

Each law firm operates as an isolated tenant, managing its own set of users, clients, and cases.
Data Isolation between tenants is crucial to ensure that law firms can only access their own data.
Documents related to cases (like legal files or contracts) are uploaded and stored securely.
Billing systems ensure law firms can generate invoices for their services.

Relationship Diagram
To better understand the relationships, here’s how the entities would relate in a conceptual ER (Entity-Relationship) diagram:

``bash
 - LawFirm → has many → Users
 - LawFirm → has many → Clients
 - Client → has many → Cases
 - Case → has many → Documents
 - User ↔ Case (Many-to-Many relationship: Users can work on multiple cases, and cases can have multiple users assigned).
 - LawFirm → has many → Bills
 - Client → has many → Bills
``
### Data Isolation in Multi-Tenancy
Row-level tenancy: Each table has a tenant_id column to isolate data at the row level. For example, every row in the users, clients, and cases tables would have a tenant_id that corresponds to the law_firm_id.
Schema-level tenancy: Alternatively, you could assign each tenant (law firm) its own database schema to ensure stronger isolation but with more complexity in terms of deployment and maintenance.

### Scaling Considerations
Database Partitioning: As the system grows, it’s important to partition databases based on tenants. Large law firms could have their own dedicated database to avoid overwhelming the main database.
Caching: Use Redis to cache frequently accessed data, like lists of clients or cases.
Rate Limiting: Protect against abusive traffic (like bots) by setting rate limits for API calls, especially for case searches or document uploads.

### Security and Data Integrity
Encryption: All sensitive data (e.g., client details, case information) must be encrypted both at rest and in transit.
Authentication & Authorization: Use JWT tokens for authenticating API requests and implement role-based access control (RBAC) to ensure users have appropriate access to client data.

### Usage
```bash
rails console

#  Create a law firm and legal case
law_firm = LawFirm.create(name: "Legal Firm A", address: "123 Main St.")
legal_case = LegalCase.create(case_number: "CASE001", status: "open", law_firm: law_firm)

# Add a document to the case
document = Document.create(title: "Contract", file_path: "/docs/contract.pdf", legal_case: legal_case)

# Create an invoice and payment
invoice = Invoice.create(total_amount: 2000.0, status: "unpaid", legal_case: legal_case)
payment = Payment.create(amount: 500.0, payment_date: Date.today, invoice: invoice)

```
