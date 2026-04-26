USE MyFlightBase;
GO

UPDATE PLANE_TYPE 
SET Capacity = 250 
WHERE ModelName = N'Літак-5';

UPDATE FLIGHT 
SET DistanceKm = DistanceKm * 1.1 
WHERE DistanceKm > 1000;

UPDATE COUNTRY 
SET IsInUNList = 1 
WHERE CountryName = N'Країна 10';

DELETE FROM FLIGHT 
WHERE DistanceKm < 100;

DELETE FROM PLANE_TYPE 
WHERE PlaneTypeID NOT IN (SELECT PlaneTypeID FROM FLIGHT);

PRINT 'Update and Delete operations completed successfully';
GO