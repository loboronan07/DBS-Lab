insert into student_table(rollno, gpa) values (6, -10);
/

declare 
    out_of_bounds exception;
	r student_table.rollno%type;
	g student_table.gpa%type;
	grade varchar2(2);
begin 
	r := 1;

	while r <= 6 loop
		select gpa into g from student_table where rollno = r;

		if g < 0 then
        	raise out_of_bounds;
		elsif g <= 4 then
        	grade := 'F';
		elsif g <=5 then
        	grade := 'E';
		elsif g <=6 then
        	grade := 'D';
		elsif g <=7 then
        	grade := 'C';
		elsif g <=8 then
        	grade := 'B';
		elsif g <=9 then
        	grade := 'A';
		elsif g <= 10 then
        	grade := 'A+';
		else 
        	raise out_of_bounds;
		end if;

		update student_table set lettergrade = grade where rollno = r;

		r := r + 1;
	end loop;
exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');
    when out_of_bounds then
        dbms_output.put_line('GPA value out of range 0-10.');
end;
/
