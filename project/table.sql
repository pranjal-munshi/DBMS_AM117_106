show databases;
use blinkit_warehouse;

-- Create User table
CREATE TABLE User(
    user_id VARCHAR(5),
    user_name VARCHAR(25),
    user_address VARCHAR(30),
    contact_number VARCHAR(15),
    password VARCHAR(225),
    PRIMARY KEY(user_id)
);

-- Create Warehouse table
CREATE TABLE Warehouse(
    warehouse_id VARCHAR(5),
    warehouse_name VARCHAR(25) UNIQUE NOT NULL,
    location VARCHAR(15),
    PRIMARY KEY(warehouse_id)
);

-- Create Product table
CREATE TABLE Product(
    product_id VARCHAR(5),
    product_name VARCHAR(20) UNIQUE NOT NULL,
    product_quality INT,
    storage_location VARCHAR(25),
    product_price INT,
    PRIMARY KEY(product_id)
);

-- Create Inventory table
CREATE TABLE Inventory(
    inventory_id VARCHAR(5),
    expiry_date DATE,
    current_stock INT,
    product_id VARCHAR(5),
    warehouse_id VARCHAR(5),
    PRIMARY KEY(inventory_id),
    FOREIGN KEY(product_id) REFERENCES Product(product_id),
    FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- Create Cart table
CREATE TABLE Cart(
    cart_id VARCHAR(5),
    bill DECIMAL,
    user_id VARCHAR(5),
    PRIMARY KEY(cart_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id)
);

-- Create Order table
CREATE TABLE `Order`(
    order_id VARCHAR(5),
    product_id VARCHAR(5),
    cart_id VARCHAR(5),
    order_quantity INT,
    product_price INT,
    PRIMARY KEY(order_id),
    FOREIGN KEY(product_id) REFERENCES Product(product_id),
    FOREIGN KEY(cart_id) REFERENCES Cart(cart_id)
);
