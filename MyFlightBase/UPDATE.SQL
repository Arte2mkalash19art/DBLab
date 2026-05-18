USE MyFlightBase;
GO

UPDATE PLANE_TYPE 
SET Capacity = 300 
WHERE ModelName = N'Літак-10';

UPDATE FLIGHT 
SET DistanceKm = DistanceKm * 1.05 
WHERE DistanceKm > 1200;

UPDATE COUNTRY 
SET RequiresCustoms = 1 
WHERE CountryName = N'Країна 15';

PRINT 'Данні успішно оновлені!';
GO