declare 
	g student_table.gpa%type;
	mr student_table.rollno%type;
	mg student_table.gpa%type := 0;
begin
	for r in 1..5 loop 
		select gpa into g from student_table where rollno = r;

		if g > mg then
			mg := g;
			mr := r;
		end if;
	end loop;

	dbms_output.put_line('Student with Roll No ' || mr || ' has the maximum gpa of ' || mg);
end;
/
