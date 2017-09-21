select JobTitle, count(BusinessEntityID) as Number_of_Employees
From humanresources.Employee
where CurrentFlag = 1
group by JobTitle
order by COUNT(BusinessEntityID) desc;

select JobTitle, count(BusinessEntityID) as Number_of_Employees
From humanresources.Employee
where CurrentFlag = 1
group by JobTitle
having count(BusinessEntityID) > 1
order by COUNT(BusinessEntityID) desc;

/*Example of Having*/
/* List number of orders, total sales amount of every day and every territory before 2007. Only list those where total sales amount exceeds 5000.*/
SELECT TerritoryID, 
	   OrderDate,
	   Count(SalesOrderID) AS Number_of_Orders,
	   SUM(TotalDue) AS Total_Amount
FROM Sales.SalesOrderHeader
WHERE OrderDate < '2007-01-01'
GROUP BY TerritoryID, OrderDate
HAVING SUM(TotalDue) > 5000
ORDER BY SUM(TotalDue) DESC

/***For each product, show its ProductID and Name 
(from the ProductionProduct table) and the location of its inventory 
(from the Product.Location table) and amount of inventory held 
at that location (from the Production.ProductInventory table). ***/

SELECT *

	  from [AdventureWorks2012].[Production].[ProductInventory]

SELECT 
      p.[ProductID]
	  ,p.[Name] as Product_Name
	  ,l.[LocationID]
	  ,l.[Name] as Location_Name
	  ,i.[Quantity]
  FROM [AdventureWorks2012].[Production].[Product] AS p  
   JOIN [AdventureWorks2012].[Production].[ProductInventory] AS i
  on p.[ProductID]=i.[ProductID]
     JOIN [AdventureWorks2012].[Production].[Location] AS l
  on l.[LocationID]=i.[LocationID]


  select
  p.[ProductID] 
 , p.[ProductModelID]
 FROM [AdventureWorks2012].[Production].[Product] p  
	right OUTER JOIN
	[AdventureWorks2012].[Production].[ProductModel] m
	on   p. [ProductModelID]= m. [ProductModelID]
	where p.[ProductID] is null