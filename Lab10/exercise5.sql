create or replace function get_square(x integer) 
return integer as
	sq integer;
begin
	sq := x*x;
	return sq;
end;
/

declare 
	a integer;
begin
	a := &a;
	dbms_output.put_line(a || '*' || a || ' =  ' || get_square(a));
end;
/
