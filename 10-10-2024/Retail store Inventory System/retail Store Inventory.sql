create database RetailInv;
Use RetailInv;

create table Products(
product_id int primary key,
product_name varchar(100),
price decimal(10,2)
);

create table Suppliers(
supplier_id int primary key,
supplier_name varchar(100)
);

create table SupplyOrders(
order_id int primary key,
product_id int,
supplier_id int,
quantity int,
foreign key(product_id) references products(product_id),
foreign key(supplier_id) references Suppliers(supplier_id)
);

insert into Products (product_id, product_name, price) values
(1, 'Keyboard', 1200.00), 
(2, 'Mouse', 750.00),
(3, 'HDD', 4000.00),
(4, 'PenDrive', 500.00);

insert into Suppliers (supplier_id, supplier_name) values
(1,'Sree Lakshmi Supplies.co'),
(2,'Digital Gadget.ltd');

insert into SupplyOrders (order_id, product_id, supplier_id, quantity) values
(121, 1, 2, 50),
(131, 2, 1,40),
(141, 3, 2, 20),
(212, 4, 1, 100);

select Products.product_name, Suppliers.supplier_name
from SupplyOrders
inner join Products on SupplyOrders.product_id = Products.product_id
inner join Suppliers on SupplyOrders.supplier_id = Suppliers.supplier_id;

select Products.product_name, Suppliers.supplier_name
from Products
left join SupplyOrders on Products.product_id = SupplyOrders.product_id
left join Suppliers on SupplyOrders.supplier_id = Suppliers.supplier_id;

select Suppliers.supplier_name, SUM(SupplyOrders.quantity) as total_quantity
from SupplyOrders
inner join Suppliers on SupplyOrders.supplier_id = Suppliers.supplier_id
group by Suppliers.supplier_name;
