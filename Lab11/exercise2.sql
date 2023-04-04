create or replace trigger ex2_trigger
before update of salary on instructor
for each row
begin
    insert into old_data_instructor values(:old.id, :old.name, :old.dept_name, :old.salary);
end;
/