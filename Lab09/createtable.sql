create table salary_raise (
	id	varchar(5),
	raise_date date,
    raise_amt numeric(8, 2),
	foreign key(id) REFERENCES instructor on delete cascade
);
