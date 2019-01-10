
-- The database schema can be written in the SQL language as follows:

create table patient   (
Id		integer not null primary key,
first_name 	varchar(20) not null,
last_name  	varchar(20) not null,
age         	integer not null check(age > -1), -- Can be a baby
address     	varchar(100)
);

create table doctor	(
id          		integer not null primary key,
first_name  	varchar(20) not null,
last_name   	varchar(20) not null,
experience  	integer not null check(experience > -1), -- Can have 0 years experience
speciality  	varchar(30)
);

create table pharm_co( --Company that's producing the meds
id        		 integer not null primary key,
name       	varchar(20) not null,
address    	varchar(100) not null,phone_num  	varchar(10) not null
);

create table pharmacy( -- Place where it's being sold
id        		integer  not null primary key,
name       	varchar(20) not null,
address    	varchar(100) not null,
phone_num  	varchar(10) not null

);

create table drug	(
id       		integer not null primary key,
name     	varchar(30),
formula  	varchar(30)
);

create table prescription(
id        		integer not null primary key,
date        	varchar(19) not null, -- format 'yyyy-MM-dd HH:mm:ss'
quantity   	integer not null,
doc_id      	integer not null,
patient_id  	integer not null,
drug_id     	integer not null,
foreign key (doc_id) 	     REFERENCES doctor(id) on delete set null,
foreign key (patient_id) REFERENCES patient(id) on delete set null,
foreign key (drug_id)      REFERENCES drug(id) on delete set null
);

create table contract	(
id          		integer not null primary key,
pharm_co_id  integer not null,
pharm_id     	integer not null,
start_date   	varchar(19) not null, -- format 'yyyy-MM-dd HH:mm:ss'
end_date     	varchar(19) not null, -- format 'yyyy-MM-dd HH:mm:ss'
text         	blob not null,
foreign key (pharm_co_id) REFERENCES pharm_co on delete set null,
foreign key (pharm_id)        REFERENCES pharmacy on delete set null
);

create table sells	(
id        		integer not null primary key,
pharm_id  	integer not null,
drug_id  	integer not null,
price     	real not null,
foreign key (pharm_id) REFERENCES pharm_co(id) on delete set null,
foreign key (drug_id)     REFERENCES drug(id) on delete set null
);

create table primary_doctor	(
id         	 	integer not null primary key,
doc_id      	integer not null,
patient_id  	integer not null,
foreign key (doc_id) REFERENCES doctor(id) on delete set null,
foreign key (patient_id) REFERENCES patient(id) on delete set null
);

create table makes	(
id           	integer not null primary key,
pharm_co_id  integer not null,
drug_id      	integer not null,
foreign key (pharm_co_id) REFERENCES pharm_co(id) on delete set null,
foreign key (drug_id) REFERENCES drug(id) on delete set null
);
