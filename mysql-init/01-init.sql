-- Database and user are already created by MySQL environment variables
-- Create separate schemas for each microservice
USE crediya_db;

CREATE SCHEMA IF NOT EXISTS auth_schema;
CREATE SCHEMA IF NOT EXISTS solicitudes_schema;

-- Grant privileges to each schema
GRANT ALL PRIVILEGES ON crediya_db.* TO 'crediya_user'@'%';
GRANT ALL PRIVILEGES ON auth_schema.* TO 'crediya_user'@'%';
GRANT ALL PRIVILEGES ON solicitudes_schema.* TO 'crediya_user'@'%';

FLUSH PRIVILEGES;