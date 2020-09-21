select a.FirstName ,d.Bedroom, d.Bathroom, e.Number,e.Street,
 e.Region,e.PostCode, f.Amount , g.Code , e.City, 
 i.Description,i.Date
 from Person as a join  owners b on a.Id = b.Id 
join ownerProperty as c  on b.Id = c.OwnerId 
join Property d on c.PropertyId = d.Id and d.Name like '%Property A'
join Address e on e.AddressId = d.AddressId
join PropertyRentalPayment f on f.PropertyId = d.Id 
join TenantPaymentFrequencies g on g.Id= f.FrequencyType
left join PropertyExpense i on i.PropertyId = d.Id

