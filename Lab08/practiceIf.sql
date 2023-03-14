set serveroutput on

declare
	grade char(1);
begin
	grade := '&g';
if grade = 'A' then
	dbms_output.put_line('Excellent');
elsif grade = 'B' then 
	dbms_output.put_line('Very Good');
elsif grade = 'C' then 
	dbms_output.put_line('Good');
elsif grade = 'D' then 
	dbms_output.put_line('Fair');
elsif grade = 'F' then 
	dbms_output.put_line('Poor');
else
	dbms_output.put_line('No such grade');
end if;
end;
/