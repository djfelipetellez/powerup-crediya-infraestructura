-- Usar la base de datos principal
USE crediya_db;

-- Configurar usuario de BD para usar mysql_native_password
ALTER USER 'crediya_user'@'%' IDENTIFIED WITH mysql_native_password BY 'crediya_password';
FLUSH PRIVILEGES;

-- El usuario administrador se creará desde la aplicación
-- para evitar problemas de validación de contraseña encriptada