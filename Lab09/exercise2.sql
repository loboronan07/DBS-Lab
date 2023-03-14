set serveroutput on;

declare
	cursor c1 is select * from student order by tot_cred;
	stud student%rowtype;

begin 
	dbms_output.put_line(rpad('ID', 6) || rpad('Name', 10) || rpad('Department Name', 20) || rpad('Total Credits', 15));
	open c1;
		loop
		  fetch c1 into stud;
		  exit when c1%rowcount>10 or c1%notfound;
		  dbms_output.put_line(rpad(to_char(stud.id), 6) || rpad(to_char(stud.name), 10) || rpad(to_char(stud.dept_name), 20) || rpad(to_char(stud.tot_cred), 15));
		end loop;

end;
/