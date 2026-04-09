
INSERT INTO COUNTRY (CountryName) VALUES ('Ukraine');

INSERT INTO TICKET (FirstName, LastName, BasePrice)
SELECT TOP 1001 
    'Passenger', 
    'No ' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 
    100 + (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 50)
FROM sys.all_columns a CROSS JOIN sys.all_columns b;

SELECT COUNT(*) AS [Total_Tickets] FROM TICKET;