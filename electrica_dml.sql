-- Insertar estados básicos de patinetas
INSERT INTO estados_patineta (nombre, descripcion) VALUES 
('Disponible', 'Patineta en buen estado y disponible para alquiler'),
('En uso', 'Patineta actualmente alquilada'),
('Mantenimiento', 'Patineta en reparación o mantenimiento'),
('Inactiva', 'Patineta no disponible por algún motivo');

-- Insertar tipos de usuario básicos
INSERT INTO tipos_usuario (nombre, descripcion) VALUES 
('Cliente', 'Usuario regular que alquila patinetas'),
('Técnico', 'Personal encargado de mantenimiento'),
('Administrador', 'Personal con acceso completo al sistema');

-- Insertar métodos de pago comunes
INSERT INTO metodos_pago (nombre, descripcion) VALUES 
('Tarjeta Crédito', 'Pago con tarjeta de crédito'),
('Tarjeta Débito', 'Pago con tarjeta de débito'),
('PayPal', 'Pago a través de PayPal'),
('Transferencia', 'Transferencia bancaria');

-- Insertar estados de alquiler
INSERT INTO estados_alquiler (nombre, descripcion) VALUES 
('Activo', 'Alquiler en curso'),
('Completado', 'Alquiler finalizado correctamente'),
('Cancelado', 'Alquiler cancelado por el usuario'),
('Problema', 'Alquiler con algún problema reportado');

-- Insertar valores de marcas
INSERT INTO marcas (nombre, pais_origen, fecha_fundacion, descripcion) VALUES
('Xiaomi', 'China', '2010-04-06', 'Tecnología y movilidad urbana'),
('Segway', 'EE.UU.', '1999-12-03', 'Innovación en transporte personal'),
('Ninebot', 'China', '2012-06-01', 'Subsidiaria de Segway, especializada en movilidad eléctrica'),
('Razor', 'EE.UU.', '2000-01-01', 'Fabricante de scooters y patinetas'),
('Inokim', 'Israel', '2009-05-15', 'Diseño y rendimiento en scooters eléctricos'),
('E-Twow', 'Rumania', '2013-03-20', 'Scooters eléctricos ligeros y portátiles'),
('Dualtron', 'Corea del Sur', '2015-07-10', 'Scooters de alto rendimiento'),
('Apollo', 'Canadá', '2018-09-25', 'Movilidad urbana sostenible'),
('Unagi', 'EE.UU.', '2017-11-11', 'Scooters eléctricos premium'),
('EcoReco', 'EE.UU.', '2013-08-08', 'Scooters eléctricos ecológicos');

-- Insertar valores de modelos
INSERT INTO modelos (marca_id, nombre, año_lanzamiento, peso_kg, velocidad_max_kmh, autonomia_km, potencia_w) VALUES
(1, 'EcoRide X1', 2020, 12.5, 25.0, 30.0, 350),
(2, 'UrbanScoot Pro', 2019, 13.0, 28.0, 35.0, 400),
(3, 'GreenWheels Eco', 2021, 11.8, 22.0, 40.0, 300),
(4, 'SpeedyGo Max', 2022, 14.2, 30.0, 45.0, 500),
(5, 'VoltRide Slim', 2018, 10.5, 20.0, 25.0, 250),
(6, 'SwiftMove Lite', 2020, 9.8, 18.0, 20.0, 200),
(7, 'RideNow Urban', 2019, 12.0, 24.0, 32.0, 350),
(8, 'E-Motion Z', 2021, 13.5, 27.0, 38.0, 450),
(9, 'ZoomX Speed', 2022, 14.0, 29.0, 42.0, 480),
(10, 'GlideTech S', 2020, 11.0, 23.0, 28.0, 300);

-- Insertar valores de usuarios
INSERT INTO usuarios (tipo_usuario_id, nombre, apellido, email, telefono, fecha_nacimiento, direccion, documento_identidad, saldo, activo) VALUES
(1, 'Carlos', 'Martínez', 'carlos.martinez@example.com', '3001234567', '1990-05-20', 'Calle 10 #5-20', 'CC12345678', 50000.00, TRUE),
(1, 'Laura', 'Gómez', 'laura.gomez@example.com', '3002345678', '1985-08-15', 'Carrera 15 #10-30', 'CC23456789', 30000.00, TRUE),
(1, 'Andrés', 'Pérez', 'andres.perez@example.com', '3003456789', '1992-11-10', 'Avenida 3 #20-15', 'CC34567890', 45000.00, TRUE),
(1, 'María', 'Rodríguez', 'maria.rodriguez@example.com', '3004567890', '1988-02-25', 'Calle 8 #12-40', 'CC45678901', 60000.00, TRUE),
(1, 'Juan', 'López', 'juan.lopez@example.com', '3005678901', '1995-07-30', 'Carrera 7 #14-22', 'CC56789012', 35000.00, TRUE),
(2, 'Pedro', 'Sánchez', 'pedro.sanchez@example.com', '3006789012', '1980-09-05', 'Avenida 6 #18-10', 'CC67890123', 0.00, TRUE),
(2, 'Ana', 'Ramírez', 'ana.ramirez@example.com', '3007890123', '1983-03-12', 'Calle 9 #16-25', 'CC78901234', 0.00, TRUE),
(2, 'Luis', 'Torres', 'luis.torres@example.com', '3008901234', '1978-12-18', 'Carrera 12 #8-30', 'CC89012345', 0.00, TRUE),
(3, 'Sofía', 'Moreno', 'sofia.moreno@example.com', '3009012345', '1991-06-22', 'Avenida 4 #11-35', 'CC90123456', 0.00, TRUE),
(3, 'Diego', 'Hernández', 'diego.hernandez@example.com', '3000123456', '1987-10-08', 'Calle 7 #9-28', 'CC01234567', 0.00, TRUE);

-- Insertar valores de tarifas
INSERT INTO tarifas (nombre, costo_por_minuto, costo_desbloqueo, descripcion, fecha_inicio_vigencia, fecha_fin_vigencia) VALUES
('Tarifa Básica', 0.25, 1.00, 'Tarifa estándar para todos los usuarios', '2024-01-01', NULL),
('Tarifa Premium', 0.20, 1.50, 'Tarifa con beneficios para usuarios premium', '2024-01-01', NULL),
('Tarifa Noche', 0.15, 0.50, 'Tarifa con descuento por uso nocturno', '2024-01-01', NULL),
('Tarifa Fin de Semana', 0.30, 1.00, 'Tarifa para fines de semana', '2024-01-01', NULL),
('Tarifa Estudiante', 0.18, 0.80, 'Descuento especial para estudiantes', '2024-01-01', NULL),
('Tarifa Promocional', 0.10, 0.50, 'Tarifa por promoción temporal', '2024-01-01', '2024-03-01'),
('Tarifa Lluvia', 0.05, 0.00, 'Tarifa para días lluviosos', '2024-01-01', NULL),
('Tarifa Empresa', 0.22, 1.20, 'Tarifa para empleados corporativos', '2024-01-01', NULL),
('Tarifa Recarga', 0.12, 0.60, 'Tarifa para usuarios que recargan saldo frecuentemente', '2024-01-01', NULL),
('Tarifa Inicial', 0.28, 0.90, 'Tarifa aplicada al inicio del servicio', '2024-01-01', NULL);

-- Insertar valores patinetas
INSERT INTO patinetas (modelo_id, estado_id, codigo_serie, fecha_compra, precio_compra, bateria_actual, fecha_ultimo_mantenimiento, notas) VALUES
(1, 1, 'PTN-0001', '2024-01-10', 450.00, 88.5, '2025-04-15', 'Sin novedades'),
(2, 2, 'PTN-0002', '2024-02-20', 470.00, 55.2, '2025-03-10', 'En uso actualmente'),
(3, 1, 'PTN-0003', '2024-03-05', 430.00, 100.0, '2025-05-01', 'Recién cargada'),
(4, 3, 'PTN-0004', '2023-12-18', 400.00, 0.0, '2025-05-10', 'Pendiente de cambio de frenos'),
(5, 1, 'PTN-0005', '2024-05-01', 490.00, 72.8, '2025-04-28', NULL),
(2, 1, 'PTN-0006', '2024-06-15', 460.00, 69.3, '2025-04-01', 'Lista para alquilar'),
(3, 4, 'PTN-0007', '2024-03-30', 410.00, 10.0, '2025-01-10', 'Dada de baja temporalmente'),
(4, 1, 'PTN-0008', '2024-04-10', 480.00, 95.0, '2025-05-05', 'Buen estado'),
(5, 2, 'PTN-0009', '2024-05-05', 500.00, 45.6, '2025-05-06', 'Usuario reportó manejo brusco'),
(1, 1, 'PTN-0010', '2024-05-08', 460.00, 87.9, '2025-05-10', 'Funcionando correctamente');

-- Insertar valores de ubicaciones
INSERT INTO ubicaciones (patineta_id, latitud, longitud, velocidad_actual, bateria_en_ubicacion) VALUES
(1, -12.046374, -77.042793, 0.00, 88.5),
(2, -12.045721, -77.031345, 12.5, 55.2),
(3, -12.050000, -77.030000, 0.00, 100.0),
(4, -12.043333, -77.028889, 0.00, 0.0),
(5, -12.041234, -77.035678, 5.0, 72.8),
(6, -12.048765, -77.040456, 0.0, 69.3),
(7, -12.049999, -77.050000, 0.0, 10.0),
(8, -12.044567, -77.045123, 3.2, 95.0),
(9, -12.042222, -77.044444, 10.8, 45.6),
(10, -12.047890, -77.038764, 0.0, 87.9);

-- Insertar valores de alquileres
INSERT INTO alquileres (usuario_id, patineta_id, tarifa_id, metodo_pago_id, estado_alquiler_id, fecha_hora_inicio, fecha_hora_fin, ubicacion_inicio_lat, ubicacion_inicio_lon, ubicacion_fin_lat, ubicacion_fin_lon, costo_total, distancia_recorrida_km, duracion_minutos, calificacion_usuario, comentarios_usuario)
VALUES
(1, 1, 1, 1, 2, '2025-05-10 08:00:00', '2025-05-10 08:30:00', 10.12345678, -84.12345678, 10.22345678, -84.22345678, 8.50, 4.2, 30, 5, 'Buen servicio'),
(2, 2, 2, 2, 1, '2025-05-11 09:00:00', NULL, 10.12445678, -84.12445678, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 2, '2025-05-09 10:00:00', '2025-05-09 10:20:00', 10.13345678, -84.13345678, 10.14445678, -84.14445678, 6.00, 3.1, 20, 4, 'Todo bien'),
(4, 4, 4, 4, 3, '2025-05-08 11:00:00', '2025-05-08 11:05:00', 10.14345678, -84.14345678, 10.15345678, -84.15345678, 2.00, 0.8, 5, 3, 'Tuve que cancelar'),
(5, 5, 5, 3, 4, '2025-05-07 12:00:00', '2025-05-07 12:30:00', 10.15345678, -84.15345678, 10.16345678, -84.16345678, 8.00, 2.5, 30, 2, 'Problemas con frenos'),
(6, 6, 6, 1, 2, '2025-05-06 13:00:00', '2025-05-06 13:20:00', 10.16345678, -84.16345678, 10.17345678, -84.17345678, 5.00, 1.7, 20, 5, 'Perfecto'),
(7, 7, 7, 2, 2, '2025-05-05 14:00:00', '2025-05-05 14:25:00', 10.17345678, -84.17345678, 10.18345678, -84.18345678, 6.50, 2.9, 25, 5, 'Excelente'),
(8, 8, 8, 4, 2, '2025-05-04 15:00:00', '2025-05-04 15:30:00', 10.18345678, -84.18345678, 10.19345678, -84.19345678, 7.80, 3.6, 30, 4, 'Recomendado'),
(9, 9, 9, 3, 2, '2025-05-03 16:00:00', '2025-05-03 16:20:00', 10.19345678, -84.19345678, 10.20345678, -84.20345678, 6.20, 2.2, 20, 4, 'Buen viaje'),
(10, 10, 10, 1, 2, '2025-05-02 17:00:00', '2025-05-02 17:40:00', 10.20345678, -84.20345678, 10.21345678, -84.21345678, 9.50, 3.9, 40, 5, 'Muy bien');

-- Insertar valores de pagos
INSERT INTO pagos (alquiler_id, metodo_pago_id, monto, estado_pago, transaccion_id)
VALUES
(1, 1, 8.50, 'Realizado', 'TX001'),
(3, 1, 6.00, 'Realizado', 'TX002'),
(4, 4, 2.00, 'Cancelado', 'TX003'),
(5, 3, 8.00, 'Realizado', 'TX004'),
(6, 1, 5.00, 'Realizado', 'TX005'),
(7, 2, 6.50, 'Realizado', 'TX006'),
(8, 4, 7.80, 'Realizado', 'TX007'),
(9, 3, 6.20, 'Realizado', 'TX008'),
(10, 1, 9.50, 'Realizado', 'TX009'),
(2, 2, 0.00, 'Pendiente', 'TX010');

-- Insertar valores de mantenimientos
INSERT INTO mantenimientos (patineta_id, usuario_tecnico_id, tipo_mantenimiento, fecha_hora_inicio, fecha_hora_fin, descripcion, costo, repuestos_cambiados)
VALUES
(1, 10, 'Revisión General', '2025-04-01 08:00:00', '2025-04-01 10:00:00', 'Revisión estándar', 15.00, 'Ninguno'),
(2, 10, 'Cambio de batería', '2025-04-02 09:00:00', '2025-04-02 12:00:00', 'Batería dañada', 50.00, 'Batería'),
(3, 10, 'Ajuste de frenos', '2025-04-03 10:00:00', '2025-04-03 11:30:00', 'Frenos sueltos', 10.00, 'Pastillas de freno'),
(4, 10, 'Limpieza', '2025-04-04 11:00:00', '2025-04-04 12:00:00', 'Mantenimiento preventivo', 5.00, 'Ninguno'),
(5, 10, 'Cambio de llantas', '2025-04-05 12:00:00', '2025-04-05 13:30:00', 'Llantas desgastadas', 20.00, 'Llantas'),
(6, 10, 'Firmware update', '2025-04-06 13:00:00', NULL, 'Actualización pendiente', NULL, NULL),
(7, 10, 'Revisión eléctrica', '2025-04-07 14:00:00', NULL, 'Chequeo de cables', NULL, NULL),
(8, 10, 'Cambio de motor', '2025-04-08 15:00:00', NULL, 'Motor fallando', NULL, 'Motor'),
(9, 10, 'Diagnóstico', '2025-04-09 16:00:00', NULL, 'Diagnóstico general', NULL, NULL),
(10, 10, 'Cambio de luces', '2025-04-10 17:00:00', NULL, 'Luz trasera rota', NULL, 'Luz LED');

-- Insertar valores de incidentes
INSERT INTO incidentes (patineta_id, usuario_id, alquiler_id, tipo_incidente, descripcion, ubicacion_lat, ubicacion_lon, gravedad, estado, acciones_tomadas)
VALUES
(5, 1, 5, 'Frenos', 'Frenos no funcionaron bien', 10.12345678, -84.12345678, 'Media', 'Reportado', 'En espera de revisión'),
(3, 2, 3, 'Golpe', 'Patineta golpeada contra bordillo', 10.12445678, -84.12445678, 'Baja', 'Resuelto', 'Revisión técnica'),
(4, 3, 4, 'Fallo electrónico', 'Pantalla no encendía', 10.13345678, -84.13345678, 'Alta', 'Reportado', 'Pendiente de diagnóstico'),
(6, 4, 6, 'Accidente', 'Colisión con ciclista', 10.14345678, -84.14345678, 'Alta', 'En proceso', 'Investigando'),
(2, 5, 2, 'Problemas de arranque', 'No arrancaba al desbloquear', 10.15345678, -84.15345678, 'Media', 'Resuelto', 'Revisión técnica'),
(7, 6, 7, 'Ruidos extraños', 'Sonido extraño del motor', 10.16345678, -84.16345678, 'Baja', 'Reportado', 'Ninguna aún'),
(1, 7, 1, 'Llanta pinchada', 'Se pinchó la rueda trasera', 10.17345678, -84.17345678, 'Media', 'Resuelto', 'Cambio de llanta'),
(8, 8, 8, 'Pantalla rota', 'Pantalla táctil no respondía', 10.18345678, -84.18345678, 'Alta', 'En proceso', 'Evaluando daño'),
(9, 9, 9, 'Problema GPS', 'No mostraba ubicación', 10.19345678, -84.19345678, 'Baja', 'Reportado', 'Pendiente'),
(10, 10, 10, 'Batería defectuosa', 'Se descargó muy rápido', 10.20345678, -84.20345678, 'Media', 'Resuelto', 'Cambio de batería');


