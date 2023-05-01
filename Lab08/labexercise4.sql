declare 
	r student_table.rollno%type;
	g student_table.gpa%type;
	grade varchar(2);
begin 
	r := 1;
	dbms_output.put_line(lpad('Roll', 10) || lpad('Grade', 10));

	loop
		select gpa into g from student_table where rollno = r;

		if g < 0 then
        	grade := 'NA';
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
        	grade := 'NA';
		end if;

		dbms_output.put_line(lpad(r, 10) || lpad(grade, 10));

		r := r + 1;
		if r > 5 then
            exit;
		end if;
	end loop;
exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');
end;
		
