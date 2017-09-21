USE AdventureWorks2012; /*Set current database*/



/*1. Display the total amount collected from the orders for each order date. */

Select OrderDate,
Sum(TotalDue) as Total_Amt
from Sales.SalesOrderHeader
group by OrderDate

/*2. Display the total amount collected after selling the products, 774 and 777. */

Select ProductID,
Sum(LineTotal) as Total_Amt
from Sales.SalesOrderDetail
where ProductID=774 or ProductID=777
group by ProductID


/*3. Write a query to display the sales person ID of all the sales persons and the name of the territory to which they belong.*/
select p.BusinessEntityID, t.Name as TerritoryName
from AdventureWorks2012.Sales.SalesPerson as p
join AdventureWorks2012.Sales.SalesTerritory as t
on p.[TerritoryID]=t.[TerritoryId]


/*4. Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
select p.BusinessEntityID,
c.CardType
from sales.CreditCard as c join 
sales.personCreditCard as p
on p.CreditCardID = c.CreditCardID
where c.CardType = ('Vista')


/*5, Write a query to display all the country region codes along with their corresponding territory IDs*/

select CountryRegionCode,
TerritoryID
from Sales.SalesTerritory

/*6. Find out the average of the total dues of all the orders.*/
Select AVG (TotalDue) as Avg_Due
from sales.SalesOrderHeader


/*7. Write a query to report the sales order ID of those orders where the total value is greater than the average of the total value of all the orders.*/
Select SalesOrderId,
TotalDue
from sales.SalesOrderHeader
where TotalDue >
(select AVG (TotalDue) 
from sales.SalesOrderHeader
)
ORDER BY TotalDue












