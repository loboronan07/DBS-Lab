set serveroutput on;

create or replace procedure printer is 
    begin 
        dbms_output.put_line('Good Day to You');
    end;
/

begin 
    printer;
end;
/