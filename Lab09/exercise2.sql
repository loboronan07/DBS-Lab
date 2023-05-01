declare 
	stu student%rowtype;
	cursor ex2 is select * from student order by tot_cred;
begin
    dbms_output.put_line(lpad('ID', 10) || lpad('Name', 10) || lpad('Dept Name', 15) || lpad('Tot Cred', 10));
	open ex2;
	loop
		fetch ex2 into stu;
		exit when ex2%notfound or ex2%rowcount>10;

		dbms_output.put_line(lpad(stu.id, 10) || lpad(stu.name, 10) || lpad(stu.dept_name, 15) || lpad(stu.tot_cred, 10));
	end loop;
	close ex2;
end;
/
