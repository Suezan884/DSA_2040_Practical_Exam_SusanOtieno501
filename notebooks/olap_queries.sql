#Roll-up: Total sales by country and quarter
SELECT c.Location AS Country, t.Quarter, SUM(f.SalesAmount) AS TotalSales
FROM SalesFact f
JOIN CustomerDim c ON f.CustomerKey = c.CustomerKey
JOIN TimeDim t ON f.TimeKey = t.TimeKey
GROUP BY c.Location, t.Quarter
ORDER BY c.Location, t.Quarter;

# Drill-down: Sales by month for United Kingdom
SELECT t.Year, t.Month, SUM(f.SalesAmount) AS TotalSales
FROM SalesFact f
JOIN CustomerDim c ON f.CustomerKey = c.CustomerKey
JOIN TimeDim t ON f.TimeKey = t.TimeKey
WHERE c.Location = 'United Kingdom'
GROUP BY t.Year, t.Month
ORDER BY t.Year, t.Month;

# Slice: Total sales for Electronics category
SELECT SUM(f.SalesAmount) AS TotalSales
FROM SalesFact f
JOIN ProductDim p ON f.ProductKey = p.ProductKey
WHERE p.Category = 'Electronics';
