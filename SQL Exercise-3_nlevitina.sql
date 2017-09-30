use AdventureWorksDW2012;


/*1, Display number of orders and total sales amount(sum of SalesAmount) of Internet Sales 
in 1st quarter each year in each country. Note: your result set should produce a total of 18 rows. */
select count (i.SalesOrderNumber) as Number_of_Orders, sum (i.SalesAmount) as Total_Sales, t.SalesTerritoryCountry, d.CalendarYear
from AdventureWorksDW2012.dbo.FactInternetSales as I
join AdventureWorksDW2012.dbo.DimSalesTerritory as T
on i.SalesTerritoryKey=t.SalesTerritoryKey
join AdventureWorksDW2012.dbo.DimDate as D
on d.DateKey=i.OrderDateKey
where d.CalendarQuarter = '1'
group by d.CalendarQuarter, d.CalendarYear, t.SalesTerritoryCountry


/*2, Show total reseller sales amount (sum of SalesAmount), 
calendar quarter of order date, product category name and reseller’s 
business type by quarter by category and by business type in 2006. 
Note: your result set should produce a total of 44 rows. */


select sum (f.SalesAmount) as Total_Sales, d.CalendarQuarter, c.EnglishProductCategoryName as Product_Category, r.BusinessType as Reseller_Business_Type
from AdventureWorksDW2012.dbo.FactResellerSales as f
join AdventureWorksDW2012.dbo.DimReseller as r
on f.ResellerKey=r.ResellerKey
join AdventureWorksDW2012.dbo.DimProduct as p
on f.ProductKey = p.ProductKey
join AdventureWorksDW2012.dbo.DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
join AdventureWorksDW2012.dbo.DimProductCategory as c
on s.ProductCategoryKey = c.ProductCategoryKey
join AdventureWorksDW2012.dbo.DimDate as d
on d.DateKey=f.OrderDateKey
where d.CalendarYear = '2006'
group by d.CalendarQuarter, c.EnglishProductCategoryName, r.BusinessType
order by d.CalendarQuarter, c.EnglishProductCategoryName, r.BusinessType

/*3, Based on 2, perform an OLAP operation: slice. 
In comment, describe how you perform the slicing, i.e. 
what do you do to what dimension(s)? Why is it a operation of slicing?*/

/*3 answer:
Slicing is selecting a part of a cube (database) using value for one of a cube's dimentions. 
In this case it should be done using the 'where clause's value, i.e. year 2006. As a result the cube still has data 
relevant to 2006 available in all the tables available.*/

/*4, Based on 2, perform an OLAP operation: drill-down. 
In comment, describe how you perform the drill-down, 
i.e. what do you do to what dimension(s)? Why is it a operation of drilling-down?*/

/*4 answer:
Drill-down is an opertion of narrowing down results going from a summary to  a more detailed view.
In this case I would drill down using the 'order by' categories: first view the data by quarter, 
then by Category or Business type (alternatively, first view by quarter, then by Business Type, then by Category).