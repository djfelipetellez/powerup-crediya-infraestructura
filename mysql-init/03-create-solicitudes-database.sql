-- Use the solicitudes schema within the main database
USE crediya_db;

-- Tabla estados
CREATE TABLE IF NOT EXISTS `solicitudes_schema`.`estados` (
     `id_estado` int NOT NULL AUTO_INCREMENT,
     `nombre` varchar(100) NOT NULL,
    `descripcion` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id_estado`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla tipo_prestamo
CREATE TABLE IF NOT EXISTS `solicitudes_schema`.`tipo_prestamo` (
                                               `id_tipo_prestamo` int NOT NULL AUTO_INCREMENT,
                                               `nombre` varchar(100) NOT NULL,
    `monto_minimo` decimal(12,2) NOT NULL,
    `monto_maximo` decimal(12,2) NOT NULL,
    `tasa_interes` decimal(5,2) NOT NULL,
    `validacion_automatica` tinyint(1) DEFAULT '0',
    PRIMARY KEY (`id_tipo_prestamo`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla solicitud
CREATE TABLE IF NOT EXISTS `solicitudes_schema`.`solicitud` (
                                           `id_solicitud` int NOT NULL AUTO_INCREMENT,
                                           `monto` decimal(12,2) NOT NULL,
    `plazo` int NOT NULL,
    `email` varchar(150) NOT NULL,
    `id_estado` int NOT NULL,
    `id_tipo_prestamo` int NOT NULL,
    PRIMARY KEY (`id_solicitud`),
    KEY `id_estado` (`id_estado`),
    KEY `id_tipo_prestamo` (`id_tipo_prestamo`),
    CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `solicitudes_schema`.`estados` (`id_estado`),
    CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`id_tipo_prestamo`) REFERENCES `solicitudes_schema`.`tipo_prestamo` (`id_tipo_prestamo`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insertar datos iniciales de estados
INSERT IGNORE INTO solicitudes_schema.estados (nombre, descripcion) VALUES
('PENDIENTE DE REVISION', 'ESTADO INICIAL DE LA SOLICITUD'),
('REVISION_MANUAL', 'ESTADO EN EL QUE SE ESTA REALIZANDO LA EVALUACION DEL PRESTAMO'),
('APROBADO', 'ESTADO APROBADO DEL PRESTAMO'),
('RECHAZADO', 'ESTADO DONDE POR X O Y RAZON SE RECHAZO LA SOLICITUD');

-- Insertar datos iniciales de tipos de préstamo
INSERT IGNORE INTO solicitudes_schema.tipo_prestamo (nombre, monto_minimo, monto_maximo, tasa_interes, validacion_automatica) VALUES
('PERSONAL', 500000.00, 50000000.00, 15.50, 1),
('HIPOTECARIO', 30000000.00, 500000000.00, 8.75, 0),
('VEHICULAR', 5000000.00, 150000000.00, 12.25, 1),
('EMPRESARIAL', 2000000.00, 200000000.00, 18.00, 0),
('EDUCATIVO', 1000000.00, 80000000.00, 10.50, 1),
('MICROCREDITO', 100000.00, 5000000.00, 22.50, 1),
('LIBRE_DESTINO', 300000.00, 30000000.00, 16.75, 1),
('EXPRESS_TEST', 50000.00, 2000000.00, 25.00, 1);