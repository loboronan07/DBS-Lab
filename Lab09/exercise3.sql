declare
    stud_count integer;
	ins_name instructor.name%type;
	cursor ex3 is select * from course natural join teaches natural join section;
begin
    dbms_output.put_line(lpad('Course ID', 10) || lpad('Title', 29) || lpad('Department Name', 18) || lpad('Credits', 10) || lpad('Instructor Name', 18) || lpad('Building', 11) || lpad('Room Number', 14) || lpad('Time Slot ID', 15) || lpad('Total Student No', 19));
	for val in ex3 loop
		select name into ins_name from instructor where id = val.id;
		select count(id) into stud_count from takes where course_id = val.course_id and semester = val.semester and year = val.year;
    	dbms_output.put_line(lpad(val.course_id, 10) || lpad(val.title, 29) || lpad(val.dept_name, 18) || lpad(val.credits, 10) || lpad(ins_name, 18) || lpad(val.building, 11) || lpad(val.room_number, 14) || lpad(val.time_slot_id, 15) || lpad(stud_count, 19));
	end loop;
end;
/
