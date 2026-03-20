# Part 1 — RDBMS Normalization

## 1.1 — Anomaly Analysis

### Insert Anomaly

Example rows:
Row 1: (ORD1132, Amit Verma, P007, Pen Set)
Row 2: (ORD1185, Amit Verma, P008, Webcam)

Problem:
A new product (e.g., P009) cannot be added unless an order exists. Product data is tied to orders, preventing independent insertion.

---

### Update Anomaly

Example rows:
Row 1: (C001, Amit Verma, amit@email.com, Mumbai)
Row 6: (C001, Amit Verma, amit@email.com, Mumbai)

Problem:
Customer data is repeated across multiple rows. If Amit Verma changes email, all rows must be updated. Missing one leads to inconsistency.

---

### Delete Anomaly

Example row:
Row: (ORD1143, P004, Notebook)

Problem:
If the only order containing product P004 (Notebook) is deleted, all product information is lost.

---

## 1.2 — Normalization Justification

The dataset stores customer, product, order, and sales representative data in a single table, leading to redundancy and anomalies. Customer details such as name, email, and city are repeated across multiple rows. For example, Amit Verma appears in several records, meaning any update to his information must be applied consistently across all rows, increasing the risk of inconsistency.

Similarly, product information such as product name and price is duplicated. This creates insert anomalies, where new products cannot be added without an associated order, and delete anomalies, where removing an order may also remove the only record of a product.

By normalizing into separate tables—Customers, Products, Orders, Sales Representatives, and Order_Items—each entity is stored only once. Relationships are maintained using foreign keys, eliminating redundancy and ensuring consistency.

Thus, normalization is essential for maintaining data integrity, reducing duplication, and improving scalability, rather than being unnecessary complexity.