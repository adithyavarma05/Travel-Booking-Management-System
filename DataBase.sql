CREATE DATABASE IF NOT EXISTS TRAVEL_BOOKING;

USE TRAVEL_BOOKING;

DROP TABLE IF EXISTS Customer_Info;
CREATE TABLE Customer_Info(
    Customer_ID INT PRIMARY KEY,
    Full_Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(10),
    Identity_proof VARCHAR(100)
);

INSERT INTO Customer_info (Customer_ID, Full_Name, Email, Phone, Identity_proof)
VALUES
    (1, 'Arjun Ramesh', 'arjunramesh91@gmail.com', '9876012345', 'Aadhar'),
    (2, 'Meenakshi Pillai', 'meenapillai84@gmail.com', '8765098765', 'Passport'),
    (3, 'Karthik Subramanian', 'karthiksubra@gmail.com', '9345012456', 'Driver License'),
    (4, 'Divya Nair', 'divyanair25@gmail.com', '9632547890', 'Aadhar'),
    (5, 'Rohit Iyer', 'rohitiyer99@gmail.com', '9123456780', 'Passport'),
    (6, 'Sneha Reddy', 'snehareddy87@gmail.com', '9012876543', 'Aadhar'),
    (7, 'Vignesh Kumar', 'vigneshkumar@gmail.com', '9988776655', 'Driver License'),
    (8, 'Revathi Krishnan', 'revathik@gmail.com', '9556677889', 'Passport'),
    (9, 'Suresh Menon', 'sureshmenon@gmail.com', '9234567891', 'Aadhar'),
    (10, 'Harish Varma', 'harishvarma90@gmail.com', '8899776655', 'Driver License');


DROP TABLE IF EXISTS Employee_Info;    
CREATE TABLE Employee_Info (
    Employee_ID INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Department VARCHAR(50),
    Emp_salary INT,
    Emp_Position VARCHAR(50)
);
    
INSERT INTO Employee_Info (Employee_ID, Emp_name, Department, Emp_salary, Emp_Position)
VALUES
    (1, 'Ramesh Bandi', 'Bus', 52000, 'Driver'),
    (2, 'Sowmya Chinta', 'Car', 58000, 'Guide'),
    (3, 'Teja Gurram', 'Train', 61000, 'Supervisor'),
    (4, 'Anusha Kommu', 'Flight', 67000, 'Booking Agent'),
    (5, 'Karthik Vemula', 'Cruise', 73000, 'Guide'),
    (6, 'Harika Yerram', 'Bus', 54000, 'Driver'),
    (7, 'Vamsi Rachakonda', 'Car', 60000, 'Supervisor'),
    (8, 'Sravani Devireddy', 'Flight', 69000, 'Guide'),
    (9, 'Sai Ram Madduri', 'Train', 66000, 'Booking Agent'),
    (10, 'Keerthi Boddu', 'Cruise', 75000, 'Supervisor');

DROP TABLE IF EXISTS Destination;
CREATE TABLE Destination (
    Destination_ID INT PRIMARY KEY,
    Destination_Name VARCHAR(50),
    Distance INT,
    Country VARCHAR(50)
);
    
INSERT INTO Destination (Destination_ID, Destination_Name, Distance, Country)
VALUES
    (608, 'Dubai', 2540, 'United Arab Emirates'),
    (604, 'Pune', 560, 'India'),
    (610, 'San Francisco', 13500, 'United States'),
    (601, 'Nizamabad', 175, 'India'),
    (606, 'Bengaluru', 575, 'India'),
    (603, 'Chennai', 630, 'India'),
    (609, 'London', 7770, 'United Kingdom'),
    (602, 'Adilabad', 305, 'India'),
    (605, 'Goa', 660, 'India'),
    (607, 'Singapore', 3300, 'Singapore'),
    (611, 'Tirupati', 555, 'India'),
    (612, 'Mumbai', 710, 'India'),
    (613, 'Delhi', 1550, 'India'),
    (614, 'Kolkata', 1480, 'India'),
    (615, 'New York', 13100, 'United States'),
    (616, 'Frankfurt', 7150, 'Germany'),
    (617, 'Coimbatore', 890, 'India'),
    (618, 'Jaipur', 1330, 'India'),
    (619, 'Vijayawada', 275, 'India'),
    (620, 'Rajahmundry', 450, 'India');   
    
DROP TABLE IF EXISTS Trains;
CREATE TABLE IF NOT EXISTS Trains (
    Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(50),
    T_DepartureTime TIME,
    T_ArrivalTime TIME,
    T_Origin VARCHAR(50),
    T_Destination VARCHAR(50),
    Destination_ID INT,
    FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);
    
INSERT INTO Trains (Train_ID, Train_Name, T_DepartureTime, T_ArrivalTime, T_Origin, T_Destination, Destination_ID)
VALUES
    (1, 'Charminar Express', '18:00:00', '07:30:00', 'Hyderabad', 'Chennai', 603),
    (2, 'Hussainsagar Express', '14:30:00', '05:55:00', 'Hyderabad', 'Mumbai', 612),
    (3, 'Hyderabad Pune Express', '22:45:00', '08:05:00', 'Hyderabad', 'Pune', 604),
    (4, 'Kacheguda Bengaluru Express', '21:00:00', '07:30:00', 'Hyderabad', 'Bengaluru', 606),
    (5, 'Hyderabad Delhi Express', '16:50:00', '13:30:00', 'Hyderabad', 'Delhi', 613),
    (6, 'Simhapuri Express', '14:00:00', '22:30:00', 'Hyderabad', 'Tirupati', 611),
    (7, 'Hyderabad Jaipur Express', '15:30:00', '18:10:00', 'Hyderabad', 'Jaipur', 618),
    (8, 'Falaknuma Express', '15:55:00', '05:45:00', 'Hyderabad', 'Kolkata', 614),
    (9, 'Godavari Express', '17:15:00', '05:45:00', 'Hyderabad', 'Rajahmundry', 620),
    (10, 'Janmabhoomi Express', '07:15:00', '15:30:00', 'Hyderabad', 'Vijayawada', 619),
    (11, 'Nanded Express', '06:00:00', '10:15:00', 'Hyderabad', 'Adilabad', 602),
    (12, 'Nizamabad Passenger', '05:00:00', '08:30:00', 'Hyderabad', 'Nizamabad', 601),
    (13, 'Coimbatore Express', '19:00:00', '13:00:00', 'Hyderabad', 'Coimbatore', 617),
    (14, 'Vasco Express', '06:50:00', '05:30:00', 'Hyderabad', 'Goa', 605);
    
DROP TABLE IF EXISTS Flights;
CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY,
    Flight_Number VARCHAR(10),
    Airline VARCHAR(50),
    FL_DepartureTime DATETIME,
    FL_ArrivalTime DATETIME,
    FL_Origin VARCHAR(50),
    FL_Destination VARCHAR(50),
    Destination_ID INT,
    FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);

INSERT INTO Flights (Flight_ID, Flight_Number, Airline, FL_DepartureTime, FL_ArrivalTime, FL_Origin, FL_Destination, Destination_ID)
VALUES
    (1, '6E201', 'IndiGo',             '2024-08-01 06:00:00', '2024-08-01 07:10:00', 'Hyderabad', 'Pune',           604),
    (2, '6E350', 'IndiGo',             '2024-08-01 07:30:00', '2024-08-01 08:40:00', 'Hyderabad', 'Bengaluru',      606),
    (3, 'AI508', 'Air India',          '2024-08-01 09:15:00', '2024-08-01 10:40:00', 'Hyderabad', 'Chennai',        603),
    (4, 'SG422', 'SpiceJet',           '2024-08-01 11:00:00', '2024-08-01 12:30:00', 'Hyderabad', 'Goa',            605),
    (5, '6E707', 'IndiGo',             '2024-08-01 13:30:00', '2024-08-01 15:10:00', 'Hyderabad', 'Mumbai',         612),
    (6, 'AI775', 'Air India',          '2024-08-01 16:00:00', '2024-08-01 18:30:00', 'Hyderabad', 'Delhi',          613),
    (7, 'SG841', 'SpiceJet',           '2024-08-01 19:00:00', '2024-08-01 21:30:00', 'Hyderabad', 'Kolkata',        614),
    (8, 'AI951', 'Air India',          '2024-08-02 00:15:00', '2024-08-02 02:00:00', 'Hyderabad', 'Dubai',          608),
    (9, 'SQ523', 'Singapore Airlines', '2024-08-02 03:45:00', '2024-08-02 10:30:00', 'Hyderabad', 'Singapore',      607),
    (10,'BA276', 'British Airways',    '2024-08-02 06:15:00', '2024-08-02 12:15:00', 'Hyderabad', 'London',         609),
    (11,'UA47',  'United Airlines',    '2024-08-02 14:00:00', '2024-08-03 03:15:00', 'Hyderabad', 'New York',       615),
    (12,'LH753', 'Lufthansa',          '2024-08-02 17:00:00', '2024-08-02 22:00:00', 'Hyderabad', 'Frankfurt',      616),
    (13,'AI173', 'Air India',          '2024-08-02 22:30:00', '2024-08-03 12:00:00', 'Hyderabad', 'San Francisco',  610),
    (14,'6E409', 'IndiGo',             '2024-08-03 07:00:00', '2024-08-03 08:30:00', 'Hyderabad', 'Tirupati',       611),
    (15,'6E712', 'IndiGo',             '2024-08-03 09:20:00', '2024-08-03 10:00:00', 'Hyderabad', 'Nizamabad',      601),
    (16,'AI601', 'Air India',          '2024-08-03 11:45:00', '2024-08-03 13:00:00', 'Hyderabad', 'Adilabad',       602),
    (17,'6E545', 'IndiGo',             '2024-08-03 14:10:00', '2024-08-03 15:20:00', 'Hyderabad', 'Vijayawada',     619),
    (18,'SG651', 'SpiceJet',           '2024-08-03 16:40:00', '2024-08-03 18:00:00', 'Hyderabad', 'Rajahmundry',    620),
    (19,'6E678', 'IndiGo',             '2024-08-03 19:30:00', '2024-08-03 21:00:00', 'Hyderabad', 'Coimbatore',     617),
    (20,'AI846', 'Air India',          '2024-08-03 22:15:00', '2024-08-04 00:45:00', 'Hyderabad', 'Jaipur',         618);
    
DROP TABLE IF EXISTS Buses;
CREATE TABLE Buses (
    Bus_ID INT PRIMARY KEY,
    Bus_Number VARCHAR(10),
    Operator VARCHAR(50),
    B_DepartureTime DATETIME,
    B_ArrivalTime DATETIME,
    B_Origin VARCHAR(50),
    B_Destination VARCHAR(50),
	Destination_ID INT,
    FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);

INSERT INTO Buses (Bus_ID, Bus_Number, Operator, B_DepartureTime, B_ArrivalTime, B_Origin, B_Destination, Destination_ID)
VALUES
    (1, 'B101', 'Hyderabad Travels',        '2024-08-05 06:00:00', '2024-08-05 12:00:00', 'Hyderabad', 'Pune',           604),
    (2, 'B102', 'Andhra Roadways',          '2024-08-05 06:30:00', '2024-08-05 10:00:00', 'Hyderabad', 'Nizamabad',      601),
    (3, 'B103', 'Telangana Express',        '2024-08-05 07:00:00', '2024-08-05 11:30:00', 'Hyderabad', 'Adilabad',       602),
    (4, 'B104', 'TSRTC Volvo',              '2024-08-05 08:00:00', '2024-08-05 14:00:00', 'Hyderabad', 'Bengaluru',      606),
    (5, 'B105', 'TSRTC Semi',               '2024-08-05 09:00:00', '2024-08-05 15:30:00', 'Hyderabad', 'Chennai',        603),
    (6, 'B106', 'Hitech Travels',           '2024-08-05 10:30:00', '2024-08-05 18:00:00', 'Hyderabad', 'Goa',            605),
    (7, 'B107', 'Express Line',             '2024-08-05 12:00:00', '2024-08-05 20:00:00', 'Hyderabad', 'Rajahmundry',    620),
    (8, 'B108', 'Hyderabad – Vijayawada',   '2024-08-05 14:00:00', '2024-08-05 18:30:00', 'Hyderabad', 'Vijayawada',     619),
    (9, 'B109', 'Coastal Roadways',         '2024-08-05 15:30:00', '2024-08-06 08:00:00', 'Hyderabad', 'Mumbai',         612),
    (10,'B110', 'Northern Volvo',           '2024-08-05 18:00:00', '2024-08-06 05:00:00', 'Hyderabad', 'Jaipur',         618);
    
DROP TABLE IF EXISTS Car;
CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Car_Model VARCHAR(50),
    Plate_Number VARCHAR(20),
    Capacity INT,
    C_Origin VARCHAR(50),
    C_Destination VARCHAR(50),
	Destination_ID INT,
    FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);

INSERT INTO Car (Car_ID, Car_Model, Plate_Number, Capacity, C_Origin, C_Destination, Destination_ID)
VALUES
    (1,  'Toyota Innova',       'TS01AB1234', 7, 'Hyderabad', 'Nizamabad',    601),
    (2,  'Maruti Swift',        'TS02CD5678', 5, 'Hyderabad', 'Vijayawada',   619),
    (3,  'Honda City',          'TS03EF9012', 5, 'Hyderabad', 'Adilabad',     602),
    (4,  'Hyundai i20',         'TS04GH3456', 5, 'Hyderabad', 'Pune',         604),
    (5,  'Ford EcoSport',       'TS05IJ6789', 5, 'Hyderabad', 'Rajahmundry',  620),
    (6,  'Volkswagen Polo',     'TS06KL0123', 5, 'Hyderabad', 'Bengaluru',    606),
    (7,  'Toyota Corolla',      'TS07MN3456', 5, 'Hyderabad', 'Chennai',      603),
    (8,  'Renault Kwid',        'TS08OP6789', 5, 'Hyderabad', 'Goa',          605),
    (9,  'Honda Civic',         'TS09QR0123', 5, 'Hyderabad', 'Tirupati',     611),
    (10, 'Mahindra Scorpio',    'TS10ST3456', 7, 'Hyderabad', 'Coimbatore',   617);
    
DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(50),
    Payment_Amount DECIMAL(10, 2),
    Payment_Date DATE,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID)
);

INSERT INTO Payment (Payment_ID, Payment_Method, Payment_Amount, Payment_Date, Customer_ID)
VALUES
    (101, 'Credit Card', 5000.00, '2023-01-15', 1),
    (102, 'Debit Card', 3000.00, '2023-02-20', 2),
    (103, 'Net Banking', 2000.00, '2023-03-25', 3),
    (104, 'UPI', 4000.00, '2023-04-30', 4),
    (105, 'Cash', 2500.00, '2023-05-05', 5),
    (106, 'Credit Card', 3500.00, '2023-06-10', 6),
    (107, 'Debit Card', 2800.00, '2023-07-15', 7),
    (108, 'Net Banking', 1800.00, '2023-08-20', 8),
    (109, 'UPI', 4200.00, '2023-09-25', 9),
    (110, 'Cash', 2300.00, '2023-10-30', 10);
    
DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Customer_ID INT,
    Booking_status VARCHAR(20),
    Payment_ID INT,
    Booking_time DATETIME,
    Transport VARCHAR(50) NOT NULL,
    Origin VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);    
INSERT INTO Booking (Booking_ID, Customer_ID, Booking_status, Payment_ID, Booking_time, Transport, Origin, Destination)
VALUES
    (1, 1, 'Confirmed', 101, '2024-03-10 08:00:00', (SELECT Operator FROM Buses WHERE Destination_ID = 612), 'Hyderabad', 'Mumbai'),
    (2, 2, 'Confirmed', 102, '2024-03-10 10:00:00', (SELECT Plate_Number FROM Car WHERE Destination_ID = 619), 'Hyderabad', 'Vijayawada'),
    (3, 3, 'Confirmed', 103, '2024-03-10 12:00:00', (SELECT Flight_Number FROM Flights WHERE Destination_ID = 608), 'Hyderabad', 'Dubai'),
    (4, 4, 'Confirmed', 104, '2024-03-10 14:00:00', (SELECT Flight_Number FROM Flights WHERE Destination_ID = 609), 'Hyderabad', 'London'),
    (5, 5, 'Confirmed', 105, '2024-03-10 16:00:00', (SELECT Train_Name FROM Trains WHERE Destination_ID = 613), 'Hyderabad', 'Delhi'),
    (6, 6, 'Confirmed', 106, '2024-03-10 18:00:00', (SELECT Operator FROM Buses WHERE Destination_ID = 601), 'Hyderabad', 'Nizamabad'),
    (7, 7, 'Confirmed', 107, '2024-03-10 20:00:00', (SELECT Plate_Number FROM Car WHERE Destination_ID = 620), 'Hyderabad', 'Rajahmundry'),
    (8, 8, 'Confirmed', 108, '2024-03-10 22:00:00', (SELECT Train_Name FROM Trains WHERE Destination_ID = 606), 'Hyderabad', 'Bengaluru'),
    (9, 9, 'Confirmed', 109, '2024-03-11 01:00:00', (SELECT Flight_Number FROM Flights WHERE Destination_ID = 610), 'Hyderabad', 'San Francisco'),
    (10, 10, 'Confirmed', 110, '2024-03-11 03:00:00', (SELECT Operator FROM Buses WHERE Destination_ID = 618), 'Hyderabad', 'Jaipur');
    
    
    
    