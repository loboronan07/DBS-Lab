set serveroutput on;

create or replace function get_sqr(n number) 
return number as
    sqr number;
    begin 
        sqr := n * n;
    return sqr;
    end;
/

declare 
    n number;
begin
    n := &n;
    dbms_output.put_line(to_char(n) || '^2 = ' || to_char(get_sqr(n)));
end;
/