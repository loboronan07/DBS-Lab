create or replace trigger ex5_trigger
instead of delete on advisor_student 
for each row 
begin 
    delete from advisor where i_id = :old.i_id or s_id = :old.s_id;
end;
/
