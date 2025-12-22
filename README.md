# Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview
This project is a simplified **Vehicle Rental System** designed to demonstrate core concepts of relational database design and SQL querying.  
The system manages **users**, **vehicles**, and **bookings**, and reflects real-world rental business logic.

This assignment focuses on:
- ERD (Entity Relationship Diagram) design
- Primary and Foreign Key relationships
- Writing SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING


## 🧱 Database Schema Overview

### 1️⃣ Users Table
Stores all system users.

**Fields:**
- `user_id` – Primary Key
- `name` – User full name
- `email` – Unique email address
- `password` – Login password
- `phone` – Contact number
- `role` – User role (Admin / Customer)

---

### 2️⃣ Vehicles Table
Stores all rentable vehicles.

**Fields:**
- `vehicle_id` – Primary Key
- `name` – Vehicle name
- `type` – car / bike / truck
- `model` – Manufacturing year or model
- `registration_number` – Unique registration number
- `rental_price` – Price per day
- `status` – available / rented / maintenance

---

### 3️⃣ Bookings Table
Stores rental booking information.

**Fields:**
- `booking_id` – Primary Key
- `user_id` – Foreign Key (Users)
- `vehicle_id` – Foreign Key (Vehicles)
- `start_date` – Rental start date
- `end_date` – Rental end date
- `status` – Booking status
- `total_cost` – Total rental cost

## Relationships
- One User can make **multiple Bookings** (One-to-Many)
- One Vehicle can have **multiple Bookings** (One-to-Many)
- Each Booking is associated with **exactly one User and one Vehicle**

Primary Keys and Foreign Keys are used to maintain referential integrity.

## 🗺️ ERD (Entity Relationship Diagram)
The ERD clearly shows:
- Primary Keys (PK)
- Foreign Keys (FK)
- Relationship cardinality
- Status fields for business logic

**ERD Link:** https://drawsql.app/teams/mosiur-hub/diagrams/vehicle-rental-system   

---

## Technologies Used
- **Database:** PostgreSQL
- **Database Tool:** Beekeeper Studio
- **ERD Tool:** DrawSQL
- **Language:** SQL


## 📂 queries.sql – Query Explanations

All required queries are written and solved in the `queries.sql` file.  
Below is the explanation of each query.

---

### 🔹 Query 1: Retrieve Booking Details (JOIN)
To display booking information along with customer name and vehicle name.
**Concepts Used:**  
- INNER JOIN
- Multiple table relationships
**Explanation:**  
This query joins the `bookings`, `users`, and `vehicles` tables to show:
- Booking ID
- Customer name
- Vehicle name
- Rental dates
- Booking status

---

### 🔹 Query 2: Find Vehicles That Have Never Been Booked 
To identify vehicles that are currently unused.
**Concepts Used:**  
- NOT EXISTS
- Subquery
**Explanation:**  
The query checks vehicles for which no matching record exists in the `bookings` table.  
This helps the business identify vehicles that are not generating revenue.

---

### 🔹 Query 3: Retrieve Available Vehicles by Type
To find all available vehicles of a specific type (e.g., cars).
**Concepts Used:**  
- WHERE clause
**Explanation:**  
The query filters vehicles based on:
- `status = 'available'`
- `type = 'car'`

---

### 🔹 Query 4: Vehicles With More Than Two Bookings 
To find high-demand vehicles.
**Concepts Used:**  
- GROUP BY
- HAVING clause
- COUNT()
**Explanation:**  
The query groups bookings by vehicle and counts how many times each vehicle was booked.  
Only vehicles with more than two bookings are displayed.