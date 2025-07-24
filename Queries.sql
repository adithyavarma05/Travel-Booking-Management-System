-- SQL Select Queries:

USE TRAVEL_BOOKING;

# 1. Update employee ID 2's position to Supervisor #

UPDATE employee_info
SET Department='supervisor'
WHERE Employee_ID=2;

/*
2. Write a query to create new table CustomerTravelDoc with columns
Customer_ID, Full_Name and Identity_proof selected from table Customer_Info.
*/

CREATE TABLE CustomerTravelDoc AS
SELECT Customer_ID, Full_Name, Identity_proof
FROM Customer_Info;

# 3. Rename CustomerTravelDoc to Customer_documents

ALTER TABLE CustomerTravelDoc
RENAME TO Customer_documents;

# 4. Add check constraint such that email of customers should end with @gmail.com

ALTER TABLE Customer_Info
ADD CONSTRAINT ck_email
CHECK (Email LIKE '%@gmail.com');

# 5. Set default value of booking status to pending

ALTER TABLE Booking
MODIFY COLUMN Booking_status VARCHAR(20) NOT NULL DEFAULT 'Pending';

/*
6. Add booking with following details: Booking_ID: 11, Customer_ID: 7, Payment_ID: 111,
Booking_time: 11th March 2024 1am, Transport: AI103, Origin: Hyderabad, Destination:Chennai
*/

INSERT INTO Payment (Payment_ID, Payment_Method, Payment_Amount, Payment_Date, Customer_ID)
VALUES (111, 'Debit Card', 3000.00, NULL , 7);

INSERT INTO Booking
(Booking_ID, Customer_ID, Payment_ID, Booking_time, Transport, Origin, Destination)
VALUES 
(11, 7, 111, '2024-03-11 01:00:00', 'AI103', 'Delhi', 'Chennai');

/*
7. Update the payment amounts for customers who have made payments using a
credit card by increasing their payment amount by 10%. Include only those
customers whose IDs are in the list (1, 3, 5).
*/

SET SQL_SAFE_UPDATES=0;

UPDATE Payment
SET Payment_Amount=Payment_Amount*1.1
WHERE Customer_ID IN (1,3,5) OR Payment_Method IN ('Credit Card');

# 8. Display flight details of airline that starts with an A and ends with an A

SELECT * FROM Flights
WHERE Airline LIKE 'A%A';

/* 
9. Update distance to 500 where distance <500 and display destinations in india with
distance between 500 and 1500.
*/ 

UPDATE Destination
SET Distance=500
WHERE Distance<500;

SELECT * FROM Destination
WHERE Distance BETWEEN 500 AND 1500;

# 10. Display each destination country.

SELECT DISTINCT country FROM Destination;

# 11. Describe structure of booking table.

DESC Booking;

/*
 12. Find out details of those bookings for which origin of one booking is same as
destination of another booking.
*/

SELECT 
    b1.Booking_ID AS Booking_ID1,
    b1.Customer_ID AS Customer_ID1,
    b1.Booking_status AS Booking_Status1,
    b2.Booking_ID AS Booking_ID2,
    b2.Customer_ID AS Customer_ID2,
    b2.Booking_status AS Booking_Status2 
FROM Booking b1, Booking b2 
WHERE b1.Origin = b2.Destination;
    
# 13. Display details of various modes of transport available to go to Delhi.

SELECT DISTINCT 
    d.Destination_Name, 
    t.Train_Name AS Train, 
    f.Flight_Number AS Flight, 
    b.Bus_Number AS Bus
FROM Destination AS d
LEFT JOIN Trains AS t ON d.DestinationID = t.DestinationID
LEFT JOIN Flights AS f ON d.DestinationID = f.DestinationID
LEFT JOIN Buses AS b ON d.DestinationID = b.DestinationID
WHERE d.Destination_Name = 'Delhi';

# 14. Display booking and customer details of customers who paid via credit card.

SELECT 
    B.Booking_ID, B.Customer_ID, B.Booking_status, B.Payment_ID,
    B.Booking_time, B.Transport, B.Origin, B.Destination, 
    C.Full_Name, C.Email, C.Phone, C.Identity_proof 
FROM Booking AS B 
JOIN Customer_Info AS C ON B.Customer_ID = C.Customer_ID 
JOIN Payment AS P ON B.Payment_ID = P.Payment_ID 
WHERE P.Payment_Method = 'Credit Card';

/*    
15. Display payment and customer details in order of most expensive trip booked to
cheapest trip.
*/

SELECT 
    C.Customer_ID, 
    C.Full_Name, 
    C.Email, 
    C.Phone, 
    C.Identity_proof,
    P.Payment_Amount 
FROM Payment AS P 
JOIN Customer_Info AS C ON P.Customer_ID = C.Customer_ID 
ORDER BY P.Payment_Amount DESC;

# 16. How many flights fly in and out of Mumbai?

SELECT COUNT(*) AS Total_Mumbai_flights 
FROM Flights 
WHERE FL_Origin = 'Mumbai' OR FL_Destination = 'Mumbai';

# 17. Retrieve maximum and minimum salary of employee for each department.

SELECT 
    Department, 
    MAX(Emp_salary) AS Max_EmpSalary, 
    MIN(Emp_salary) AS Min_EmpSalary 
FROM Employee_Info
GROUP BY Department;
    
# 18. Which mode of transport is most frequently used for bookings?

SELECT Transport, COUNT(*) AS Booking_Count 
FROM Booking
GROUP BY Transport 
ORDER BY COUNT(*) DESC 
LIMIT 1;

/*
19. Delete booking where transport is a Train_Name and then display booking table
starting with null values.
*/
DELETE FROM Booking
WHERE Transport IN (SELECT Train_Name FROM Trains);

# 20. Create a view showing the number of bookings made for each destination.

CREATE VIEW DestinationS_Booked AS
SELECT Destination,COUNT(*) AS BookingCount
FROM Booking
GROUP BY Destination;





