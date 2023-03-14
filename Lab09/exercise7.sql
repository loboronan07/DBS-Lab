set serveroutput on;

declare 
    flag boolean;
    cname course.title%type;
    cursor c1 is select * from advisor, student where student.id=advisor.s_id;
    cursor c2(sid student.id%type) is select course_id, sec_id, semester, year from student natural join takes where id=sid;
    cursor c3(iid instructor.id%type) is select course_id, sec_id, semester, year from instructor natural join teaches where id=iid;

begin 
    dbms_output.put_line('Student Name');

    for adv in c1
    loop 
        flag := false;
        for cstud in c2(adv.s_id)
        loop
            for cins in c3(adv.i_id) 
            loop
                if cstud.course_id=cins.course_id and cstud.sec_id=cins.sec_id and cstud.semester=cins.semester and cstud.year=cins.year then
                    dbms_output.put_line(to_char(adv.name));
                    flag := true;
                end if;
                exit when flag;
            end loop;
            exit when flag;
        end loop;
    end loop;

end;
/