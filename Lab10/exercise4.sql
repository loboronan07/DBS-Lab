create or replace procedure disp_by_department(dname department.dept_name%type) as
	cursor get_stud is select name from student where dept_name = dname;
	cursor get_course is select title from course where dept_name = dname;
begin
    dbms_output.put_line('Under Department ' || dname);
	dbms_output.put_line('---Students---');
	for stud in get_stud loop
		dbms_output.put_line(stud.name);
	end loop;

	dbms_output.put_line('---Courses---');
	for crs in get_course loop
		dbms_output.put_line(crs.title);
	end loop;
end;
/

declare 
    dname department.dept_name%type;
begin
	dname := '&department_name';
	disp_by_department(dname);
end;
/
