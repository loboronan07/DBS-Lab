create table log_change_takes
	(Time_Of_Change date,
     ID			    varchar(5), 
	 course_id		varchar(8),
	 sec_id		    varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 grade		    varchar(2),
	 primary key (ID, course_id, sec_id, semester, year),
	 foreign key (ID) references student on delete cascade
	);