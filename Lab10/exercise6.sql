create or replace function department_highest(dname department.dept_name%type) 
return instructor.name%type as
    ins_name instructor.name%type;
begin
    select name into ins_name from (select name from instructor where dept_name = dname order by salary desc) where rownum < 2; 
	return ins_name;
end;
/

declare 
	cursor ex6 is select dept_name from department;
begin
	dbms_output.put_line(lpad('Department Name', 15) || lpad('Highest Paid Instructor', 29));

	for dept in ex6 loop
		dbms_output.put_line(lpad(dept.dept_name, 15) || lpad(department_highest(dept.dept_name), 29));
	end loop;
end;
/
