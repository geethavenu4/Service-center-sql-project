create database service_center;
use service_center;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);
CREATE TABLE technicians (
    technician_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    skill_level VARCHAR(20)
);
CREATE TABLE service_requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    request_date DATE,
    device_type VARCHAR(50),
    issue_type VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE service_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    request_id INT,
    technician_id INT,
    assigned_date DATE,
    completed_date DATE,
    FOREIGN KEY (request_id) REFERENCES service_requests(request_id),
    FOREIGN KEY (technician_id) REFERENCES technicians(technician_id)
);
CREATE TABLE service_billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    request_id INT,
    service_cost DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (request_id) REFERENCES service_requests(request_id)
);
INSERT INTO customers (name, phone, city)
VALUES
(' Kumar', '7890676543', 'Hyderabad'),
('Ravi Kumar', '9876543210', 'Hyderabad'),
('Sita Reddy', '9123456780', 'Warangal'),
('Anil Sharma', '9988776655', 'Bangalore'),
('Meena Rao', '9012345678', 'Chennai'),
('Vikram Singh', '9090909090', 'Delhi'),
('Kiran Patel', '9345678123', 'Ahmedabad'),
('Lakshmi Devi', '8899776655', 'Vijayawada'),
('Suresh Naidu', '9567891234', 'Nellore'),
('Pooja Verma', '9786543211', 'Pune'),
('Rahul Das', '9654321876', 'Kolkata');
INSERT INTO technicians (name, skill_level)
VALUES
('Anil', 'Expert'),
('Kiran', 'Intermediate'),
('Suresh', 'Beginner'),
('Ramesh', 'Expert'),
('Vijay', 'Intermediate'),
('Arun', 'Beginner'),
('Prakash', 'Expert'),
('Naveen', 'Intermediate');
INSERT INTO service_requests (customer_id, request_date, device_type, issue_type, status)
VALUES
(1, '2025-01-10', 'Mobile', 'Screen', 'Completed'),
(2, '2025-01-12', 'Laptop', 'Battery', 'In Progress'),
(3, '2025-01-13', 'TV', 'Display', 'Open'),
(1, '2025-01-15', 'Mobile', 'Battery', 'Completed'),
(4, '2025-01-16', 'AC', 'Cooling Issue', 'Open'),
(5, '2025-01-17', 'Washing Machine', 'Motor', 'In Progress'),
(6, '2025-01-18', 'Laptop', 'Keyboard', 'Completed'),
(2, '2025-01-19', 'Mobile', 'Speaker', 'Completed'),
(7, '2025-01-20', 'Refrigerator', 'Cooling Issue', 'Open'),
(8, '2025-01-21', 'TV', 'Sound Issue', 'In Progress'),
(9, '2025-01-22', 'Mobile', 'Charging Port', 'Completed'),
(10,'2025-01-23', 'Laptop', 'Motherboard', 'Open');
INSERT INTO service_assignments (request_id, technician_id, assigned_date, completed_date)
VALUES
(1, 2, '2025-01-11', '2025-01-12'),
(2, 3, '2025-01-13', NULL),
(3, 1, '2025-01-14', NULL),
(4, 2, '2025-01-15', '2025-01-16'),
(5, 4, '2025-01-16', NULL),
(6, 5, '2025-01-17', NULL),
(7, 1, '2025-01-18', '2025-01-19'),
(8, 2, '2025-01-19', '2025-01-20'),
(9, 6, '2025-01-20', NULL),
(10,7, '2025-01-21', NULL),
(11,3, '2025-01-22', '2025-01-23'),
(12,8, '2025-01-23', NULL);
INSERT INTO service_billing (request_id, service_cost, payment_status)
VALUES
(1, 1500.00, 'Paid'),
(2, 2000.00, 'Pending'),
(3, 3500.00, 'Pending'),
(4, 1200.00, 'Paid'),
(5, 4500.00, 'Pending'),
(6, 3000.00, 'Pending'),
(7, 1800.00, 'Paid'),
(8, 1600.00, 'Paid'),
(9, 5000.00, 'Pending'),
(10,2800.00, 'Pending'),
(11,2200.00, 'Paid'),
(12,4000.00, 'Pending');
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM technicians;
SELECT COUNT(*) FROM service_requests;
SELECT COUNT(*) FROM service_assignments;
SELECT COUNT(*) FROM service_billing;
-- A.JOINING QUERIES ..CUSTOMER,THEIR REQUESTS
SELECT customers.name, service_requests.device_type, service_requests.status
FROM customers
JOIN service_requests
ON customers.customer_id = service_requests.customer_id;
-- B.JOIN REQUESTS, TECHNICIAN
SELECT r.request_id, t.name AS technician, r.status
FROM service_requests r
JOIN service_assignments a ON r.request_id = a.request_id
JOIN technicians t ON a.technician_id = t.technician_id;
SELECT customer_id, COUNT(*) AS total_requests
FROM service_requests
GROUP BY customer_id
HAVING COUNT(*) > 1;
SELECT technician_id, COUNT(*) AS jobs
FROM service_assignments
GROUP BY technician_id
ORDER BY jobs DESC
LIMIT 1;
SELECT r.customer_id, b.service_cost
FROM service_billing b
JOIN service_requests r ON b.request_id = r.request_id
WHERE b.payment_status = 'Pending';
-- String function example
SELECT UPPER(name) AS customer_name, city
FROM customers;
SELECT CONCAT(name, ' - ', city) AS customer_details
FROM customers;
SELECT device_type, SUBSTRING(device_type, 1, 3) AS short_device
FROM service_requests;
-- Customers who raised more than one request (subquery)
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM service_requests
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);
