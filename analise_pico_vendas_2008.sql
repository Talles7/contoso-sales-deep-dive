 use ContosoRetailDW

--Qual categoria de produto tem mais vendas e faturamento po cada dia da semana, dia do mês e ano?
select
	datename(weekday, dd.Datekey) as DiaSemana,
	day( dd.Datekey) as DiaMes,
	datename(month, dd.Datekey) as Mes,
	year( dd.Datekey) as Ano,
	isnull(dpc.ProductCategoryName , 'CATEGORIA SEM NOME') as Category,
	sum(fs.SalesQuantity) as SomaSalesQuantity,
	sum(fs.SalesAmount) as SomaFaturamento
from 
	FactSales as fs  
		left join DimDate as dd on dd.Datekey = fs.DateKey
		left join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
		left join DimProductSubcategory as dps on dps.ProductSubcategoryKey = dpt.ProductSubcategoryKey
		left join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
where 
	datepart(day, dd.Datekey) = 20
	and datepart(month, dd.Datekey) = 12
	and datepart(year, dd.Datekey) = 2008 --2007 até 2009
group by  
	datename(weekday, dd.Datekey),
	day( dd.Datekey),
	datename(month, dd.Datekey),
	year( dd.Datekey),
	isnull(dpc.ProductCategoryName , 'CATEGORIA SEM NOME')
order by SomaSalesQuantity desc


/*



cat3.DiaSemana,

cat3.Category,

sum(cat3.SomaSalesQuantity) as SomaSalesQuantityfrom(

select

fs.SalesKey,

datename(weekday, fs.DateKey) as DiaSemana,

dpc.ProductCategoryName as Category,

sum(fs.SalesQuantity) as SomaSalesQuantity

from

FactSales as fs

inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey

inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey

inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey

--where month(fs.DateKey) = 1

where datepart(weekday, fs.DateKey) = 2



group by

dpc.ProductCategoryName, fs.DateKey ,fs.SalesKey

) as cat3group by

cat3.DiaSemana, cat3.Category 


------------------------------------------------------------------------------------------------

select
	
	cat3.DiaSemana,

	isnull(cat3.Category, 'SEM CATEGORIA'),
	sum(cat3.SomaSalesQuantity) as SomaSalesQuantity
from(
	select 
		datename(weekday, dd.Datekey) as DiaSemana,
		datename(month, dd.Datekey) as Mes,
		year( dd.Datekey) as Ano,
		isnull(dpc.ProductCategoryName , 'SEM CATEGORIA') as Category,
		sum(fs.SalesQuantity) as SomaSalesQuantity
	from 
		FactSales as fs  
			left join DimDate as dd on dd.Datekey = fs.DateKey
			left join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
			left join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
			left join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
	where datepart(weekday, dd.Datekey) = 
		and datepart(month, dd.Datekey) = 1
		and datepart(year, dd.Datekey) = 2007
	group by  
		dpc.ProductCategoryName, 
		datename(weekday, dd.Datekey), 
		datename(month, dd.Datekey),
		year( dd.Datekey)
	having sum(fs.SalesQuantity) > 10000
	) as cat3
group by 
	cat3.DiaSemana, cat3.Category
order by SomaSalesQuantity desc

------------------------------------------------------------------------------------------------

select 
	datename(weekday, fs.DateKey) as diaDaSemana,
	year(fs.DateKey) as dia,
	datename(month, fs.DateKey) as mes,
	year(fs.DateKey) as ano,
	dpc.ProductCategoryName as Category,
	sum(fs.SalesQuantity) as SomaSalesQuantity
from 
	FactSales as fs  
		inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
		inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
		inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
--where month(fs.DateKey) = 1
where datepart(weekday, fs.DateKey) = 2
group by  
	fs.DateKey,
	dpc.ProductCategoryName,
	fs.SalesQuantity
order by 
	fs.SalesQuantity desc

------------------------------------------------------------------------------------------------

select 

	dpc.ProductCategoryName as Category,
	sum(fs.SalesQuantity) as SomaSalesQuantity
	
from 
	FactSales as fs  
		inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
		inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
		inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
--where month(fs.DateKey) = 1
where datepart(weekday, fs.DateKey) = 2
group by  
	dpc.ProductCategoryName

order by 
	SomaSalesQuantity desc

select top 10000
	datename(weekday, fs.DateKey) as diaDaSemana,
	day(fs.DateKey) as dia,
	datename(month, fs.DateKey) as mes,
	year(fs.DateKey) as ano,
	dpt.ProductKey,
	dpt.ProductName as 'Product',
	dpc.ProductCategoryName as Category,
	sum(fs.SalesQuantity) as SomaSalesQuantity
from 
	FactSales as fs  
		inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
		inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
		inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
--where month(fs.DateKey) = 1
where month(fs.DateKey) = 1
group by  
	dpc.ProductCategoryName
order by 
	SomaSalesQuantity desc

------------------------------------------------------------------------------------------------

	where datepart(weekday, fs.DateKey) = 2
------------------------------------------------------------------------------------------------
select top 10000
	datename(weekday, fs.DateKey) as diaDaSemana,
	dps.ProductSubcategoryName as Subcategory,
	sum(fs.SalesAmount)
	
from FactSales as fs  
	inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
	inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
	inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
--where month(fs.DateKey) = 1
where month(fs.DateKey) = 1
group by  dps.ProductSubcategoryName, datename(weekday, fs.DateKey) = 'segunda')


------------------------------------------------------------------------------------------------
	
select top 10000
	datename(weekday, fs.DateKey) as diaDaSemana,
	day(fs.DateKey) as dia,
	datename(month, fs.DateKey) as mes,
	year(fs.DateKey) as ano,
	dpt.ProductKey,
	dpt.ProductName as 'Product',
	dpc.ProductCategoryName as Category,
	sum(fs.SalesAmount)
from 
	FactSales as fs  
		inner join DimProduct as dpt on dpt.ProductKey = fs.ProductKey
		inner join DimProductSubcategory as dps on dps.ProductCategoryKey = dpt.ProductSubcategoryKey
		inner join DimProductCategory as dpc on dpc.ProductCategoryKey = dps.ProductCategoryKey
--where month(fs.DateKey) = 1
where month(fs.DateKey) = 1
group by  
	fs.DateKey,
	dpt.ProductKey,
	dpt.ProductName,
	dpc.ProductCategoryName,
	fs.SalesAmount
order by 
	fs.SalesAmount desc


	datepart(weekday, fs.DateKey) as diaDaSemana, 
	month(fs.DateKey) as mes,
*/
