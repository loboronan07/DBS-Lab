set serveroutput on;

declare
    instructorinfo instructor%rowtype;
    n instructor.name%type;

begin   
    n := &name;

    select * into instructorinfo from instructor where name=n;

    dbms_output.put_line('ID: ' || to_char(instructorinfo.id));
    dbms_output.put_line('Name: ' || to_char(instructorinfo.name));
    dbms_output.put_line('Department Name: ' || to_char(instructorinfo.dept_name));
    dbms_output.put_line('Salary: ' || to_char(instructorinfo.salary));

exception
    when too_many_rows then 
        dbms_output.put_line('Multiple Instructors with the same name');
    when no_data_found then
        dbms_output.put_line('No instructor for the given name');

end;
/
