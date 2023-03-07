set serveroutput on;

declare
    roll StudentTable.RollNo%type;
    g StudentTable.GPA%type;
    grade varchar(2);

begin 
    dbms_output.put_line('Roll No  Grade');

    for roll in 1..5 loop
        select GPA into g from StudentTable where RollNo=roll; 
    
        if g < 4 then
            grade := 'F';
            goto printout;
        end if;

        if g < 5 then 
            grade := 'E';
            goto printout;
        end if;

        if g < 6 then 
            grade := 'D';
            goto printout;
        end if;

        if g < 7 then 
            grade := 'C';
            goto printout;
        end if;

        if g < 8 then 
            grade := 'B';
            goto printout;
        end if;

        if g < 9 then 
            grade := 'A';
            goto printout;
        end if;
        
        if g <= 10 then
            grade := 'A+';
            goto printout;
        end if;

        <<printout>>
        dbms_output.put_line(to_char(roll) || '        ' || grade);
    end loop;

exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');

end;
/