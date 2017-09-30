use AdventureWorks2012;

/*a.	Show First name and last name of employees whose job title is “Sales Representative”, 
ranking from oldest to youngest. You may use HumanResources.Employee table and Person.Person table. (14 rows)*/
select p.FirstName, p.LastName
from AdventureWorks2012.HumanResources.Employee as e
join AdventureWorks2012.Person.Person as p
on e.BusinessEntityID = p.BusinessEntityID
where e.JobTitle = 'Sales Representative'
order by e.BirthDate ASC




/*b.	
1. Find out all the products which sold more than $5000 in total.*/
select ProductID,  sum (LineTotal) as ProductSalesTotal
from AdventureWorks2012.Sales.SalesOrderDetail 
group by ProductID
having sum (LineTotal) > 5000 
order by ProductSalesTotal

/*b.	
2. Show product ID and name and total amount collected after selling the products. 
You may use LineTotal from Sales.SalesOrderDetail table and Production.Product table. (254 rows)*/
select s.ProductID, p.Name, sum (s.LineTotal) as TotalSales
from AdventureWorks2012.Sales.SalesOrderDetail as s
join AdventureWorks2012.Production.Product as p
on s.ProductID = p.ProductID
group by s.ProductID, p.Name
having sum (s.LineTotal) > 5000 
order by TotalSales

/*c.	Show BusinessEntityID, territory name and SalesYTD of all sales persons whose SalesYTD is greater than $500,000, 
regardless of whether they are assigned a territory. 
You may use Sales.SalesPerson table and Sales.SalesTerritory table. (16 rows)*/
select p.BusinessEntityID, t.Name, p.SalesYTD
from AdventureWorks2012.Sales.SalesPerson as p
left join AdventureWorks2012.Sales.SalesTerritory as t
on p.TerritoryID = t.TerritoryID
where p.SalesYTD > 500000 
order by p.SalesYTD ASC




/*d.	Show the sales order ID of those orders in the year 2008 of which the total due 
is great than the average total due of all the orders of the same year. (3200 rows)*/

Select SalesOrderId, TotalDue
TotalDue
from AdventureWorks2012.Sales.SalesOrderHeader 
where OrderDate between '2008-01-01' and '2008-12-31'
and TotalDue >
(select AVG (TotalDue) 
from AdventureWorks2012.Sales.SalesOrderHeader
where OrderDate between '2008-01-01' and '2008-12-31') 
ORDER BY TotalDue
