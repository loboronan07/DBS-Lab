create or replace trigger ex1_trigger 
after insert or update on takes
for each row
begin
    insert into log_change_takes values(current_date, :new.id, :new.course_id, :new.sec_id, :new.semester, :new.year, :new.grade);
end;
/