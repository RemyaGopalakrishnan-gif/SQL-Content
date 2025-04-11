use javafs;

create table USERS(USERID INT ,USERNAME VARCHAR(25));

INSERT INTO USERS VALUES(1,'REMYA');

select * from USERS;

truncate USERS;



DELIMITER //

CREATE PROCEDURE GetUserDetails(IN userID INT)
BEGIN
    SELECT CUSTOMERID, CUSTOMERNAME, COUNTRY
    FROM CUSTOMERS
    WHERE CUSTOMERID = userID;
END //

DELIMITER ;


CALL GetUserDetails(5);


DELIMITER //

CREATE PROCEDURE GetUserName(IN userID INT, OUT userName VARCHAR(100))
BEGIN
    SELECT UserName INTO userName 
    FROM Users 
    WHERE UserID = userID;
END //

DELIMITER ;


SET @user_name = '';

CALL GetUserName(1,@userName);

SELECT @userName;


use dataanalaytics;
DELIMITER //
CREATE PROCEDURE GetAllUSERS()
BEGIN
    SELECT * FROM USERS;
END;
// 

CALL GetAllUSERS()


select * from users;