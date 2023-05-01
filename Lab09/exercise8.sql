declare 
    sal_sum numeric(8, 2);
    budg numeric(8, 2);
	cursor ex8(dname instructor.dept_name%type) is select * from instructor where dept_name = dname for update;
begin
	savepoint save_before;

	for ins in ex8('Biology') loop
		update instructor set salary = salary*1.2 where current of ex8;
	end loop;

	select sum(salary) into sal_sum from instructor where dept_name = 'Biology';
	select budget into budg from department where dept_name = 'Biology';

	if sal_sum > budg then 
        dbms_output.put_line('Department Budget not enough to support raise.');
        rollback to savepoint save_before;
	else 
        dbms_output.put_line('Successfully updated salaries with raise of 20 percent.');
	end if;

	commit;
end;
/
