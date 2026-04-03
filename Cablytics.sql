CREATE DATABASE ridepulse;
USE ridepulse;


CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    pickup_datetime DATETIME,
    pickup_location VARCHAR(50),
    drop_location VARCHAR(50),
    fare_amount DECIMAL(10,2),
    distance DECIMAL(5,2),
    duration INT
);

INSERT INTO rides VALUES
(1, '2024-01-01 08:30:00', 'Downtown', 'Airport', 250.00, 10.5, 25),
(2, '2024-01-01 09:00:00', 'Mall', 'Station', 120.00, 5.0, 15),
(3, '2024-01-01 18:45:00', 'Office', 'Home', 200.00, 8.0, 20),
(4, '2024-01-02 20:00:00', 'Airport', 'Hotel', 300.00, 12.0, 30),
(5, '2024-01-02 22:15:00', 'Downtown', 'Mall', 150.00, 6.0, 18),
(6, '2024-01-03 07:45:00', 'Home', 'Office', 180.00, 7.5, 22),
(7, '2024-01-03 19:30:00', 'Mall', 'Home', 160.00, 6.5, 19),
(8, '2024-01-04 23:00:00', 'Station', 'Downtown', 220.00, 9.0, 24);

SELECT * FROM rides;

-- Hour-wise Ride Analysis
SELECT HOUR(pickup_datetime) AS hour, COUNT(*) AS total_rides
FROM rides
GROUP BY hour
ORDER BY total_rides DESC;

-- Pickup Location Analysis
SELECT pickup_location, COUNT(*) AS total_rides
FROM rides
GROUP BY pickup_location
ORDER BY total_rides DESC;

-- Drop Location Analysis
SELECT drop_location, COUNT(*) AS total_rides
FROM rides
GROUP BY drop_location
ORDER BY total_rides DESC;

-- Average Fare
SELECT AVG(fare_amount) AS avg_fare FROM rides;

-- Highest and Lowest Fare
SELECT MAX(fare_amount) AS highest_fare,
       MIN(fare_amount) AS lowest_fare
FROM rides;

-- Distance vs Fare
SELECT distance, AVG(fare_amount) AS avg_fare
FROM rides
GROUP BY distance
ORDER BY distance;

-- Day-wise Analysis
SELECT DAYNAME(pickup_datetime) AS day, COUNT(*) AS rides
FROM rides
GROUP BY day;

-- Total Revenue
SELECT SUM(fare_amount) AS total_revenue FROM rides;