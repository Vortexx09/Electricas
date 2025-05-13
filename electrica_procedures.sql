-- Procedimiento para agrega un usuario nuevo con lo básico:
CREATE OR REPLACE PROCEDURE registrar_usuario_simple(
    IN p_nombre VARCHAR,
    IN p_apellido VARCHAR,
    IN p_email VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO usuarios(nombre, apellido, email)
    VALUES (p_nombre, p_apellido, p_email);
END;
$$;

-- Procedimiento para crea un incidente
CREATE OR REPLACE PROCEDURE registrar_incidente_basico(
    IN p_patineta_id INT,
    IN p_tipo_incidente VARCHAR,
    IN p_descripcion TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO incidentes(patineta_id, tipo_incidente, descripcion)
    VALUES (p_patineta_id, p_tipo_incidente, p_descripcion);
END;
$$;

-- Procedimiento para iniciar un nuevo alquiler
CREATE OR REPLACE PROCEDURE iniciar_nuevo_alquiler(
    IN u_usuario_id INT,
	IN p_patineta_id INT,
	IN t_tarifa_id INT,
	IN m_metodo_pago_id INT,
	IN e_estado_alquiler_id INT,
	IN ub_ubicacion_inicio_lat DECIMAL,
	IN ub_ubicacion_inicio_lon DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
	IF NOT disponibilidad_patineta(p_patineta_id) THEN
		RAISE EXCEPTION 'La patineta no está disponible';
	END IF;
	
	INSERT INTO 
		alquileres (
			usuario_id, 
			patineta_id, 
			tarifa_id, 
			metodo_pago_id, 
			estado_alquiler_id, 
			ubicacion_inicio_lat,
			ubicacion_inicio_lon
		)
	VALUES (
		u_usuario_id,
		p_patineta_id,
		t_tarifa_id,
		m_metodo_pago_id,
		e_estado_alquiler_id,
		ub_ubicacion_inicio_lat,
		ub_ubicacion_inicio_lon
	);
END;
$$;

-- Procedimiento para finalizar un alquiler
CREATE OR REPLACE PROCEDURE finalizar_alquiler(
	IN a_alquiler_id INT,
	IN ub_ubicacion_fin_lat DECIMAL,
	IN ub_ubicacion_fin_lon DECIMAL,
	IN e_estado_alquiler_id INT
)
LANGUAGE plpgsql
AS $$ 
DECLARE 
	fecha_fin TIMESTAMP := CURRENT_TIMESTAMP;
	costo_total_var INT;
BEGIN 
	SELECT costo_alquiler_tiempo_real(p_alquiler_id) INTO costo_total_var;
	UPDATE alquileres 
	SET 
		fecha_hora_fin = fecha_fin,
		ubicacion_fin_lat = ub_ubicacion_fin_lat,
		ubicacion_fin_lon = ub_ubicacion_fin_lon,
		costo_total = costo_total_var,
		duracion_minutos = CEIL(EXTRACT (EPOCH FROM (fecha_fin - fecha_hora_inicio)) / 60),
		estado_alquiler_id = e_estado_alquiler_id
	WHERE alquiler_id = a_alquiler_id;
END;
$$;

-- Procedimiento para registrar mantenimiento preventivo
CREATE OR REPLACE PROCEDURE registrar_mantenimiento_preventivo(
	IN p_patineta_id INT,
	IN u_usuario_tecnico_id INT,
	IN d_descripcion TEXT,
	IN c_costo DECIMAL
)
LANGUAGE plpgsql
AS $$
DECLARE
	tipo_usuario VARCHAR;
BEGIN
	SELECT t.nombre INTO tipo_usuario 
	FROM usuarios u
	JOIN tipos_usuario t
		ON u.tipo_usuario_id = t.tipo_usuario_id 
	WHERE u.usuario_id = u_usuario_tecnico_id;

	-- Validar si es técnico
	IF tipo_usuario != 'Técnico'
	THEN
		RAISE EXCEPTION 'El usuario no es un técnico';
	END IF;

	INSERT INTO mantenimientos (
		patineta_id, 
		usuario_tecnico_id, 
		tipo_mantenimiento, 
		fecha_hora_inicio, 
		descripcion, 
		costo)
	VALUES (
		p_patineta_id,
		u_usuario_tecnico_id,
		'Preventivo',
		CURRENT_TIMESTAMP,
		d_descripcion,
		c_costo
	);
END;
$$;

