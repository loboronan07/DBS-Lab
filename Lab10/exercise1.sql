create or replace procedure disp_message as
begin
	dbms_output.put_line('Good Day To You');
end;
/

begin
	disp_message;
end;
/
