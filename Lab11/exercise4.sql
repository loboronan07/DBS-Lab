create or replace trigger ex4_trigger 
before update or delete on client_master
for each row
begin
    case 
        when updating then 
            insert into auditclient values(:old.client_no, :old.name, :old.bal_due, 'UPDATE', user, current_date);
        when deleting then 
            insert into auditclient values(:old.client_no, :old.name, :old.bal_due, 'DELETE', user, current_date);
    end case;
end;
/