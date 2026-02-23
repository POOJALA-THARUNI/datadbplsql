create table item(
itemid int primary key,
itemname varchar(20),
price float
);
CREATE TABLE sales (
    saleid INT PRIMARY KEY,
    itemid INT,
    quantity INT,
    amount FLOAT,
    CONSTRAINT fkitem FOREIGN KEY(itemid) REFERENCES item(itemid)
);
GRANT INSERT, UPDATE, DELETE, SELECT ON item TO userb;
 
GRANT INSERT, UPDATE, DELETE, SELECT ON sales TO userb;
 
 
GRANT SELECT ON item TO userb; 
GRANT SELECT ON sales TO userb;
 
-- Insert sample data
INSERT INTO item VALUES (1, 'Coffee', 100);
INSERT INTO item VALUES (2, 'Tea', 150);
 
-- Procedure
CREATE OR REPLACE PROCEDURE get_all_items IS
    CURSOR curr IS
        SELECT * FROM item;
BEGIN
    FOR c IN curr LOOP
        dbms_output.put_line(c.itemname || ' ' || c.price);
    END LOOP;
END;
/
