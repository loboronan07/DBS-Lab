create or replace procedure interests(p in real,  t in real, r in real, si out real, ci out real, tot_s in out real, tot_c in out real) as
begin
	si := (p*t*r) / 100;
	tot_s := p + si;
	tot_c := p * power(1 + r/100, t);
	ci := tot_c - p;
end;
/

declare
	p real;
	t real;
	r real;
	si real;
	ci real;
	tot_si real;
	tot_ci real;
begin
	p := &principle;
	t := &time;
	r := &interest;
	interests(p, t, r, si, ci, tot_si, tot_ci);
	dbms_output.put_line('Simple Interest: ' || si);
	dbms_output.put_line('Total Sum after Simple Interest: ' || tot_si);
	dbms_output.put_line('Compound Interest: ' || ci);
	dbms_output.put_line('Total Sum after Compound Interest: ' || tot_ci);
end;
/