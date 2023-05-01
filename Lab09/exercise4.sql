declare
	cursor ex4 is select * from takes;
	cred student.tot_cred%type;
begin
	for val in ex4 loop
		if val.course_id = 'CS-101' then
			select tot_cred into cred from student where id = val.id;
			if cred < 30 then 
				delete from takes where id = val.id and course_id = 'CS-101' and semester = val.semester and year = val.year;
			end if;
		end if;
	end loop;
end;
/
