set serveroutput on;

declare
    cursor c is select * from 

begin
    dbms_output.put_line(rpad('ID', 6) || rpad('Name', 10) || rpad('Department Name', 20) || rpad('Total Credits', 15));



end
/

select course_id, title, dept_name, credits, count(id) from course natural join takes natural join section group by course_id;