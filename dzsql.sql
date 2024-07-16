
-- дз 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

drop function sec;
delimiter // 
create function sec (secs int) 
returns varchar(300) 
 deterministic 
begin 
declare days int; 
declare hours int; 
declare minutes int; 
declare seconds int; 
declare res varchar(100); 
 
set days = secs DIV (24*60*60); 
set secs = secs MOD (24*60*60); 
 
set hours = secs div (60 * 60); 
set secs = secs mod (60*60); 
 
set minutes = secs div 60; 
set seconds = secs mod 60; 


set res = concat( days, ' days ', hours, ' hours ', minutes , ' minutes ', seconds, ' seconds ') ;
return res;
end //  
 
select sec(123456);


-- дз 2. Выведите только чётные числа от 1 до 10.
-- Пример: 2,4,6,8,10.

drop procedure seminar.num;
delimiter // 
create procedure num(num int)
begin 

declare x int default 0;
declare res varchar(100) default " ";
while x <= 8 do
set x = x + 2;

set res = concat(res, ' ', x );
end while;
 select res;

end // 

call num(10); 