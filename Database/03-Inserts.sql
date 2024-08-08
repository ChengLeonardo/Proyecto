use 5to_7maTest;
INSERT INTO Usuarios(nombre, email, contrasenia, rol, saldo, moneda, fecha_creacion, ultimo_acceso, estado)
VALUES("leo", "leo@ga", "asdf", "fasdf", 123, "ars", now(), now(), "test"),
("le", "leo@g", "asd", "fasd", 123, "ars", now(), now(), "test");
CALL InsertarUsuario('Juan', 'juan@example.com', 'hashed_password', 'usuario_comun', 0, 'nose', 'enlinea', @id_usuario);
SELECT @id_usuario;
