declare 
	r student_table.rollno%type;
	g student_table.gpa%type;
	grade varchar(2);
begin 
	r := &roll;
	select gpa into g from student_table where rollno = r;

	if g < 0 then
        dbms_output.put_line('GPA cannot be less than 0 for a student.');
        return;
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
        dbms_output.put_line('GPA cannot be more than 10 for a student.');
        return;
	end if;

	dbms_output.put_line('Grade of Student with Roll No ' || r || ' is ' || grade);
exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');
end;
/
