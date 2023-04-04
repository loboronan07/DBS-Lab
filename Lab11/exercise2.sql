create or replace trigger ex2_trigger
before update of salary on employee
for each row
begin
    insert into old_data_instructor(:old.id, :old.name, :old.dept_name, :old.salary);
end;
/