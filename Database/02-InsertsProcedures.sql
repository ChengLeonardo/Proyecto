USE 5to_7maTest;

-- Drop Procedure para InsertarUsuario
DROP PROCEDURE IF EXISTS InsertarUsuario;

-- Procedure para insertar en Usuarios
DELIMITER //
CREATE PROCEDURE InsertarUsuario (
    IN p_nombre VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_contrasenia VARCHAR(255),
    IN p_rol VARCHAR(50),
    IN p_saldo DECIMAL(10,2),
    IN p_moneda VARCHAR(50),
    IN p_estado VARCHAR(50),
    OUT p_id_usuario INT
)
BEGIN
    INSERT INTO Usuarios (nombre, email, contrasenia, rol, saldo, moneda, fecha_creacion, ultimo_acceso, estado)
    VALUES (p_nombre, p_email, p_contrasenia, p_rol, p_saldo, p_moneda, NOW(), now(), p_estado);
    SET p_id_usuario = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarProducto
DROP PROCEDURE IF EXISTS InsertarProducto;

-- Procedure para insertar en Productos
DELIMITER //
CREATE PROCEDURE InsertarProducto (
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_categoria VARCHAR(50),
    IN p_etiquetas VARCHAR(255),
    OUT p_id_producto INT
)
BEGIN
    INSERT INTO Productos (nombre, descripcion, precio, stock, categoria, etiquetas)
    VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_categoria, p_etiquetas);
    SET p_id_producto = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarTransaccion
DROP PROCEDURE IF EXISTS InsertarTransaccion;

-- Procedure para insertar en Transacciones_Tradeo
DELIMITER //
CREATE PROCEDURE InsertarTransaccion (
    IN p_id_vendedor INT,
    IN p_id_comprador INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_estado VARCHAR(50),
    OUT p_id_transaccion INT
)
BEGIN
    INSERT INTO Transacciones_Tradeo (id_vendedor, id_comprador, id_producto, cantidad, precio_unitario, fecha, estado)
    VALUES (p_id_vendedor, p_id_comprador, p_id_producto, p_cantidad, p_precio_unitario, NOW(), p_estado);
    SET p_id_transaccion = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarInteraccion
DROP PROCEDURE IF EXISTS InsertarInteraccion;

-- Procedure para insertar en Interacciones
DELIMITER //
CREATE PROCEDURE InsertarInteraccion (
    IN p_id_usuario1 INT,
    IN p_id_usuario2 INT,
    IN p_id_tipo_interaccion INT,
    IN p_contenido TEXT,
    OUT p_id_interaccion INT
)
BEGIN
    INSERT INTO Interacciones (id_usuario1, id_usuario2, id_tipo_interaccion, contenido, fecha)
    VALUES (p_id_usuario1, p_id_usuario2, p_id_tipo_interaccion, p_contenido, NOW());
    SET p_id_interaccion = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarTipoInteraccion
DROP PROCEDURE IF EXISTS InsertarTipoInteraccion;

-- Procedure para insertar en Tipos_Interaccion
DELIMITER //
CREATE PROCEDURE InsertarTipoInteraccion (
    IN p_descripcion VARCHAR(50),
    OUT p_id_tipo_interaccion INT
)
BEGIN
    INSERT INTO Tipos_Interaccion (descripcion)
    VALUES (p_descripcion);
    SET p_id_tipo_interaccion = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarMovimientoBilletera
DROP PROCEDURE IF EXISTS InsertarMovimientoBilletera;

-- Procedure para insertar en Movimientos_Billetera
DELIMITER //
CREATE PROCEDURE InsertarMovimientoBilletera (
    IN p_id_usuario INT,
    IN p_monto DECIMAL(10,2),
    IN p_id_tipo_movimiento INT,
    OUT p_id_movimiento INT
)
BEGIN
    INSERT INTO Movimientos_Billetera (id_usuario, monto, id_tipo_movimiento, fecha)
    VALUES (p_id_usuario, p_monto, p_id_tipo_movimiento, NOW());
    SET p_id_movimiento = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarTipoMovimiento
DROP PROCEDURE IF EXISTS InsertarTipoMovimiento;

-- Procedure para insertar en Tipos_Movimiento
DELIMITER //
CREATE PROCEDURE InsertarTipoMovimiento (
    IN p_descripcion VARCHAR(50),
    OUT p_id_tipo_movimiento INT
)
BEGIN
    INSERT INTO Tipos_Movimiento (descripcion)
    VALUES (p_descripcion);
    SET p_id_tipo_movimiento = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarSeguridad
DROP PROCEDURE IF EXISTS InsertarSeguridad;

-- Procedure para insertar en Seguridad
DELIMITER //
CREATE PROCEDURE InsertarSeguridad (
    IN p_id_usuario INT,
    IN p_id_tipo_evento INT,
    IN p_descripcion TEXT,
    OUT p_id_seguridad INT
)
BEGIN
    INSERT INTO Seguridad (id_usuario, id_tipo_evento, descripcion, fecha)
    VALUES (p_id_usuario, p_id_tipo_evento, p_descripcion, NOW());
    SET p_id_seguridad = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarTipoEvento
DROP PROCEDURE IF EXISTS InsertarTipoEvento;

-- Procedure para insertar en Tipos_Evento
DELIMITER //
CREATE PROCEDURE InsertarTipoEvento (
    IN p_descripcion VARCHAR(50),
    OUT p_id_tipo_evento INT
)
BEGIN
    INSERT INTO Tipos_Evento (descripcion)
    VALUES (p_descripcion);
    SET p_id_tipo_evento = LAST_INSERT_ID();
END//
DELIMITER ;

-- Drop Procedure para InsertarActividad
DROP PROCEDURE IF EXISTS InsertarActividad;

-- Procedure para insertar en Actividades
DELIMITER //
CREATE PROCEDURE InsertarActividad (
    IN p_id_usuario INT,
    IN p_actividad VARCHAR(255),
    OUT p_id_actividad INT
)
BEGIN
    INSERT INTO Actividades (id_usuario, actividad, fecha)
    VALUES (p_id_usuario, p_actividad, NOW());
    SET p_id_actividad = LAST_INSERT_ID();
END//
DELIMITER ;
