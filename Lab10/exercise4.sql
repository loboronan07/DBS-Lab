set serveroutput on;

create or replace procedure listing(dpt_nm department.dept_name%type) is
    cursor c1 is select * from student where dept_name=dpt_nm;
    cursor c2 is select * from course where dept_name=dpt_nm;
    begin
        dbms_output.put_line('Students associated with Department ' || dpt_nm);
        for stu in c1
        loop 
            dbms_output.put_line(stu.name);
        end loop;

        dbms_output.put_line('Courses associated with Department ' || dpt_nm);
        for crs in c2
        loop 
            dbms_output.put_line(crs.title);
        end loop;
    end;
/

declare 
    dpt_nm department.dept_name%type;
begin
    dpt_nm := '&department_name';
    listing(dpt_nm);
end;
/