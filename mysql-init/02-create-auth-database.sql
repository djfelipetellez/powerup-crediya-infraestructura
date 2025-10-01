-- Use the auth schema within the main database
USE crediya_db;

-- Create rol table in auth schema
CREATE TABLE IF NOT EXISTS auth_schema.rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Create usuario table in auth schema
CREATE TABLE IF NOT EXISTS auth_schema.usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    documento_identidad VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    salario_base DECIMAL(12,2),
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES auth_schema.rol(id_rol)
);

-- Create user_credentials table in auth schema
CREATE TABLE IF NOT EXISTS auth_schema.user_credentials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    id_usuario INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP NULL,
    `active` tinyint(1) DEFAULT '1',
    FOREIGN KEY (id_usuario) REFERENCES auth_schema.usuario(id_usuario),
    INDEX idx_email (email),
    INDEX idx_usuario (id_usuario)
);

-- Insert default roles
INSERT IGNORE INTO auth_schema.rol (nombre, descripcion) VALUES
('ADMIN', 'Rol perteneciente al administrador del sistema'),
('ASESOR', 'Rol perteneciente asesor del banco'),
('CLIENTE', 'Rol perteneciente a un cliente que solicita prestamo');