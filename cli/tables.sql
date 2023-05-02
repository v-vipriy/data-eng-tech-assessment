CREATE SCHEMA iceberg.raw with (LOCATION = 's3a://streets-data/raw/');

CREATE TABLE iceberg.raw.user_data (
    registration_dttm 	timestamp(6),
		id 			    int,
		first_name 		varchar,
		last_name 		varchar,
		email 			varchar,
		gender 			varchar,
		ip_address 		varchar,
		cc 			    varchar,
		country 		varchar,
		birthdate 		varchar,
		salary 			double,
		title 			varchar,
		comments 		varchar
);

CREATE TABLE hive.raw.user_data_hive (
    registration_dttm 	timestamp,
		id 			    int,
		first_name 		varchar,
		last_name 		varchar,
		email 			varchar,
		gender 			varchar,
		ip_address 		varchar,
		cc 			    varchar,
		country 		varchar,
		birthdate 		varchar,
		salary 			double,
		title 			varchar,
		comments 		varchar
)
WITH (
    external_location='s3a://streets-data/raw/user_data/',
    format = 'ORC'
);

-- INSERT INTO iceberg.raw.user_data <blah blah>;
-- SELECT * FROM hive.raw.user_data_hive;

-- DROP TABLE hive.raw.user_data_hive;