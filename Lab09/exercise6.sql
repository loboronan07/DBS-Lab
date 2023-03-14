set serveroutput on;

declare 
    cname course.title%type;
    cursor c(cname course.title%type) is select distinct name from instructor natural join teaches natural join course where title=cname;

begin 
    cname := '&course_name';

    dbms_output.put_line('');
    dbms_output.put_line(rpad('Instructor Name', 15));
    for tmp in c(cname)
    loop
        dbms_output.put_line(rpad(tmp.name, 15));
    end loop;

end;
/