-- Vehicle Rental System - SQL Queries
-- Assignment Part 2: Based on ERD Schema


--Query 1:Retrieve booking info with customer and vehicle name
SELECT b.booking_id, u.name as customer_name, v.name as vehicle_name,b.start_date,b.end_date,b.status
FROM bookings b
INNER JOIN users u on b.user_id=u.user_id
INNER JOIN vehicles v on b.vehicle_id=v.vehicle_id;



-- Query 2: Find vehicles that have never been booked
SELECT v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status
FROM vehicles v
WHERE NOT EXISTS (SELECT * FROM bookings b where b.vehicle_id=v.vehicle_id);


-- Query 3: Retrieve all available vehicles of type 'car'
SELECT v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status
FROM vehicles v
WHERE status='available' and type='car';


-- Query 4: Vehicles with more than 2 bookings
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM bookings b
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;






