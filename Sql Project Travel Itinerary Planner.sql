-- *********************************PROJECT NAME:- TRAVEL ITINERARY PLANNER************************************

CREATE DATABASE PROJECT_TIP; -- We created a database named 'PROJECT_TIP' to store tables and their data in it.

USE PROJECT_TIP; -- To do entries in database.

-- Create a table of Trip and add columns as tripid,tripname,destination,startdate,enddate.
CREATE TABLE Trip (TripID int primary key auto_increment,
				   TripName varchar(255),
                   Destination varchar(255),
                   StartDate date,
                   EndDate date);
    
DESC Trip; -- To display the structure of table.
    
 -- Create a table of DailyItinerary and add columns as Itineraryid,tripid,date,activity,location
CREATE TABLE DailyItinerary(ItineraryID int primary key auto_increment,
							TripID int,
                            Date1 date,
                            Activity varchar(255),
                            Location varchar(255),
                            foreign key (TripID) references Trip(TripID));
                            
DESC DailyItinerary; -- To display the structure of table.


-- Create a table of Accomodation and add columns as accomoid,tripid,date,location,hotelname,contact.
CREATE TABLE Accomodation(AccomoID int primary key auto_increment,
						  TripID int,
                          Date2 date,
                          Location varchar(255),
                          HotelName varchar(255),
                          Contact_No bigint,
                          foreign key (TripID) references Trip(TripID));
                     
DESC Accomodation; -- To display the structure of table.                     
                     
-- Create a table of Transportation and add columns as tranportid,tripid,date,mode of transport,departure,arrival.
CREATE TABLE Transportation(TransportID int primary key auto_increment,
							TripId int,
                            Date3 date,
                            ModeOfTransport varchar(255),
                            Departure varchar(255),
                            Arrival varchar(255),
                            foreign key (TripID) references Trip(TripID));
                            
DESC Transportation; -- To display the structure of table.      

-- Inserting values in Table Trip:-
INSERT INTO Trip VALUES(101,'Char Dham Yatra','Haridwar,Gangotri,Yamunotri,Badrinath,Kedarnath','2023-01-15','2023-01-30'),
					   (102,'Ladakh Tour','Leh,Nubra,Pangong','2023-09-20','2023-09-26'),
					   (103,'Kerala Tour','Bengaluru,Coorg,Wayanad','2024-01-05','2024-01-10'),
                       (104,'Kashmir Tour','Srinagar,Gulmarg,Pahalgam','2024-04-13','2024-04-18'),
                       (105,'Rajasthan Tour','Jaipur,Jodhpur,Udaipur,Pushkar','2024-12-05','2024-12-15');

-- To display the created table with records
SELECT * FROM Trip;

-- Inserting values in Table Trip:-
INSERT INTO DailyItinerary VALUES(1,101,'2023-01-15','Sight seeing','Haridwar'),                       
								 (2,101,'2023-01-17','Temple visiting, Water Falls','Gangotri'),
                                 (3,101,'2023-01-18','Temple visting','Yamunotri'), 
                                 (4,101,'2023-01-20','Trekking,Sight seeing,Temple visiting','Kedarnath'),
                                 (5,102,'2023-09-27','Biking,Trekking','Leh'),
                                 (6,102,'2023-09-28','Mountain views','Nubra'),
                                 (7,102,'2023-09-29','Camp tent,Bonfire','Pangong'),
                                 (8,103,'2024-01-06','Meadow views','Bengaluru'),
                                 (9,103,'2024-01-07','Spices Extraction Point','Coorg'),
                                 (10,103,'2024-01-08','Water Fall','Wayanad');
                                 
-- To display the created table with records
SELECT * FROM DailyItinerary;

-- Inserting values in Table Trip:-
INSERT INTO Accomodation VALUES(111,101,'2023-01-15','Haridwar','The Royal Palace',8899007788),
							   (222,101,'2023-01-17','Gangotri','Rupa Home Stay',7766553388),
							   (333,101,'2023-01-18','Yamunotri','Grand Hotels',6655778844), 
							   (444,101,'2023-01-20','Kedarnath','Dharmashala',9988776655),
							   (555,102,'2023-09-27','Leh','Bootcamp Tents',8877665544),
							   (666,102,'2023-09-28','Nubra','Galaxy Hotels',9955443366),
							   (777,102,'2023-09-29','Pangong','Campaign Home stay',7766443322),
							   (888,103,'2024-01-06','Bengaluru','Navratna Palace',8855443322),
							   (999,103,'2024-01-07','Coorg','Sadguru Dharmashala',7766993355),
							   (100,103,'2024-01-08','Wayanad','Pind Da Home Stay',9933442255);

-- To display the created table with records
SELECT * FROM Accomodation;

-- Inserting values in Table Trip:-
INSERT INTO Transportation VALUES(001,101,'2023-01-15','Car','Haridwar','Gangotri'),
							     (002,101,'2023-01-17','Horse Ride','Gangotri','Yamunotri'),
								 (003,101,'2023-01-18','Local Bus','Yamunotri','Kedarnath'), 
								 (004,101,'2023-01-20','Car','Kedarnath','Haridwar'),
								 (005,102,'2023-09-27','Bike Ride','Leh','Nubra'),
								 (006,102,'2023-09-28','Car','Nubra','Pangong'),
								 (007,102,'2023-09-29','Local Bus','Pangong','Leh'),
								 (008,103,'2024-01-06','Train','Bengaluru','Coorg'),
								 (009,103,'2024-01-07','AC Bus','Coorg','Wayanad'),
								 (010,103,'2024-01-08','Train','Wayanad','Bengaluru');
                                 
-- To display the created table with records
SELECT * FROM Transportation;
 
-- **********************************************QUERIES********************************************************

-- 1. Add column 'Tariff' in to existing table 'Accomodation'.
ALTER TABLE Accomodation 
ADD COLUMN Tariff Float;

-- 2. Insert Values inside the Tariff column in the existing table 'Accomodation' where hotel name is Grand Hotels.
UPDATE Accomodation 
SET Tariff=3500 
WHERE HotelName='Grand Hotels';

-- 3.Fetch the updated record using condition.
SELECT * 
FROM Accomodation 
WHERE Tariff=3500;

-- 4.Display the total cost of accomodation in Whole trip of Char Dham Yatra. 
SELECT SUM(Tariff) AS TOTAL_COST FROM Accomodation;

-- 5.Display all the tours from Expensive to Cheapest in budget .
SELECT * 
FROM Trip
ORDER BY Budget DESC;

-- 6. Calculate the Discounted Price of Trip With 10% Off. 
SELECT TripName,Budget, Budget*0.10 AS DiscountedPrice from Trip;

-- 7.Find the total number of days in Rajasthan Tour.
SELECT SUM(datediff(EndDate,StartDate)) 
AS Total_Days 
FROM Trip
Where TripName='Rajasthan Tour'; 

-- 8.Display how many days are remaining for Kashmir Tour from today.
SELECT datediff(StartDate, CURDATE()) 
AS Remaining_Days 
FROM Trip 
WHERE TripName='Kashmir Tour';

-- 9.Display the most latest trip.
SELECT * 
FROM Trip 
ORDER BY StartDate 
ASC 
LIMIT 1;

-- 10.Display the most common mode of transport.
SELECT ModeOfTransport, 
COUNT(*) 
AS NumTrips 
FROM Transportation 
GROUP BY ModeOfTransport 
ORDER BY NumTrips 
DESC 
LIMIT 1;

-- 11.Display all trips along with their daily activities
SELECT T.TripName, D.Date1,D.Activity
FROM Trip T
JOIN DailyItinerary D 
ON T.TripID = D.TripID;

-- 12.Display a list of trips with their Transportation.
SELECT T.TripName, M.Date3,M.Departure,M.Arrival
FROM Trip T
JOIN Transportation M 
ON T.TripID = M.TripID;

-- 13.Display trips with accommodations costing more than a specified amount
SELECT T.TripName, A.Date2,A.HotelName, A.Location, A.Tariff 
FROM Trip T
LEFT OUTER JOIN Accomodation A 
ON T.TripID = A.TripID
WHERE A.Tariff > 500;

-- 14.Display a list of trips with their daily activities and transportation mode.
SELECT T.TripName, D.Date1, D.Activity, M.ModeOfTransport
FROM Trip T
JOIN DailyItinerary D 
ON T.TripID = D.TripID
LEFT JOIN Transportation M 
ON T.TripID = M.TripID 
AND D.Date1 = M.Date3;

-- 15.Display a list of trips with the most recent end date.
SELECT *
FROM Trip
WHERE EndDate = 
(SELECT Min(EndDate) 
FROM Trip);

-- 16.Calculate the total number of daily activities for each trip.
SELECT TripName, 
(SELECT COUNT(*) 
FROM DailyItinerary D 
WHERE D.TripID = T.TripID) 
AS NumActivities
FROM Trip T;

-- 17.Display trips where accommodation costs are greater than the average accommodation cost for all trips.
SELECT TripName
FROM Trip
WHERE TripID 
IN (SELECT TripID
FROM Accomodation
WHERE Tariff > 
(SELECT AVG(Tariff)
FROM Accomodation));

-- 18.Display the trip which has the most daily activities.
SELECT T.TripName, 
(SELECT COUNT(*) 
FROM DailyItinerary D 
WHERE D.TripID = T.TripID) 
AS NumActivities
FROM Trip T
ORDER BY NumActivities 
DESC
LIMIT 1;

-- 19. Display the trips with accomodation costs greater than 1000 
SELECT Destination 
FROM Trip 
WHERE TripID 
IN 
(SELECT TripID 
FROM Accomodation 
WHERE Tariff > 1000);

-- 20.Display a list of trips with their daily activities and corresponding to transportation records.
SELECT T.TripName, D.Location,D.Date1,D.Activity,M.ModeOfTransport
FROM Trip T
JOIN DailyItinerary D 
ON T.TripID = D.TripID
LEFT JOIN Transportation M 
ON T.TripID = M.TripID 
AND D.Date1 = M.Date3;


-- ************************************************#End#**************************************************************
