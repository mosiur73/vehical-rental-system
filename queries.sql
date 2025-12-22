-- Vehicle Rental System - SQL Queries
-- Assignment Part 2: Based on ERD Schema


-- Users Tables
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  role VARCHAR(20) CHECK (role IN ('Admin', 'Customer')) NOT NULL
);


--  Vehicles Tables
CREATE TABLE vehicles (
  vehicle_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(20) CHECK (type IN ('car', 'bike', 'truck')) NOT NULL,
  model VARCHAR(50),
  registration_number VARCHAR(50) NOT NULL UNIQUE,
  rental_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) CHECK (status IN ('available', 'rented', 'maintenance')) NOT NULL
);


-- Bookings Tables
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')) NOT NULL,
  total_cost DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);



--Insert data Users table
INSERT INTO users (name, email, password, phone, role) VALUES
('Alice Khan', 'alice@example.com', 'pass123', '01711111111', 'Customer'),
('Bob Rahman', 'bob@example.com', 'pass123', '01722222222', 'Admin'),
('Charlie Ahmed', 'charlie@example.com', 'pass123', '01733333333', 'Customer'),
('David Islam', 'david@example.com', 'pass123', '01744444444', 'Customer'),
('Eva Noor', 'eva@example.com', 'pass123', '01755555555', 'Customer'),
('Farhan Ali', 'farhan@example.com', 'pass123', '01766666666', 'Admin'),
('Gina Sultana', 'gina@example.com', 'pass123', '01777777777', 'Customer'),
('Hasan Mahmud', 'hasan@example.com', 'pass123', '01788888888', 'Customer'),
('Irfan Hossain', 'irfan@example.com', 'pass123', '01799999999', 'Customer'),
('Jannat Akter', 'jannat@example.com', 'pass123', '01800000000', 'Customer');


--Insert data Vehicles table
INSERT INTO vehicles (name, type, model, registration_number, rental_price, status) VALUES
('Toyota Corolla', 'car', '2022', 'CAR-101', 50.00, 'available'),
('Honda Civic', 'car', '2021', 'CAR-102', 60.00, 'rented'),
('Nissan Sunny', 'car', '2020', 'CAR-103', 45.00, 'available'),
('Yamaha R15', 'bike', '2023', 'BIKE-201', 30.00, 'available'),
('Honda CBR', 'bike', '2022', 'BIKE-202', 35.00, 'rented'),
('Suzuki Gixxer', 'bike', '2021', 'BIKE-203', 28.00, 'available'),
('Ford F-150', 'truck', '2020', 'TRUCK-301', 100.00, 'maintenance'),
('Isuzu D-Max', 'truck', '2021', 'TRUCK-302', 95.00, 'available'),
('Tata Ace', 'truck', '2019', 'TRUCK-303', 80.00, 'available'),
('Hyundai Elantra', 'car', '2023', 'CAR-104', 65.00, 'available');


--Insert data Bookings table
INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, status, total_cost) VALUES
(1, 2, '2023-10-01', '2023-10-05', 'completed', 240.00),
(1, 2, '2023-11-01', '2023-11-03', 'completed', 120.00),
(3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60.00),
(4, 1, '2023-12-10', '2023-12-12', 'pending', 100.00),
(5, 4, '2023-12-05', '2023-12-06', 'completed', 30.00),
(6, 5, '2023-12-07', '2023-12-09', 'completed', 70.00),
(7, 10, '2023-12-08', '2023-12-10', 'confirmed', 130.00),
(8, 3, '2023-12-11', '2023-12-13', 'completed', 90.00),
(9, 1, '2023-12-15', '2023-12-16', 'pending', 50.00),
(10, 6, '2023-12-18', '2023-12-20', 'completed', 84.00);



--Query 1:Retrieve booking info with customer and vehicle name
SELECT b.booking_id, u.name as customer_name, v.name as vehicle_name,b.start_date,b.end_date,b.status
FROM bookings b
INNER JOIN users u ON b.user_id=u.user_id
INNER JOIN vehicles v ON b.vehicle_id=v.vehicle_id;



-- Query 2: Find vehicles that have never been booked
SELECT v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status
FROM vehicles v
WHERE NOT EXISTS (SELECT * FROM bookings b WHERE b.vehicle_id=v.vehicle_id);


-- Query 3: Retrieve all available vehicles of type 'car'
SELECT v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status
FROM vehicles v
WHERE status='available' AND TYPE='car';


-- Query 4: Vehicles with more than 2 bookings
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM bookings b
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;






