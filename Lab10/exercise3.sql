set serveroutput on;

create or replace procedure course_popular(dpt_nm department.dept_name%type) as
    cidmax course.course_id%type;
    titlemax course.title%type;
    begin
        select course_id, title into cidmax, titlemax from 
            (select course_id, title, count(*) counts from course natural join takes where dept_name=dpt_nm group by course_id, title order by counts desc)
                where rownum < 2;
        dbms_output.put_line(rpad(dpt_nm, 15) || rpad(to_char(cidmax), 15) || rpad(titlemax, 30));
    end;
/

declare 
    cursor c1 is select * from department;
    dpt_nm department.dept_name%type;
begin
    dbms_output.put_line(rpad('Department', 15) || rpad('Course ID', 15) || rpad('Course Title', 30));
    for dpt in c1
    loop
        course_popular(dpt.dept_name);
    end loop;
end;
/