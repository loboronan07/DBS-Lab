create table log_change_takes
	(time_of_change date,
     ID			    varchar(5), 
	 course_id		varchar(8),
	 sec_id		    varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 grade		    varchar(2),
	 primary key (ID, course_id, sec_id, semester, year),
	 foreign key (ID) references student on delete cascade
	);

create table old_data_instructor
	(ID			varchar(5), 
	 name			varchar(20) not null, 
	 dept_name		varchar(20), 
	 salary	numeric(8,2),
	 foreign key (dept_name) references department
		on delete set null
	);


create table client_master(
    client_no varchar(5) primary key,
    name varchar(20) not null,
    address varchar(25),
    bal_due numeric(8,2)
);

create table auditclient(
    client_no varchar(5),
    name varchar(20) not null,
    bal_due numeric(8,2),
    operation varchar(6), 
    userid varchar(5),
    opdate date
);