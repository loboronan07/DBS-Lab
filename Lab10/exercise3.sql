create or replace procedure course_popular(dname department.dept_name%type) as
    title course.title%type;
begin
    select title into title from (select title, count(id) counts from course natural join takes where dept_name = dname group by title order by counts desc) where rownum < 2; 
	dbms_output.put_line(lpad(dname, 15) || lpad(title, 29));
end;
/

declare 
	cursor ex3 is select dept_name from department;
begin
	dbms_output.put_line(lpad('Department Name', 15) || lpad('Most Popular Course', 29));

	for dept in ex3 loop
		course_popular(dept.dept_name);
	end loop;
end;
/
