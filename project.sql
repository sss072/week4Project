CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	email VARCHAR(40)
);

CREATE TABLE partsinventory(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(50),
	part_quantity INTEGER

);

CREATE TABLE mechanic(
	mech_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	email VARCHAR(50),
);

CREATE TABLE carinventory(
	car_id SERIAL PRIMARY KEY,
	car_model VARCHAR(15),
	car_made VARCHAR(15),
	car_year INTEGER
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
); 

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	email VARCHAR(50),
	address VARCHAR(100),
	FOREIGN KEY(service_id) REFERENCES service(service_id)
);

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_type VARCHAR(50),
	service_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY(part_id) REFERENCES partsinventory(part_id),
	FOREIGN KEY(mech_id) REFERENCES mechanic(mech_id)
);

CREATE TABLE invoice(
	sales_invoice_id SERIAL PRIMARY KEY,
	car_price NUMERIC(10,2),
	part_price NUMERIC(16,2),
	invoice_type VARCHAR(100),
	FOREIGN KEY(car_id) REFERENCES carinventory(car_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	FOREIGN KEY(part_id) REFERENCES partsinventory(part_id)

);

INSERT INTO partsinventory(
	part_id,
	part_name,
	part_quantity,
)VALUES(
	1,
	'tire',
	'40'
);

INSERT INTO mechanic(
	mech_id,
	first_name,
	email
)VALUES(
	1,
	'sami',
	'samsabeeh6@gmail.com'
);

