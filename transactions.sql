-- BEGIN or START TRANSACTION: Starts a new transaction.

-- COMMIT: Commits/saves the changes of a successful transaction.

-- SAVEPOINT: Sets a point within a transaction to which you can later rollback if needed, without rolling back the entire transaction.

-- ROLLBACK: Used to undo the changes done by the transaction.

use dataanalaytics;

delete from products;
select * from products;


start transaction;

savepoint point;

insert into products values(9,'ABC',8800000);
insert into products values(10,'CFG',1000000);   ---


rollback to point;

commit;