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