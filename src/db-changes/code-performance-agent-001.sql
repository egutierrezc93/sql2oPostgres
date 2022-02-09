-- --------------------------------------------------------------------------------
-- CHANGE DESCRIPTION:
-- ------------------
-- Create data model to store code agents information
--
-- CHANGE START DATE:
-- -----------------
-- Feb 4 2022
-- --------------------------------------------------------------------------------


--Drop un-used tables -------------------------------------------------------------

drop table IF EXISTS tns_job_code_performance_memory CASCADE;
drop table IF EXISTS tns_job_code_performance_samplers CASCADE;
drop table IF EXISTS tns_job_code_performance CASCADE;
drop table IF EXISTS tns_scenario_code_performance CASCADE;



--create table tns_scenario_base -------------------------------------------------------------
CREATE TABLE tns_scenario_base(
	id int4 NOT NULL,
	code varchar(512) NOT NULL,
	target_id int4 NOT NULL,
	description varchar(1025) NOT NULL,
	test_definition text NOT NULL,
	date_created timestamptz NOT NULL DEFAULT now(),
	assigned varchar(13) NOT NULL DEFAULT 'Runfalcon',
	CONSTRAINT tns_scenarios_code_key_1 UNIQUE (code),
	CONSTRAINT tns_scenarios_pkey_1 PRIMARY KEY (id)
);

-- tns_scenario_code_performance---------------------------------------------------------

CREATE TABLE tns_scenario_code_performance (
	id int4  NOT NULL,  --debe de ser int porque es la clave foranea de tns_scenario_base(id) que es int4
	active  bool NOT NULL DEFAULT true -- enable es una palabra reservada en postgres, por eso puse active
);

-- tns_job_code_performance--------------------------------------------------------------

CREATE TABLE tns_job_code_performance (
	id numeric (15) NOT NULL,
	scenario_id  int4  NOT NULL
);

-- tns_job_code_memory-------------------------------------------------------------

CREATE TABLE tns_job_code_performance_memory (
	id numeric(15) NOT NULL,
	job_id  numeric(15) NOT NULL,
	sampler_timestamp numeric(15)NOT NULL,-- timestamp es una palabra reservada en postgres, por eso puse datetime
	free_memory numeric(15) NOT NULL,
	total_memory numeric(15)NOT NULL,
	ip_address varchar(15) not null
);

-- tns_job_code_performance-------------------------------------------------------

CREATE TABLE tns_job_code_performance_samplers (
	id numeric(15)  NOT NULL,
	job_id  numeric(15)  NOT NULL,
	sampler_timestamp numeric(15) NOT NULL,-- timestamp es una palabra reservada en postgres, por eso puse datetime
	class_name varchar(100) NOT NULL,
	method_name varchar(100) NOT NULL,
	latency numeric(10) not null,
	ip_address varchar(15) not null
);

-------------------- alter table tns_scenario_code_performance --------------------

ALTER TABLE tns_scenario_code_performance
ADD CONSTRAINT tns_scenario_code_performance_pk PRIMARY KEY (id);
ALTER TABLE tns_scenario_code_performance
ADD CONSTRAINT tns_scenario_code_performance_fk foreign key (id) references tns_scenario_base(id);

-------------------- alter table tns_job_code_performance -------------------------

ALTER TABLE tns_job_code_performance
ADD CONSTRAINT tns_job_code_performance_pk PRIMARY KEY (id);
ALTER TABLE tns_job_code_performance
ADD CONSTRAINT tns_job_code_performance_fk01 foreign key (scenario_id) references tns_scenario_code_performance(id);

-------------------- alter table tns_job_code_performance_memory ------------------

ALTER TABLE tns_job_code_performance_memory
ADD CONSTRAINT tns_job_code_performance_memory_pk primary key (id);

ALTER TABLE tns_job_code_performance_memory
ADD CONSTRAINT tns_job_code_performance_memory_fk01 foreign key (job_id) references tns_job_code_performance(id);

-------------------- alter table tns_job_code_performance_samplers -----------------

ALTER TABLE tns_job_code_performance_samplers
ADD CONSTRAINT tns_job_code_performance_samplers_pk primary key (id);

ALTER TABLE tns_job_code_performance_samplers
ADD CONSTRAINT tns_job_code_performance_samplers_fk01 foreign key (job_id) references tns_job_code_performance(id);

