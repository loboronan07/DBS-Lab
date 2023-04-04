create or replace trigger ex3_trigger 
before insert or update on instructor
for each row
declare 
    budg numeric(12,2);
begin
--    if (:new.name not like '%[a-zA-Z]%') then 
--        raise_application_error(-20000, 'Name must contain alphabets only');
--    end if;
    if (:new.salary <= 0) then  
        raise_application_error(-20001, 'Salary must be positive');
    end if;

    select budget into budg from department where dept_name = :new.dept_name;
    if (:new.salary > budg) then 
        raise_application_error(-20002, 'Salary Exceeds Department Budget');
    end if;
end;
/