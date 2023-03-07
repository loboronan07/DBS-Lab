set serveroutput on;
declare
    roll StudentTable.RollNo%type;
    g StudentTable.GPA%type;
begin 
    roll := &roll;
    select GPA into g from StudentTable where RollNo=roll; 
    dbms_output.put_line('GPA of Student with Roll No ' || to_char(roll) || ' is ' || to_char(g));
exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');
end;
/
