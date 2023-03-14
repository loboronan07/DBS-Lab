set serveroutput on;

declare 
    cursor c is select * from takes natural join student;

begin 
    for stud in c
    loop
        if stud.course_id='CS-101' and stud.tot_cred<30 then
            delete from takes where id=stud.id;
        end if;
    end loop;

end;
/