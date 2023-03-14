set serveroutput on;

declare
    roll StudentTable.RollNo%type;
    g StudentTable.GPA%type;
    grade varchar(2);

begin 
    roll := &roll;
    select GPA into g from StudentTable where RollNo=roll; 
    
    if g < 4 then
        grade := 'F';
    elsif g < 5 then 
        grade := 'E';
    elsif g < 6 then 
        grade := 'D';
    elsif g < 7 then 
        grade := 'C';
    elsif g < 8 then 
        grade := 'B';
    elsif g < 9 then 
        grade := 'A';
    else 
        grade := 'A+';
    end if;

    dbms_output.put_line('Grade of Student ' || to_char(roll) || ': ' || grade);

exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');

end;
/