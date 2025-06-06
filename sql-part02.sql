USE ORG;
CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    pincode VARCHAR(10),
    gender ENUM('Male', 'Female', 'Other'),
    city VARCHAR(100)
);
INSERT INTO customer (id, name, address, pincode, gender, city) VALUES
(1, 'Rahul Sharma', '123 MG Road', NULL, 'Male', 'Pune'),
(2, 'Priya Mehta', '56 Banjara Hills', 801105, 'Female', 'Hyderabad'),
(3, 'Ankit Verma', '78 Park Street', 412105, 'Male', 'Kolkata'),
(4, 'Sneha Patil', '21 FC Road', 561291, 'Female', 'Pune'),
(5, 'Vikram Das', '12 Civil Lines', 489121, 'Male', 'Delhi'),
(6, 'Ayesha Khan', '88 Residency Road', NULL, 'Female', 'Bangalore'),
(7, 'Rohan Gupta', '34 Sector 15', NULL, 'Male', 'Faridabad'),
(8, 'Neha Joshi', '5 Marine Drive', 987654, 'Female', 'Mumbai'),
(9, 'Siddharth Rao', '9 Jubilee Hills', 437582, 'Male', 'Hyderabad'),
(10, 'Divya Nair', '67 Church Street', 365729, 'Female', 'Bangalore');

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    delivery_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE
);
INSERT INTO orders (order_id, delivery_date, customer_id) VALUES
(1, '2025-04-10', 1),
(2, '2025-04-12', 3),
(3, '2025-04-14', 2),
(4, '2025-04-15', 5),
(5, '2025-04-16', 4),
(6, '2025-04-18', 6),
(7, '2025-04-20', 7),
(8, '2025-04-21', 9),
(9, '2025-04-22', 8),
(10, '2025-04-23', 10);

-- ADDING NEW COLUMN
ALTER  TABLE customer ADD AGE INT NOT NULL;
SELECT *  FROM customer;

-- DESCRIPTION OF TABLE
DESC CUSTOMER;

-- RENAME THE COLUMN
ALTER  TABLE customer CHANGE COLUMN AGE UMAR INT NOT NULL ;

-- DROPPING THE COLUMN
ALTER  TABLE customer DROP COLUMN  UMAR;

-- RENAME THE TABLE
ALTER  TABLE customer RENAME TO GRAHAKH;
SELECT *  FROM GRAHAKH;

-- INSERTING THE PARTICULAR VALUES 
INSERT INTO GRAHAKH(ID,GENDER)
VALUES(234,'Male');

-- UPDATE
UPDATE GRAHAKH SET pincode=872710,NAME='AYUSH RAJ',CITY='PATNA' WHERE ID=3;

-- DELETE
DELETE FROM CUSTOMER WHERE ID=2;


-- DELETE OPERATION CUSTOMER ME HI CHAL RHA HAI KYUKI CUSTOMER TABLE INDEPENDANT HAI AND DELETE OPERATION GRAHAKH ME NHI CHAL RHA HAI KYUKI GRAHAKH TABLE LINKED HAI ORDER TABLE KE SATH 
-- AGAR GRAHAKH TABLE ME KUCH DELETE YA INSERT HUU TOH INCONSISTANCE AA JAYEGI KYUKI ORDER TABLE ME NA HI KUCH ADD HUAA AUR NA HI KUCH DELETE HUAA.

-- ON DELETE CASCADE
DELETE FROM CUSTOMER WHERE ID=2;
SELECT *  FROM orders ;
