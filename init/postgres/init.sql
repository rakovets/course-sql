-- PostgreSQL dialect
GRANT ALL PRIVILEGES ON DATABASE course_sql TO postgres;

DROP SCHEMA IF EXISTS intro;
DROP SCHEMA IF EXISTS data_manipulation;
DROP SCHEMA IF EXISTS aggregation_functions_and_grouping;
DROP SCHEMA IF EXISTS multi_tabular_databases;
DROP SCHEMA IF EXISTS designing_relational_databases;
DROP SCHEMA IF EXISTS advanced_sql;
CREATE SCHEMA intro;
CREATE SCHEMA data_manipulation;
CREATE SCHEMA aggregation_functions_and_grouping;
CREATE SCHEMA multi_tabular_databases;
CREATE SCHEMA designing_relational_databases;
CREATE SCHEMA advanced_sql;