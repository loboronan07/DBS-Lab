set serveroutput on;

declare
    out_of_range exception;
    roll StudentTable.RollNo%type;
    g StudentTable.GPA%type;
    grade varchar(2);

begin 
    roll := 1;
    while roll < 9
        loop
            select GPA into g from StudentTable where RollNo=roll; 

            if g < 0 then 
                raise out_of_range;
            elsif g < 4 then
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
            elsif g <= 10 then 
                grade := 'A+';
            else
                raise out_of_range;
            end if;

            update StudentTable set LetterGrade=grade where RollNo=roll;

            roll := roll + 1;
        end loop;

exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');

    when out_of_range then 
        dbms_output.put_line('GPA out of range');

end;
/