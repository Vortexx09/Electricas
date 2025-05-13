-- Tabla de Marcas de patinetas
CREATE TABLE marcas (
	marca_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50),
    fecha_fundacion DATE,
    descripcion TEXT
);

-- Tabla de Modelos de patinetas
CREATE TABLE modelos (
    modelo_id SERIAL PRIMARY KEY,
    marca_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    año_lanzamiento INT,
    peso_kg DECIMAL(5,2) CHECK (peso_kg > 0),
    velocidad_max_kmh DECIMAL(5,2) CHECK (velocidad_max_kmh > 0),
    autonomia_km DECIMAL(6,2) CHECK (autonomia_km > 0),
    potencia_w INT CHECK (potencia_w > 0),
    FOREIGN KEY (marca_id) REFERENCES marcas(marca_id) ON UPDATE CASCADE
);

-- Tabla de Estados de patineta
CREATE TABLE estados_patineta (
    estado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    descripcion TEXT
);

-- Tabla principal de Patinetas
CREATE TABLE patinetas (
    patineta_id SERIAL PRIMARY KEY,
    modelo_id INT NOT NULL,
    estado_id INT NOT NULL,
    codigo_serie VARCHAR(50) NOT NULL,
    fecha_compra DATE,
    precio_compra DECIMAL(10,2) CHECK (precio_compra > 0),
    bateria_actual DECIMAL(5,2)CHECK (bateria_actual >= 0 AND bateria_actual <= 100),
    fecha_ultimo_mantenimiento DATE,
    notas TEXT,
    FOREIGN KEY (modelo_id) REFERENCES modelos(modelo_id) ON UPDATE CASCADE,
    FOREIGN KEY (estado_id) REFERENCES estados_patineta(estado_id) ON UPDATE CASCADE
);
COMMENT ON COLUMN patinetas.bateria_actual IS 'Porcentaje de batería';

-- Tabla de Ubicaciones (se actualiza constantemente)
CREATE TABLE ubicaciones (
    ubicacion_id SERIAL PRIMARY KEY,
    patineta_id INT NOT NULL,
    latitud DECIMAL(10,8) NOT NULL,
    longitud DECIMAL(11,8) NOT NULL,
    fecha_hora_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    velocidad_actual DECIMAL(5,2) CHECK (velocidad_actual >= 0),
    bateria_en_ubicacion DECIMAL(5,2) CHECK (bateria_en_ubicacion >= 0 AND bateria_en_ubicacion <= 100),
    FOREIGN KEY (patineta_id) REFERENCES patinetas(patineta_id) ON UPDATE CASCADE
);
COMMENT ON COLUMN ubicaciones.velocidad_actual IS 'En km/h';

-- Tabla de Tipos de Usuario
CREATE TABLE tipos_usuario (
    tipo_usuario_id SERIAL PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
    descripcion TEXT
);

-- Tabla de Usuarios
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    tipo_usuario_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    direccion TEXT,
    documento_identidad VARCHAR(50) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10,2) DEFAULT 0.00 CHECK (saldo >= 0),
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipos_usuario(tipo_usuario_id) ON UPDATE CASCADE
);

-- Tabla de Métodos de Pago
CREATE TABLE metodos_pago (
    metodo_pago_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla de Tarifas
CREATE TABLE tarifas (
    tarifa_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    costo_por_minuto DECIMAL(6,2) NOT NULL CHECK (costo_por_minuto >= 0),
    costo_desbloqueo DECIMAL(6,2) DEFAULT 0.00 CHECK (costo_desbloqueo >=0),
    descripcion TEXT,
    fecha_inicio_vigencia DATE NOT NULL,
    fecha_fin_vigencia DATE
);

-- Tabla de Estados de Alquiler
CREATE TABLE estados_alquiler (
    estado_alquiler_id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    descripcion TEXT
);

-- Tabla principal de Alquileres
CREATE TABLE alquileres (
    alquiler_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    patineta_id INT NOT NULL,
    tarifa_id INT NOT NULL,
    metodo_pago_id INT NOT NULL,
    estado_alquiler_id INT NOT NULL,
    fecha_hora_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_fin TIMESTAMP,
    ubicacion_inicio_lat DECIMAL(10,8),
    ubicacion_inicio_lon DECIMAL(11,8),
    ubicacion_fin_lat DECIMAL(10,8),
    ubicacion_fin_lon DECIMAL(11,8),
    costo_total DECIMAL(10,2) CHECK (costo_total >= 0),
    distancia_recorrida_km DECIMAL(8,2) CHECK (distancia_recorrida_km >= 0),
    duracion_minutos INT CHECK (duracion_minutos >= 0),
    calificacion_usuario SMALLINT CHECK (calificacion_usuario BETWEEN 1 AND 5),
    comentarios_usuario TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE,
    FOREIGN KEY (patineta_id) REFERENCES patinetas(patineta_id) ON UPDATE CASCADE,
    FOREIGN KEY (tarifa_id) REFERENCES tarifas(tarifa_id) ON UPDATE CASCADE,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago(metodo_pago_id) ON UPDATE CASCADE,
    FOREIGN KEY (estado_alquiler_id) REFERENCES estados_alquiler(estado_alquiler_id) ON UPDATE CASCADE
);
COMMENT ON COLUMN alquileres.calificacion_usuario IS 'De 1 a 5 estrellas';

-- Tabla de Pagos
CREATE TABLE pagos (
    pago_id SERIAL PRIMARY KEY,
    alquiler_id INT NOT NULL,
    metodo_pago_id  INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_hora_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_pago VARCHAR(20) NOT NULL,
    transaccion_id VARCHAR(100),
	FOREIGN KEY (alquiler_id) REFERENCES alquileres(alquiler_id) ON UPDATE CASCADE,
	FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago(metodo_pago_id) ON UPDATE CASCADE
);
COMMENT ON COLUMN pagos.estado_pago IS 'Puede ser: Realizado, Pendiente, Fallido, Cancelado, En Proceso';

-- Tabla de Mantenimientos
CREATE TABLE mantenimientos (
    mantenimiento_id SERIAL PRIMARY KEY,
    patineta_id INT NOT NULL,
    usuario_tecnico_id INT NOT NULL,
    tipo_mantenimiento VARCHAR(50) NOT NULL,
    fecha_hora_inicio TIMESTAMP NOT NULL,
    fecha_hora_fin TIMESTAMP,
    descripcion TEXT,
    costo DECIMAL(10,2),
    repuestos_cambiados TEXT,
    FOREIGN KEY (patineta_id) REFERENCES patinetas(patineta_id) ON UPDATE CASCADE,
    FOREIGN KEY (usuario_tecnico_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE
);

-- Tabla de Incidentes
CREATE TABLE incidentes (
    incidente_id SERIAL PRIMARY KEY,
    patineta_id INT NOT NULL,
    usuario_id INT NOT NULL,
    alquiler_id INT NOT NULL,
    tipo_incidente VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_hora_incidente TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ubicacion_lat DECIMAL(10,8),
    ubicacion_lon DECIMAL(11,8),
    gravedad VARCHAR(20),
    estado VARCHAR(20) DEFAULT 'Reportado',
    acciones_tomadas TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON UPDATE CASCADE,
    FOREIGN KEY (alquiler_id) REFERENCES alquileres(alquiler_id) ON UPDATE CASCADE,
	FOREIGN KEY (patineta_id) REFERENCES patinetas(patineta_id) ON UPDATE CASCADE
);
