set serveroutput on;

create or replace function department_highest(dpt_nm department.dept_name%type) 
return instructor.name%type as
    highestname instructor.name%type;
    begin 
        select name into highestname from (select * from instructor where dept_name=dpt_nm order by salary desc) where rownum < 2;
    return highestname;
    end;
/

declare 
    cursor c1 is select * from department;
begin
    dbms_output.put_line(rpad('Department', 15) || rpad('Instructor Name', 15));
    for dpt in c1
    loop
        dbms_output.put_line(rpad(dpt.dept_name, 15) || rpad(department_highest(dpt.dept_name), 15));
    end loop;
end;
/