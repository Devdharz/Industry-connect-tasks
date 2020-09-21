--1.a Display a list of all property names and their property id’s for Owner Id: 1426. 

select a.Name as PropertyName , 
a.id  as PropertyId ,* from Property as a inner join 
OwnerProperty as b on a.Id = b.PropertyId 
where b.OwnerId =1426

------------------------------

--1.b Display the current home value for each property in question a). 

select PropertyId, value as PropertyValue  
from PropertyHomeValue where
PropertyId  in (select a.id from Property as a inner join 
OwnerProperty as b on  a.Id = b.PropertyId  
where b.OwnerId =1426) and IsActive = 1

----------------------------------------
--1.c 
--For each property in question a), return the following:                                                                      
--Using rental payment amount, rental payment frequency, tenant start date and
--tenant end date to write a query that returns the sum of all payments from start date to end date. 


select a.Amount , a.FrequencyType, b.Startdate, b.EndDate , 
datediff(week, b.startdate, b.endDate) *a.Amount , case when
a.FrequencyType = 1 then
datediff(week, b.startdate, b.endDate) *a.Amount
when
a.FrequencyType = 2 then
(datediff(week, b.startdate, b.endDate) *a.Amount )/2
when
a.FrequencyType = 3 then
(datediff(MONTH, b.startdate, b.endDate) *a.Amount )

End
as tot from
propertyRentalPayment as a inner join TenantProperty as b on
a.PropertyId = b.PropertyId
where a. PropertyID in (select z.id from Property as z inner join 
OwnerProperty as y on  z.Id = y.PropertyId  
where y.OwnerId =1426) 

----------------------------------------------

-- 1.c ii Display the yield.

select Yield from propertyFinance where propertyId in (5597, 5637, 5638)

--------------------------------------------

 --1.d Display all the jobs available 
 
 select c.Name, b.FirstName, b.LastName , a.PaymentAmount ,d.Code
 from TenantProperty a join person b on a.TenantId = b.id
 join property c on a.PropertyId = c.id 
 join TenantPaymentFrequencies d on a.PaymentFrequencyId = d.Id  
 where a.PropertyId in (5597, 5637, 5638)

 ----------------------------------------------
 -- 1.e 
 -- Display all property names, current tenants first and last names and rental payments 
 --per week/ fortnight/month for the properties in question a).


 select a.FirstName, c.PropertyId ,d.Bathroom, d.Bedroom, e.City, f.Amount , g.Code , i.Description, i.Date, i.Amount
 from Person as a join  owners b on a.Id = b.Id 
join ownerProperty as c  on b.Id = c.OwnerId and a.id = 1426
join Property d on c.PropertyId = d.Id 
join Address e on e.AddressId = d.AddressId
join PropertyRentalPayment f on f.PropertyId = d.Id 
join TenantPaymentFrequencies g on g.Id= f.FrequencyType
left join PropertyExpense i on i.PropertyId = d.Id

-------------------------------------------------