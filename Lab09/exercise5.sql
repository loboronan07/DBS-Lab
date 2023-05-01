update student_table set lettergrade = 'F';
/

declare 
    grade varchar2(2);
	cursor ex5 is select * from student_table for update;
begin
	for stud in ex5 loop
		if stud.gpa < 0 then
        	grade := 'NA';
		elsif stud.gpa <= 4 then
        	grade := 'F';
		elsif stud.gpa<=5 then
        	grade := 'E';
		elsif stud.gpa <=6 then
        	grade := 'D';
		elsif stud.gpa <=7 then
        	grade := 'C';
		elsif stud.gpa <=8 then
        	grade := 'B';
		elsif stud.gpa <=9 then
        	grade := 'A';
		elsif stud.gpa <= 10 then
        	grade := 'A+';
		else 
        	grade := 'NA';
		end if;

		update student_table set lettergrade = grade where current of ex5;
	end loop;
end;
/
