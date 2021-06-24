-- MariaDB Dialect
GRANT ALL ON intro.* TO 'mariadb'@'%';
GRANT ALL ON data_manipulation.* TO 'mariadb'@'%';
GRANT ALL ON aggregation_functions_and_grouping.* TO 'mariadb'@'%';
GRANT ALL ON multi_tabular_databases.* TO 'mariadb'@'%';
GRANT ALL ON designing_relational_databases.* TO 'mariadb'@'%';
GRANT ALL ON advanced_sql.* TO 'mariadb'@'%';

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
