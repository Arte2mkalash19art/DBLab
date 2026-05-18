USE MyFlightBase;
GO

SELECT Ci.CityName, Co.CountryName FROM CITY Ci JOIN COUNTRY Co ON Ci.CountryID = Co.CountryID;
SELECT F.FlightNumber, P.ModelName FROM FLIGHT F JOIN PLANE_TYPE P ON F.PlaneTypeID = P.PlaneTypeID;
SELECT F.FlightNumber, Ci.CityName, Co.CountryName FROM FLIGHT F JOIN CITY Ci ON F.DepartureCityID = Ci.CityID JOIN COUNTRY Co ON Ci.CountryID = Co.CountryID;
SELECT DepartureCityID AS ActiveCityID FROM FLIGHT
UNION
SELECT ArrivalCityID AS ActiveCityID FROM FLIGHT;
SELECT CountryName AS GeoName FROM COUNTRY
UNION
SELECT CityName AS GeoName FROM CITY;
UPDATE PLANE_TYPE SET ModelName = N'Супер-Літак-Новий' WHERE ModelName = N'Літак-2';
SELECT F.FlightNumber, P.ModelName FROM FLIGHT F JOIN PLANE_TYPE P ON F.PlaneTypeID = P.PlaneTypeID WHERE P.ModelName = N'Супер-Літак-Новий';

DELETE FROM PLANE_TYPE WHERE PlaneTypeID = 5;
SELECT * FROM FLIGHT WHERE PlaneTypeID = 5;

DELETE FROM FLIGHT WHERE DepartureCityID IN (SELECT CityID FROM CITY WHERE CountryID = 3) 
                      OR ArrivalCityID IN (SELECT CityID FROM CITY WHERE CountryID = 3);
                      
DELETE FROM COUNTRY WHERE CountryID = 3;

SELECT * FROM PLANE_TYPE ORDER BY Capacity DESC;
SELECT * FROM FLIGHT ORDER BY DistanceKm ASC;
SELECT * FROM CITY ORDER BY CityName ASC;
SELECT * FROM COUNTRY ORDER BY IsInUNList DESC, CountryName ASC;
SELECT * FROM FLIGHT ORDER BY DepartureDateTime DESC;

SELECT * FROM FLIGHT WHERE DistanceKm > 800 AND DepartureDateTime > GETDATE();
SELECT * FROM COUNTRY WHERE IsInUNList = 1 AND RequiresCustoms = 0;
SELECT * FROM PLANE_TYPE WHERE Capacity >= 120 AND Capacity <= 180;
SELECT * FROM CITY WHERE NOT (CountryID >= 1 AND CountryID <= 5);
SELECT * FROM FLIGHT WHERE DistanceKm < 500 OR PlaneTypeID = 1;

SELECT Co.CountryName, Ci.CityName FROM COUNTRY Co LEFT JOIN CITY Ci ON Co.CountryID = Ci.CountryID;
SELECT P.ModelName, F.FlightNumber FROM PLANE_TYPE P RIGHT JOIN FLIGHT F ON P.PlaneTypeID = F.PlaneTypeID;
SELECT Ci.CityName, F.FlightNumber FROM CITY Ci LEFT JOIN FLIGHT F ON Ci.CityID = F.DepartureCityID;
SELECT Co.CountryName, Ci.CityName FROM COUNTRY Co FULL JOIN CITY Ci ON Co.CountryID = Ci.CountryID;
SELECT Co.CountryName FROM COUNTRY Co LEFT JOIN CITY Ci ON Co.CountryID = Ci.CountryID WHERE Ci.CityID IS NULL;

SELECT CountryID, COUNT(*) AS TotalCities FROM CITY GROUP BY CountryID HAVING COUNT(*) > 1;
SELECT PlaneTypeID, AVG(DistanceKm) AS AvgDistance FROM FLIGHT GROUP BY PlaneTypeID HAVING AVG(DistanceKm) > 600;
SELECT DepartureCityID, MAX(DistanceKm) AS MaxDist FROM FLIGHT GROUP BY DepartureCityID HAVING MAX(DistanceKm) > 1000;
SELECT PlaneTypeID, COUNT(*) AS FlightCount FROM FLIGHT GROUP BY PlaneTypeID HAVING COUNT(*) > 2;
SELECT ArrivalCityID, SUM(DistanceKm) AS TotalKm FROM FLIGHT GROUP BY ArrivalCityID HAVING SUM(DistanceKm) > 2000;
GO