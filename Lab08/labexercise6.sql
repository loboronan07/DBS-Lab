set serveroutput on;

declare
    roll StudentTable.RollNo%type;
    maxroll StudentTable.RollNo%type;
    g StudentTable.GPA%type;
    maxg StudentTable.GPA%type;

begin 
    maxg := 0;
    maxroll := 0;
    
    for roll in 1..5 loop
        select GPA into g from StudentTable where RollNo=roll; 
        if g > maxg then
            maxg := g;
            maxroll := roll;
        end if;
    end loop;

    dbms_output.put_line('Student with Roll No ' || to_char(maxroll) || ' has the maximum GPA of ' || to_char(maxg));

exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');

end;
/