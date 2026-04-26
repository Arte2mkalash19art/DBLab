USE MyFlightBase;
GO

-- 1. Наполняем COUNTRY
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO COUNTRY (CountryName, RequiresCustoms, IsInUNList)
    VALUES (N'Країна ' + CAST(@i AS NVARCHAR(10)), @i % 2, 1);
    SET @i = @i + 1;
END;
PRINT 'Countries added';

-- 2. Наполняем CITY
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO CITY (CountryID, CityName)
    VALUES (@i, N'Місто ' + CAST(@i AS NVARCHAR(10)));
    SET @i = @i + 1;
END;
PRINT 'Cities added';

-- 3. Наполняем PLANE_TYPE
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO PLANE_TYPE (ModelName, Capacity)
    VALUES (N'Літак-' + CAST(@i AS NVARCHAR(10)), 100 + @i);
    SET @i = @i + 1;
END;
PRINT 'Planes added';

-- 4. Наполняем FLIGHT
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO FLIGHT (FlightNumber, DepartureCityID, ArrivalCityID, PlaneTypeID, DepartureDateTime, DistanceKm)
    VALUES (
        'FL' + CAST(@i AS VARCHAR(5)), 
        @i, 
        CASE WHEN @i = 100 THEN 1 ELSE @i + 1 END, 
        @i, 
        DATEADD(DAY, @i, GETDATE()), 
        500 + (@i * 5)
    );
    SET @i = @i + 1;
END;
PRINT 'Flights added';
GO