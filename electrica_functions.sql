-- Funcion que devuelve el nombre de la marca a partir de su ID:
CREATE OR REPLACE FUNCTION obtener_nombre_marca(mid INT)
RETURNS VARCHAR AS $$
DECLARE
    resultado VARCHAR;
BEGIN
    SELECT nombre INTO resultado FROM marcas WHERE marca_id = mid;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- Funcion que devuelve el número total de alquileres de un usuario:
CREATE OR REPLACE FUNCTION total_alquileres_usuario(uid INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM alquileres WHERE usuario_id = uid;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular el costo de un alquiler en tiempo real
CREATE OR REPLACE FUNCTION costo_alquiler_tiempo_real(p_alquiler_id INT)
RETURNS DECIMAL (10,2) AS $$
DECLARE
	v_fecha_inicio TIMESTAMP;
	v_costo_por_minuto DECIMAL (6,2);
	v_costo_desbloqueo DECIMAL (6,2);
	v_duracion_minutos INT;
	v_costo_total DECIMAL(10,2);
BEGIN
	SELECT
		a.fecha_hora_inicio,
		t.costo_por_minuto,
		t.costo_bloqueo
	INTO
		v_fecha_inicio,
		v_costo_por_minuto,
		v_costo_desbloqueo
	FROM alquileres a
	JOIN tarifas t
		ON a.tarifa_id = t.tarifa_id
	WHERE a.alquiler_id = p_alquiler_id;

	v_duracion_minutos := EXTRACT(EPOCH FROM (NOW() - v_fecha_inicio))/60;
	v_costo_total := v_costo_desbloqueo + (v_duracion_minutos * v_costo_por_minuto);
	RETURN ROUND(v_costo_total, 2);
END
$$ LANGUAGE plpgsql;

-- Función para verificar disponibilidad de una patineta
CREATE OR REPLACE FUNCTION verificar_disponibilidad_patineta(p_patineta_id INT)
RETURNS BOOLEAN AS $$
DECLARE
	disponible BOOLEAN;
BEGIN
	SELECT NOT EXISTS (
		SELECT 1
		FROM alquileres a
		WHERE a.patineta_id = p_patineta_id
		AND a.fecha_hora_fin IS NULL
	) INTO disponible;

	RETURN disponible;
END;
$$ LANGUAGE plpgsql;

