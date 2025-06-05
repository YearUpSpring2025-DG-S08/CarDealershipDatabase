-- 1. Get all dealerships
select * from car_dealership.dealerships d ;

-- 2. Find all vehicles for a specific dealership
select v.VIN, v.`year`, v.make, v.model, v.`type`, v.color, v.mileage, v.price
from car_dealership.vehicles v
inner join car_dealership.inventory i on v.VIN = i.vin
where i.dealershipID = 1;

-- 3. Find a car by VIN
select v.vin, v.`year`, v.make, v.`type`, v.color, v.mileage, v.price
from car_dealership.vehicles v
where v.VIN = 102345678;

-- 4. Find the dealership where a certain car is located, by VIN
select d.name, d.address, d.phone
from car_dealership.dealerships d 
inner join car_dealership.inventory i on i.dealershipID = d.dealershipID
inner join car_dealership.vehicles v on v.VIN = i.VIN
where v.vin = 789012345;

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
select d.name, d.address, d.phone
from car_dealership.dealerships d 
inner join car_dealership.inventory i on i.dealershipID = d.dealershipID
inner join car_dealership.vehicles v on v.VIN = i.VIN
where v.`type` = 'SUV';

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT sc.salesContractID, sc.dateOfSale, sc.customerName, sc.vehicleVIN, 
sc.monthlyPayment, sc.salesTax, sc.recordingFee, sc.processingFee, sc.finance
from car_dealership.sales_contracts sc 
inner join car_dealership.dealerships d on d.dealershipID = sc.dealershipID
where sc.dateOfSale between '2020-01-01' and '2024-01-01';