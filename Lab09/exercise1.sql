set serveroutput on;

declare 
	dname instructor.dept_name%type;
	ins instructor%rowtype;
	cursor ex1 is select * from instructor;
begin
	dname := '&dept_name';

	open ex1;
	loop
		fetch ex1 into ins;
		exit when ex1%notfound;
		if ins.dept_name = dname then
			insert into salary_raise values (ins.id, current_date, ins.salary*0.05);
			update instructor set salary = salary * 1.05 where id = ins.id;
		end if;
	end loop;
	close ex1;
end;
/	

