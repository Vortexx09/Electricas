-- Consulta de Patinetas Disponibles con su Ubicación Actual
SELECT
	ep.nombre AS estado_patineta,
	u.latitud AS latitud_ubicacion,
	u.longitud AS longitud_ubicacion
FROM estados_patineta ep
	JOIN patinetas p
		ON ep.estado_id = p.estado_id
	JOIN ubicaciones u
		ON p.patineta_id = u.patineta_id
WHERE
	p.estado_id = 1;

-- Consulta de Alquileres Activos con Detalles de Usuario y Patineta
SELECT
	ea.nombre AS estado_alquiler,
	p.codigo_serie AS codigo_patineta,
	p.bateria_actual AS bateria_patineta,
	us.nombre AS nombre_usuario,
	us.apellido AS apellido_usuario,
	us.documento_identidad AS documento_usuario
FROM estados_alquiler ea
	JOIN alquileres a
		ON ea.estado_alquiler_id = a.estado_alquiler_id
	JOIN patinetas p
		ON p.patineta_id = a.patineta_id
	JOIN usuarios us
		ON us.usuario_id = a.usuario_id
WHERE
	ea.nombre = 'Activo';

-- Consulta de Ingresos por Período (Agrupado por Mes)
SELECT
	TO_CHAR(DATE_TRUNC('month', fecha_hora_pago), 'YYYY-MM') AS mes_ingresos,
	SUM(monto) AS total_ingresos
FROM pagos
GROUP BY DATE_TRUNC('month', fecha_hora_pago)
ORDER BY total_ingresos;

-- Consulta de Mantenimientos Pendientes y Patinetas que los Necesitan
SELECT *
FROM mantenimientos
WHERE
	fecha_hora_fin IS NULL;

SELECT *
FROM patinetas
WHERE
	patineta_id NOT IN (
		SELECT 
			patineta_id
		FROM mantenimientos
	);

-- Consulta de Uso por Patineta (Top 10 más utilizadas)
SELECT
	p.patineta_id AS id_patineta,
	p.codigo_serie AS codigo_patineta,
	SUM(a.distancia_recorrida_km)
FROM alquileres a
	JOIN patinetas p
		ON a.patineta_id = p.patineta_id
WHERE
	a.fecha_hora_fin IS NOT NULL
GROUP BY p.patineta_id, p.codigo_serie
ORDER BY SUM(a.distancia_recorrida_km) DESC;

