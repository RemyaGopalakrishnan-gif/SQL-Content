 -- trigger is a database object that automatically executes a block of SQL 
 -- code in response to certain events on a table or view — like INSERT, UPDATE, or DELETE.


CREATE TABLE items (
    id INT PRIMARY KEY, -- clustered index
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO items(id, name, price) 
VALUES (1, 'Item', 50.00);

use javafs;
select * from items;
-- update some data in this table
-- that information should save to another table
-- we have to create another table




UPDATE ITEMS SET NAME='Laptop' WHERE ID=1;
select * from item_changes;

CREATE TABLE item_changes (
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    change_type VARCHAR(10),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(id)
);



DELIMITER //

CREATE TRIGGER update_items_trigger
AFTER UPDATE
ON items
FOR EACH ROW
BEGIN
    INSERT INTO item_changes (item_id, change_type)
    VALUES (NEW.id, 'UPDATE');
END;
//

UPDATE ITEMS SET NAME='Laptop' WHERE ID=1;

SELECT * FROM items;
SELECT * FROM item_changes;

-- BEFORE INSERT, BEFORE UPDATE, BEFORE DELETE.
-- AFTER INSERT, AFTER UPDATE, AFTER DELETE).


