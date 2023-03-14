set serveroutput on;

declare 
    dname instructor.dept_name%type;
    cursor c(dname instructor.dept_name%type) is select * from instructor where dept_name=dname;

begin 
    dname := '&dept_name';

    for ins in c(dname)
    loop
        insert into salary_raise values(ins.id, current_date, ins.salary*0.05);
        update instructor set salary=salary*1.05 where id=ins.id;
    end loop;

end;
/

