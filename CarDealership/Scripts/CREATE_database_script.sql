drop database car_dealership;

create database car_dealership;

use car_dealership;

create table vehicles(
VIN int primary key,
year int,
make varchar(50),
model varchar(50),
type varchar(12),
color varchar(20),
mileage int,
price decimal(10,2)
);

-- INSERT statements for car dealership vehicles table
insert into vehicles (VIN, year, make, model, type, color, mileage, price) values
(123456789, 2023, 'Toyota', 'Camry', 'Sedan', 'Silver', 12500, 28999.00),
(234567890, 2022, 'Honda', 'CR-V', 'SUV', 'White', 18750, 31500.00),
(345678901, 2024, 'Ford', 'F-150', 'Truck', 'Blue', 5200, 42750.50),
(456789012, 2021, 'BMW', '3 Series', 'Sedan', 'Black', 24800, 35999.00),
(567890123, 2023, 'Chevrolet', 'Equinox', 'SUV', 'Red', 8900, 29500.00),
(678901234, 2022, 'Nissan', 'Altima', 'Sedan', 'Gray', 21400, 24999.00),
(789012345, 2024, 'Jeep', 'Wrangler', 'SUV', 'Green', 24680, 24300.00),
(890123456, 2020, 'Hyundai', 'Elantra', 'Sedan', 'White', 35600, 18500.00),
(901234567, 2023, 'Ram', '1500', 'Truck', 'Black', 11200, 45999.00),
(102345678, 2022, 'Mazda', 'CX-5', 'SUV', 'Blue', 66780, 15300.00);

create table dealerships(
dealershipID int primary key auto_increment,
name varchar(50),
address varchar(50),
phone varchar(12)
);

-- INSERT statements for dealerships table
insert into dealerships (dealershipID, name, address, phone) values
(1, 'Premier Auto Sales', '123 Main Street', '555-123-4567'),
(2, 'Elite Motors', '456 Oak Avenue', '555-987-6543'),
(3, 'City Car Center', '789 Pine Road', '555-456-7890'),
(4, 'Crossroads Auto', '321 Elm Boulevard', '555-234-5678');

create table inventory(
inventoryID int primary key auto_increment,
VIN int,
dealershipID int,
foreign key (VIN) references vehicles(VIN),
foreign key (dealershipID) references dealerships(dealershipID)
);

insert into inventory (inventoryID, vin, dealershipID) values
(1, 123456789, 1),
(2, 234567890, 1),
(3, 345678901, 2), 
(4, 456789012, 2), 
(5, 567890123, 2), 
(6, 678901234, 3), 
(7, 789012345, 3), 
(8, 890123456, 4), 
(9, 901234567, 4), 
(10, 102345678, 1);

create table sales_contracts(
salesContractID int primary key auto_increment,
dealershipID int references dealerships(dealershipID),
dateOfSale date,
customerName varchar(30),
vehicleVIN int references vehicles(VIN),
monthlyPayment decimal(10,2),
salesTax decimal(10,2),
recordingFee int,
processingFee decimal(10,2),
finance bool
);

insert into sales_contracts(salesContractID, dealershipID, dateOfSale, customerName, vehicleVIN, monthlyPayment, salesTax, recordingFee, processingFee, finance) values
(2, '2025-05-06', "Kyle Munix", 567890123, 1253.75, 1475, 100, 495, true),
(3, '2023-10-03', "Monty Gregar", 789012345, 1245.25, 1465, 100, 495, true),
(1, '2019-01-02', "Heather Marlene", 102345678, 0, 765, 100, 495, false),
(4, '2024-06-12', "Lucille Webber", 456789012, 0, 1799.95, 100, 495, false);

create table lease_contracts(
leaseContractID int primary key auto_increment,
dateOfSale date,
customerName varchar(30),
vehicleVIN int references vehicles(VIN),
monthlyPayment decimal(10,2),
endingValue decimal(10,2),
leaseFee decimal(10,2)
);

insert into lease_contracts(leaseContractID, dateOfSale, customerName, vehicleVIN, monthlyPayment, endingValue, leaseFee) values
(1, '2013-04-05', "Milly Venom", 234567890, 1260, 15750, 2205),
(2, '2015-10-01', "Riley Pony", 678901234, 999.96, 12499.50, 1749.93),
(3, '2024-03-13', "Jordan Miles", 890123456, 740, 9250, 1295);