CREATE TABLE Customers (
	
    CustomerID INT PRIMARY KEY,                  -- Primary Key
    CustomerName VARCHAR(100) NOT NULL,          -- NOT NULL
    Email VARCHAR(100) UNIQUE,                   -- UNIQUE
    Country VARCHAR(50) null,                    -- NULL (default)
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Default value (optional)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                     -- Primary Key
    OrderDate DATE NOT NULL,                     -- NOT NULL
    CustomerID INT,                              -- Foreign Key
    Amount DECIMAL(10, 2) CHECK (Amount > 0),   -- CHECK constraint
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Foreign Key
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON UPDATE CASCADE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



CREATE TABLE CustomersTest (
    CustomerID INT AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    PRIMARY KEY (CustomerID)
);

INSERT INTO CUSTOMERSTest(CUSTOMERNAME) VALUES('REMYA'); 

INSERT INTO CUSTOMERSTest VALUES(NULL,'REVATURE'); 
INSERT INTO CUSTOMERSTest VALUES(DEFAULT,'TESTING'); 

SELECT * FROM CUSTOMERSTEST;

DROP TABLE CUSTOMERSTEST;
-- IT SHOWS ERROR
-- 1 2 3 4
ALTER TABLE CustomersTEST AUTO_INCREMENT = 100;
--- 100 , 102

SELECT LAST_INSERT_ID();  --- LAST ENTERED AUTO INCREMENT VALUE
SET @@auto_increment_increment = 2;




/*REFERENTIAL INTEGRITY**/

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


/*SECONDARY/ALTERNATE KEY***/
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,                  -- Primary Key
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,                  -- Secondary Key (Alternate Key)
    HireDate DATE
);