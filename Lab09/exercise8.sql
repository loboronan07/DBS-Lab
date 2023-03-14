set serveroutput on;

declare 
    bud number(12, 2);
    sal number(12, 2);
    cursor c is select * from instructor where dept_name='Biology';

begin 
    commit;

    for ins in c
    loop
        update instructor set salary=salary*1.2 where id=ins.id;
    end loop;

    select sum(salary) into sal from instructor where dept_name='Biology';
    select budget into bud from department where dept_name='Biology';

    if bud > sal then
        dbms_output.put_line('Successfully updated salaries with raise of 20 percent.');
    else
        rollback;
        dbms_output.put_line('Department Budget not enough to support raise.');
    end if;

end;
/