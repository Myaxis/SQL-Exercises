USE test;
/*Table for #1*/
create table countries
(
	country_id varchar(2),
    country_name varchar(30),
    region_id decimal(10,0)
);
/*Table for #2*/
create table if not exists countries
(
	country_id varchar(2),
    country_name varchar(30),
    region_id decimal(10,0)
);
/*Table for #3*/
CREATE TABLE IF NOT EXISTS dup_countries 
LIKE countries;
/*Table for #4*/
CREATE TABLE IF NOT EXISTS dup_countries 
AS SELECT * FROM countries;
/*Table for #5*/
create table if not exists countries
(
	country_id varchar(2) null,
    country_name varchar(30) null,
    region_id decimal(10,0) null
);
/*Table for #6*/
create table if not exists jobs
(
	job_id varchar(10) not null,
    job_title varchar(40) not null,
    min_salary decimal(6,0),
    max_salary decimal(6,0)
    check(max_salary<=25000)
);
/*Table for #7*/
create table if not exists countries
(
	country_id varchar(2),
    country_name varchar(30),
    check(country_name in('Italy', 'India', 'China')),
    region_id decimal(10,0)
);
/*Table for #8*/
create table if not exists job_history
(
	employee_id decimal(6,0),
    start_date date,
    end_date date,
    check (end_date like '--/--/----'),
    job_id varchar(10) not null,
    department_id decimal(4,0) not null
);
/*Table for #9*/
create table if not exists countries
(
	country_id varchar(2) not null,
    country_name varchar(30) not null,
    region_id decimal(10,0) not null,
    unique(country_id)
);
/*Table for #10*/
create table if not exists jobs
(
	job_id varchar(10) not null,
    job_title varchar(40) default ' ',
    min_salary decimal(6,0) default 8000,
    max_salary decimal(6,0) default null
);
/*Table for #11*/
create table if not exists countries
(
	country_id varchar(2) not null unique primary key,
    country_name varchar(30) not null,
    region_id decimal(10,0) not null
);
/*Table for #12*/
create table if not exists countries
(
	country_id integer not null unique auto_increment primary key,
    country_name varchar(30) not null,
    region_id decimal(10,0) not null
);
/*Table for #13*/
create table if not exists countries
(
	country_id varchar(2) not null unique,
    country_name varchar(30) not null,
    region_id decimal(10,0) not null,
    primary key (country_id, region_id)
);
/*Jobs table structure for #14, 15*/
create table if not exists jobs
(
	job_id varchar(10) not null unique primary key,
    job_title varchar(35) not null default ' ',
    min_salary decimal(6,0) default null,
    max_salary decimal(6,0) default null
);
/*Table for #14*/
create table if not exists job_history
(
	employee_id decimal(6,0) not null unique primary key,
    start_date date,
    end_date date,
    job_id varchar(10) not null,
    department_id decimal(4,0) not null,
    foreign key (job_id) references jobs(job_id)
);
/*Departments table structure for #15, 16*/
create table if not exists department
(
	department_id decimal(4,0) not null default 0,
    department_name varchar(30) not null default ' ',
    manager_id decimal(6,0) not null default 0,
    location_id decimal(4,0) default null,
    primary key (department_id, manager_id)
);
/*Table for #15*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) not null default ' ',
    last_name varchar (30) not null default ' ',
    email varchar (35) default null,
    phone_number varchar(10) default null,
    hire_date date not null,
    job_id varchar(10) not null,
    salary decimal(6,0) default 0,
    commission decimal(6,0) default 0,
    manager_id decimal(6,0) not null,
    department_id decimal(4,0) not null,
    foreign key(manager_id, department_id)
    references department(department_id, manager_id)
);
/*Table for #16*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) default ' ',
    last_name varchar (30) not null,
    email varchar (35) default null,
    phone_number varchar(10) default null,
    hire_date date not null,
    job_id varchar(10) not null,
    salary decimal(6,0) default 0,
    commission decimal(6,0) default 0,
    manager_id decimal(6,0) not null,
    department_id decimal(4,0) not null,
    foreign key(department_id)
    references department(department_id),
    foreign key(job_id)
    references jobs(job_id)
)engine=InnoDB;
/*Jobs table structure for #17-20*/
create table if not exists jobs
(
	job_id int not null unique primary key,
    job_title varchar(35) default ' ',
    min_salary decimal(6,0) default 8000,
    max_salary decimal(6,0) default null
);
/*Table for #17*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) default ' ',
    last_name varchar (30) not null,
    job_id varchar(10) not null,
    salary decimal(6,0) default 0,
    foreign key(job_id)
    references jobs(job_id)
    on update cascade
    on delete restrict
)engine=InnoDB;
/*Table for #18*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) default ' ',
    last_name varchar (30) not null,
    job_id varchar(10) not null,
    salary decimal(6,0) default 0,
    foreign key(job_id)
    references jobs(job_id)
    on update restrict
    on delete cascade
)engine=InnoDB;
/*Table for #19*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) default ' ',
    last_name varchar (30) not null,
    job_id int,
    salary decimal(6,0) default 0,
    foreign key(job_id)
    references jobs(job_id)
    on update set null
    on delete set null
)engine=InnoDB;
/*Table for #20*/
create table if not exists employees
(
	employee_id decimal (6,0) not null unique primary key,
    first_name varchar (30) default ' ',
    last_name varchar (30) not null,
    job_id int,
    salary decimal(6,0) default 0,
    foreign key(job_id)
    references jobs(job_id)
    on update no action
    on delete no action
)engine=InnoDB;
DESC employees;

