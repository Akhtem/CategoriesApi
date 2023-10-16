
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    BuyerEmail NVARCHAR(255)
);

INSERT INTO Sales (SaleID, SaleDate, BuyerEmail)
VALUES
    (1, '2023-10-01', 'buyer1@example.com'),
    (2, '2023-10-02', 'buyer2@example.com'),
    (3, '2023-10-02', 'buyer3@example.com'),
    (4, '2023-10-03', 'buyer1@example.com'),
    (5, '2023-10-03', 'buyer2@example.com'),
    (6, '2023-10-04', 'buyer3@example.com'),
    (7, '2023-10-04', 'buyer1@example.com'),
    (8, '2023-10-05', 'buyer2@example.com'),
    (9, '2023-10-05', 'buyer3@example.com'),
    (10, '2023-10-06', 'buyer1@example.com');

CREATE TABLE SalesDetails (
    SaleID INT,
    ProductID INT,
    ProductName NVARCHAR(255),
    ProductQuantity INT,
    ProductPrice DECIMAL(10, 2)
);

INSERT INTO SalesDetails (SaleID, ProductID, ProductName, ProductQuantity, ProductPrice)
VALUES
    (1, 101, 'Product A', 5, 10.99),
    (1, 102, 'Product B', 2, 7.99),
    (2, 101, 'Product A', 3, 10.99),
    (3, 103, 'Product C', 4, 5.99),
    (4, 102, 'Product B', 6, 7.99),
    (5, 101, 'Product A', 8, 10.99),
    (6, 103, 'Product C', 3, 5.99),
    (7, 102, 'Product B', 4, 7.99),
    (8, 101, 'Product A', 2, 10.99),
    (9, 102, 'Product B', 3, 7.99),
    (10, 101, 'Product A', 6, 10.99)


SELECT 
    BuyerEmail,
    AVG(DailyTotalPayment) AS AverageDailyTotalPayment
FROM (
    SELECT 
        s.BuyerEmail,
        CAST(s.SaleDate AS DATE) AS SaleDay, 
        SUM(sd.ProductQuantity * sd.ProductPrice) AS DailyTotalPayment
    FROM Sales s
    JOIN SalesDetails sd ON s.SaleID = sd.SaleID
    GROUP BY s.BuyerEmail, CAST(s.SaleDate AS DATE) 
) Subquery
GROUP BY BuyerEmail
HAVING AVG(DailyTotalPayment) > 1000;