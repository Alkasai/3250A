SELECT * FROM /* comment */ CustomerData;
-- comment

SELECT Name, Age FROM CustomerData;

SELECT
    cd.Name as n
FROM
    PracticeDB.CustomerData cd;

SELECT
    DISTINCT (CustomerID)
FROM
    TransactionData;

SELECT
    TransactionID,
    TransactionAmount
FROM
    TransactionData
WHERE
    TransactionAmount > 50 AND TransactionAmount <= 250;

SELECT
    TransactionID,
    TransactionAmount
FROM
    TransactionData
WHERE
    TransactionAmount BETWEEN 50 AND 250;

SELECT Name, Age FROM CustomerData WHERE City='Toronto' OR City='Victoria';

SELECT Name, Age FROM CustomerData WHERE lower(City) IN ('toronto','victoria');

SELECT Name, Age FROM CustomerData WHERE City IN ('Toronto', 'Victoria') AND Age > 20;

SELECT Name, Age FROM CustomerData WHERE (City='Toronto' OR City='Victoria') AND Age > 20;

SELECT Name, Age FROM CustomerData WHERE City LIKE 'Tor%'; --'%nto'  --'%oront%'

SELECT TransactionID, TransactionAmount FROM TransactionData WHERE TransactionAmount > 250 ORDER BY TransactionAmount DESC;

SELECT TransactionID, TransactionAmount FROM TransactionData WHERE TransactionAmount > 250 ORDER BY 2 DESC; -- 2 for second column

SELECT TransactionID, TransactionCity, TransactionAmount FROM TransactionData WHERE TransactionAmount > 250 ORDER BY 2 ASC, 3 DESC;



SELECT CustomerID, SUM(TransactionAmount) total_spend FROM TransactionData GROUP BY CustomerID;

SELECT CustomerID, SUM(TransactionAmount) total_spend, MAX(TransactionAmount) max_spend FROM TransactionData GROUP BY CustomerID;


SELECT CustomerID, SUM(TransactionAmount) total_spend, MAX(TransactionAmount) max_spend FROM TransactionData GROUP BY 1;

SELECT TransactionCity, CustomerID, SUM(TransactionAmount) as total, max(TransactionAmount) max FROM TransactionData GROUP BY 1, 2 ORDER BY 2, 1;

--------------------

SELECT * FROM CustomerData LEFT JOIN TransactionData ON CustomerData.CustomerID = TransactionData.CustomerID;

SELECT a.Name, a.City, b.TransactionCity, b.TransactionType, SUM(b.TransactionAmount)
FROM CustomerData a LEFT JOIN TransactionData b ON a.CustomerID = b.CustomerID
GROUP BY 1,2,3,4
HAVING SUM(b.TransactionAmount) >= 50;



--- In class group exercises ---

-- 1
SELECT Name, Age FROM CustomerData ORDER BY Name;

-- 2
SELECT * FROM CustomerData ORDER BY Age DESC LIMIT 3;

-- 3
SELECT Name, AccountNumber, TransactionID
FROM CustomerData
LEFT JOIN TransactionData
ON CustomerData.CustomerID = TransactionData.CustomerID;

--4
SELECT TransactionType, avg(TransactionAmount)
FROM TransactionData
GROUP BY TransactionType;

--5
SELECT TransactionType, TransactionCity, sum(TransactionAmount) total, avg(TransactionAmount) average
FROM TransactionData
GROUP BY 1,2;

--6
SELECT TransactionType, TransactionCity, MAX(TransactionAmount)
FROM TransactionData
GROUP BY 1,2;

--7
SELECT c.CustomerID, c.Name, SUM(t.TransactionAmount) amount
FROM CustomerData c
LEFT JOIN TransactionData t
ON c.CustomerID = t.CustomerID
GROUP BY 1
ORDER BY amount DESC
LIMIT 3;

--8
SELECT DISTINCT(c.CustomerID) CustomerID, c.Name
FROM CustomerData c
LEFT JOIN TransactionData t
ON c.CustomerID = t.CustomerID
WHERE t.TransactionCity = 'Toronto';

--9
SELECT TransactionID, TransactionType, TransactionAmount
FROM TransactionData
WHERE TransactionType = 'Electronics' AND TransactionAmount > 500;

--10
SELECT count(DISTINCT(c.CustomerID)) total_customers
FROM CustomerData c
LEFT JOIN TransactionData t
ON c.CustomerID = t.CustomerID
WHERE c.Age > 30 AND t.TransactionType = 'Electronics';