-- TASK 1

create database courier_management_system;
use courier_management_system;
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);
INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Mathi', 'mathi@example.com', 'password123', '123-456-7890', 'Madurai, Tamil Nadu, India'),
(2, 'Ram', 'ram@example.com', 'abc@123', '987-654-3210', 'Tiruchirappalli, Tamil Nadu, India'),
(3, 'Ravi', 'ravi@example.com', 'securepwd', '555-123-4567', 'Salem, Tamil Nadu, India'),
(4, 'Anu', 'anu@example.com', 'p@ssw0rd', '111-222-3333', 'Coimbatore, Tamil Nadu, India'),
(5, 'John Paul', 'johnpaul@example.com', 'qwerty', '444-555-6666', 'Chennai, Tamil Nadu, India'),
(6, 'Hema', 'hema@example.com', 'password321', '777-888-9999', 'Salem, Tamil Nadu, India'),
(7, 'Arun', 'arun@example.com', 'letmein', '222-333-4444','Tiruchirappalli, Tamil Nadu, India'),
(8, 'John', 'john@example.com', 'd@vidb', '999-888-7777', 'Madurai, Tamil Nadu, India'),
(9, 'Priya', 'priya@example.com', 'emma123', '666-777-8888',  'Coimbatore, Tamil Nadu, India'),
(10, 'Mohan', 'mohan@example.com', 'pass123', '333-444-5555', 'Chennai, Tamil Nadu, India');


CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);
alter table Courier add EmployeeID int;
alter table Courier add foreign key(EmployeeID) references Employee(EmployeeID);

INSERT INTO Courier VALUES 
(101, 'John Paul', 'Chennai, Tamil Nadu, India', 'Harini', '456 Elm St, Coimbatore, India', 2.5, 'In Transit', 'TRK123456', '2024-04-13', 51),
(102, 'Mathi', 'Madurai, Tamil Nadu, India', 'Joel', '321 Pine St,Chennai, India', 1.8, 'Delivered', 'TRK789012', '2024-04-10', 53),
(103, 'Ram', 'Tiruchirappalli, Tamil Nadu, India', 'Michael ', '456 Elm St, Madurai, India', 3.1, 'Pending', 'TRK345678', '2024-04-12', 51),
(104, 'Hema', 'Salem, Tamil Nadu, India', 'David', '852 Walnut St,Madurai, India', 4.2, 'In Transit', 'TRK901234', '2024-04-15', 60),
(105, 'Anu', 'Coimbatore, Tamil Nadu, India', 'Sophia', '147 Sycamore St, Salem, India', 2.7, 'Pending', 'TRK567890', '2024-04-09', 56),
(106, 'Mohan', 'Chennai, Tamil Nadu, India', 'Rahul', '321 Pine St, Madurai, India', 1.8, 'Delivered', 'TRK789013', '2024-04-10', 57),
(107, 'Ravi', 'Salem, Tamil Nadu, India', 'Meena', '456 Elm St,  Chennai, India', 2.5, 'In Transit', 'TRK123457', '2024-04-13', 51),
(108, 'Arun', 'Tiruchirappalli, Tamil Nadu, India', 'Ram', '321 Pine St, Madurai, India', 1.8, 'Delivered', 'TRK789072', '2024-04-10', 52),
(109, 'John', 'Madurai, Tamil Nadu, India', 'Raju ', '654 Birch St, Coimbatore, India', 3.1, 'Pending', 'TRK345679', '2024-04-12', 58),
(110, 'Priya', 'Coimbatore, Tamil Nadu, India', 'Krishna', '852 Walnut St,Chennai, India', 4.2, 'In Transit', 'TRK901204', '2024-04-15', 57),
(111, 'Mathi', 'Madurai, Tamil Nadu, India', 'Balaji', '852 Walnut St, Coimbatore, India', 4.2, 'In Transit', 'TRK901934', '2024-04-15', 53),
(112, 'John', 'Madurai, Tamil Nadu, India', 'Kumar', '654 Birch St, Salem, India', 3.1, 'Pending', 'TRK345778', '2024-04-12', 55);


CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);
drop table CourierServices;
ALTER TABLE CourierServices
ADD CourierID INT;

ALTER TABLE CourierServices 
ADD FOREIGN KEY (CourierID) REFERENCES Courier(CourierID);

INSERT INTO CourierServices(CourierID,ServiceID,ServiceName,Cost) VALUES
(101,11, 'Standard Delivery', 75.50),
(102,12, 'Express Delivery', 100.00),
(103,13, 'Same Day Delivery', 70.00),
(104,14, 'Overnight Delivery', 50.25),
(105,15, 'Economy Delivery', 90.00),
(102,16, 'Express Delivery', 150.00),
(103,17, 'Same Day Delivery', 40.00),
(101,18, 'Standard Delivery', 65.50),
(102,19, 'Express Delivery', 230.00),
(103,20, 'Same Day Delivery', 80.00);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(51, 'Aryan', 'aryan@example.com', '+919876543210', 'Delivery Agent', 35000.00),
(52, 'Sita', 'sita@example.com', '+919876543211', 'Sales Head', 50000.00),
(53, 'Vivek', 'vivek@example.com', '+919876543212', 'Delivery Agent', 35000.00),
(54, 'john', 'john@example.com', '+919876543213', 'HR', 60000.00),
(55, 'Karan', 'karan@example.com', '+919876543214', 'Manager', 48000.00),
(56, 'Pooja', 'Pooja@example.com', '+919876543215', 'Delivery Agent', 35000.00),
(57, 'Rohan', 'Rohan@example.com', '+919876543216', 'Marketing Analyst', 52000.00),
(58, 'Anjali', 'anjali@example.com', '+919876543217', 'IT Specialist', 53000.00),
(59, 'Sameer', 'sameer@example.com', '+919876543218', 'Supervisor', 56000.00),
(60, 'Jaya', 'jaya@example.com', '+919876543219', 'Delivery Agent', 35000.00);


CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);
INSERT INTO Location (LocationID, LocationName, Address) VALUES
(111, 'Chennai', 'Chennai, Tamil Nadu, India'),
(222, 'Coimbatore', 'Coimbatore, Tamil Nadu, India'),
(333, 'Madurai', 'Madurai, Tamil Nadu, India'),
(444, 'Tiruchirappalli', 'Tiruchirappalli, Tamil Nadu, India'),
(555, 'Salem', 'Salem, Tamil Nadu, India');

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);
drop table Payment;
INSERT INTO Payment VALUES
(210, 101, 111, 75.50, '2024-04-12'),
(211, 102, 222, 100.00, '2024-04-09'),
(213, 103, 333, 50.25, '2024-04-11'),
(214, 104, 444, 120.75, '2024-04-14'),
(215, 105, 555, 90.00, '2024-04-07'),
(216, 106, 222, 75.50, '2024-04-12'),
(217, 107, 111, 100.00, '2024-04-08'),
(218, 108, 333, 50.25, '2024-04-12'),
(219, 109, 555, 120.75, '2024-04-09'),
(220, 110, 444, 90.00, '2024-04-10'),
(221, 111, 222, 90.00, '2024-04-13'),
(222, 112, 111, 90.00, '2024-04-10');
show tables;

-- Task 2: Select Queries

-- 1. List all customers:
SELECT * FROM User;

-- 2. List all orders for a specific customer:
SELECT * FROM courier WHERE sendername='mathi';

-- 3. List all couriers:
SELECT * FROM Courier;

-- 4. List all packages for a specific order:
SELECT *
FROM Courier
WHERE CourierID = '101';

-- 5. List all deliveries for a specific courier:
SELECT * FROM Courier WHERE CourierID = '105';

-- 6. List all undelivered packages:
SELECT * FROM courier WHERE Status = 'Delivered';

-- 7. List all packages that are scheduled for delivery today:
SELECT * FROM courier WHERE DeliveryDate = CURDATE();

-- 8. List all packages with a specific status:
SELECT * FROM courier WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier:
SELECT c.CourierID, COUNT(*) AS TotalPackages FROM Courier c GROUP BY c.CourierID;

-- 10. Find the average delivery time for each courier:
SELECT c.CourierID, AVG(DATEDIFF(CURRENT_DATE(), DeliveryDate)) AS AvgDeliveryTime FROM Courier c GROUP BY c.CourierID;

-- 11. List all packages with a specific weight range:
SELECT * FROM Courier WHERE Weight BETWEEN 1.0 AND 2.0;

-- 12. Retrieve employees whose names contain 'John':
SELECT * FROM Employee WHERE Name LIKE '%John%';
Select * from employee;

-- 13. Retrieve all courier records with payments greater than $50:
SELECT c.* FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID WHERE p.Amount > 50;


-- Task 3: GroupBy, Aggregate Functions, Having, Order By, Where

-- 14. Find the total number of couriers handled by each employee.
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersHandled FROM Employee e LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID GROUP BY e.EmployeeID, e.Name;

-- 15. Calculate the total revenue generated by each location.
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue FROM Location l LEFT JOIN Payment p ON l.LocationID = p.LocationID GROUP BY l.LocationID, l.LocationName;

-- 16. Find the total number of couriers delivered to each location.
SELECT l.LocationID, l.LocationName, COUNT(DISTINCT c.CourierID) AS TotalCouriersDelivered FROM Location l LEFT JOIN Courier c ON l.LocationName = c.SenderAddress OR l.LocationName = c.ReceiverAddress GROUP BY l.LocationID, l.LocationName;

-- 17. Find the courier with the highest average delivery time:
SELECT c.CourierID, AVG(DATEDIFF(CURRENT_DATE(), c.DeliveryDate)) AS AvgDeliveryTime FROM Courier c GROUP BY c.CourierID ORDER BY AvgDeliveryTime DESC LIMIT 1;

-- 18. Find Locations with Total Payments Less Than a Certain Amount
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING TotalPayment < 150;

-- 19. Calculate Total Payments per Location
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.LocationID = 111
GROUP BY c.CourierID
HAVING SUM(p.Amount) > 1000;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.PaymentDate > '2024-04-15'
GROUP BY c.CourierID
HAVING SUM(p.Amount) > 1000;

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.PaymentDate > '2024-04-30'
GROUP BY l.LocationID, l.LocationName
HAVING TotalPayment > 50;

-- Task 4: Joins

-- 23. Retrieve Payments with Courier Information
SELECT p.*, c.* FROM Payment p JOIN Courier c ON p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information
SELECT p.*, l.* FROM Payment p JOIN Location l ON p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information
SELECT p.*, c.*, l.* FROM Payment p JOIN Courier c ON p.CourierID = c.CourierID JOIN Location l ON p.LocationID = l.LocationID;

-- 26. List all payments with courier details
SELECT p.*, c.* FROM Payment p LEFT JOIN Courier c ON p.CourierID = c.CourierID;

-- 27. Total payments received for each courier
SELECT c.CourierID, SUM(p.Amount) AS TotalPayment FROM Courier c LEFT JOIN Payment p ON c.CourierID = p.CourierID GROUP BY c.CourierID;

-- 28. List payments made on a specific date
SELECT * FROM Payment WHERE PaymentDate = '2024-04-14';

-- 29. Get Courier Information for Each Payment
SELECT p.*, c.* FROM Payment p JOIN Courier c ON p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location
SELECT p.*, l.* FROM Payment p JOIN Location l ON p.LocationID = l.LocationID;

-- 31. Calculating Total Payments for Each Courier
SELECT c.CourierID, SUM(p.Amount) AS TotalPayment FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID GROUP BY c.CourierID;

-- 32. List Payments Within a Date Range
SELECT * FROM Payment WHERE PaymentDate BETWEEN '2024-04-13' AND '2024-04-27';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
SELECT u.*, c.* FROM User u LEFT JOIN Courier c ON u.Name = c.SenderName OR u.Name = c.ReceiverName;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT c.*, cs.* FROM Courier c LEFT JOIN CourierServices cs ON c.CourierID = cs.CourierID;


-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT e.*, p.* FROM Employee e LEFT JOIN Payment p ON e.EmployeeID = p.EmployeeID;

-- 36. List all users and all courier services, showing all possible combinations
SELECT u.*, cs.* FROM User u CROSS JOIN CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations
SELECT e.*, l.* FROM Employee e CROSS JOIN Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)
SELECT c.*, u.* FROM Courier c LEFT JOIN User u ON c.SenderName = u.Name;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available)
SELECT c.*, u.* FROM Courier c LEFT JOIN User u ON c.ReceiverName = u.Name;

-- 40. Retrieve a list of couriers along with the courier service details (if available)
SELECT c.*, cs.* FROM Courier c LEFT JOIN CourierServices cs ON c.CourierID = cs.CourierID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersAssigned FROM Employee e LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID GROUP BY e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment FROM Location l LEFT JOIN Payment p ON l.LocationID = p.LocationID GROUP BY l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName)
SELECT c1.*, c2.* FROM Courier c1 JOIN Courier c2 ON c1.SenderName = c2.SenderName AND c1.CourierID <> c2.CourierID;

-- 44. List all employees who share the same role
SELECT e1.*, e2.* FROM Employee e1 JOIN Employee e2 ON e1.Role = e2.Role AND e1.EmployeeID <> e2.EmployeeID;

-- 45. Retrieve all payments made for couriers sent from the same location
SELECT p1.*, p2.* FROM Payment p1 JOIN Payment p2 ON p1.LocationID = p2.LocationID AND p1.CourierID <> p2.CourierID;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress)
SELECT c1.*, c2.* FROM Courier c1 JOIN Courier c2 ON c1.SenderAddress = c2.SenderAddress AND c1.CourierID <> c2.CourierID;

-- 47. List employees and the number of couriers they have delivered
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersDelivered FROM Employee e LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID AND c.Status = 'Delivered' GROUP BY e.EmployeeID, e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT c.*, p.* FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID JOIN CourierServices cs ON c.CourierID = cs.CourierID WHERE p.Amount > cs.Cost;

-- 49. Find couriers that have a weight greater than the average weight of all couriers
SELECT * FROM Courier WHERE Weight > (SELECT AVG(Weight) FROM Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Cost) AS TotalCost FROM CourierServices WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

-- 52. Find all couriers that have been paid for
SELECT DISTINCT c.* FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID;

-- 53. Find the locations where the maximum payment amount was made
SELECT l.* FROM Location l JOIN Payment p ON l.LocationID = p.LocationID WHERE Amount = (SELECT MAX(Amount) FROM Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
SELECT c.*
FROM Courier c
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'Ram');
