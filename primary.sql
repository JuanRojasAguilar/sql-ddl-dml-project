CREATE TABLE
  paises (
    id INT (4) AUTO_INCREMENT,
    nombre VARCHAR(100),
    CONSTRAINT pk_id_pais PRIMARY KEY (id),
    CONSTRAINT uk_nombre_pais UNIQUE (nombre)
  );

CREATE TABLE
  telefonos (
    id INT (8) AUTO_INCREMENT,
    numero VARCHAR(20),
    CONSTRAINT pk_id_telefono PRIMARY KEY (id),
    CONSTRAINT uk_numero_telefono UNIQUE (numero)
  );

CREATE TABLE
  estados_seguimientos (
    id INT (3) AUTO_INCREMENT,
    nombre VARCHAR(50),
    CONSTRAINT pk_id_seguimiento PRIMARY KEY (id)
  );

CREATE TABLE
  tipos_servicios (
    id INT (3) AUTO_INCREMENT,
    nombre VARCHAR(20),
    CONSTRAINT pk_id_tipo_servicio PRIMARY KEY (id)
  );

CREATE TABLE
  tipos_vehiculos (
    id INT (3) AUTO_INCREMENT,
    nombre VARCHAR(50),
    CONSTRAINT pk_id_tipo_vehiculo PRIMARY KEY (id)
  );

CREATE TABLE
  marcas (
    id INT (8) AUTO_INCREMENT,
    nombre VARCHAR(100),
    CONSTRAINT pk_id_marca PRIMARY KEY (id)
  );