declare 
	r student_table.rollno%type;
	g student_table.gpa%type;
begin 
	r := &roll;
	select gpa into g from student_table where rollno = r;
	dbms_output.put_line('GPA of Student with Roll No ' || r || ' is ' || g);
exception
    when no_data_found then
        dbms_output.put_line('Student does not exist');
end;
/
