DROP DATABASE IF EXISTS juan_db;

CREATE DATABASE IF NOT EXISTS juan_db;

USE juan_db;

-- Tablas primarias
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

-- Tablas dependientes de otras
CREATE TABLE
  clientes (
    id INT (9) AUTO_INCREMENT,
    id_telefono INT (8),
    nombre VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_id_cliente PRIMARY KEY (id),
    CONSTRAINT fk_id_telefono FOREIGN KEY (id_telefono) REFERENCES telefonos (id),
    CONSTRAINT uk_email_clientes UNIQUE (email)
  );

CREATE TABLE
  conductores (
    id VARCHAR(20),
    id_telefono INT (8),
    nombre VARCHAR(100),
    CONSTRAINT pk_id_conductor PRIMARY KEY (id),
    CONSTRAINT fk_id_telefono_conductor FOREIGN KEY (id_telefono) REFERENCES telefonos (id)
  );

CREATE TABLE
  auxiliares (
    id INT (8) AUTO_INCREMENT,
    id_telefono INT (8),
    nombre VARCHAR(100),
    CONSTRAINT pk_id_auxiliar PRIMARY KEY (id),
    CONSTRAINT fk_id_telefono_auxiliar FOREIGN KEY (id_telefono) REFERENCES telefonos (id)
  );

CREATE TABLE
  paquetes (
    id INT (9) AUTO_INCREMENT,
    id_tipo_servicio INT (3),
    peso DECIMAL(10, 2),
    dimensiones VARCHAR(50),
    contenido TEXT,
    valor_declarado DECIMAL(10, 2),
    CONSTRAINT pk_id_paquete PRIMARY KEY (id),
    CONSTRAINT fk_id_tipo_servicio_paquete FOREIGN KEY (id_tipo_servicio) REFERENCES tipos_servicios (id)
  );

CREATE TABLE
  seguimientos (
    id INT (9) AUTO_INCREMENT,
    id_paquete INT (9),
    id_estado INT (3),
    ubicacion VARCHAR(200),
    fecha_hora TIMESTAMP,
    CONSTRAINT pk_id_seguimientos PRIMARY KEY (id),
    CONSTRAINT fk_id_paquete_seguimiento FOREIGN KEY (id_paquete) REFERENCES paquetes (id),
    CONSTRAINT fk_id_estado_seguimiento FOREIGN KEY (id_estado) REFERENCES estados_seguimientos (id)
  );

CREATE TABLE
  ciudades (
    id INT (8) AUTO_INCREMENT,
    id_pais INT (4),
    nombre VARCHAR(100),
    CONSTRAINT pk_id_ciudad PRIMARY KEY (id),
    CONSTRAINT fk_id_pais_ciudad FOREIGN KEY (id_pais) REFERENCES paises (id)
  );

CREATE TABLE
  direcciones (
    id INT (11) AUTO_INCREMENT,
    description TEXT,
    id_ciudad INT (8),
    id_cliente INT (9),
    CONSTRAINT pk_id_direcciones PRIMARY KEY (id),
    CONSTRAINT fk_id_cliente_direccione FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    CONSTRAINT fk_id_ciudad_direccion FOREIGN KEY (id_ciudad) REFERENCES ciudades (id)
  );

CREATE TABLE
  sucursales (
    id INT (8) AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_direccion INT (11),
    CONSTRAINT pk_id_sucursal PRIMARY KEY (id),
    CONSTRAINT fk_id_direccion_sucursal FOREIGN KEY (id_direccion) REFERENCES direcciones (id)
  );

-- Modificar en ERD
CREATE TABLE
  rutas (
    id INT (8) AUTO_INCREMENT,
    descripcion VARCHAR(200),
    id_sucursal_salida INT (8),
    id_sucursal_llegada INT (8),
    CONSTRAINT pk_id_ruta PRIMARY KEY (id),
    CONSTRAINT fk_id_sucursal_salida_ruta FOREIGN KEY (id_sucursal_salida) REFERENCES sucursales (id),
    CONSTRAINT fk_id_sucursal_llegada_ruta FOREIGN KEY (id_sucursal_llegada) REFERENCES sucursales (id)
  );

CREATE TABLE
  auxiliares_rutas (
    id_ruta INT (8),
    id_auxiliar INT (8),
    CONSTRAINT pk_composite_id_auxiliar_ruta PRIMARY KEY (id_ruta, id_auxiliar),
    CONSTRAINT fk_id_ruta_auxiliar_ruta FOREIGN KEY (id_ruta) REFERENCES rutas (id),
    CONSTRAINT fk_id_auxiliar_auxiliar_ruta FOREIGN KEY (id_auxiliar) REFERENCES auxiliares (id)
  );

CREATE TABLE
  modelos (
    id INT (8) AUTO_INCREMENT,
    id_marca INT (8),
    id_tipo_vehiculo INT (3),
    name VARCHAR(40),
    CONSTRAINT pk_id_modelo PRIMARY KEY (id),
    CONSTRAINT fk_id_marca_modelo FOREIGN KEY (id_marca) REFERENCES marcas (id),
    CONSTRAINT fk_id_tipo_vehiculo_modelo FOREIGN KEY (id_tipo_vehiculo) REFERENCES tipos_vehiculos (id)
  );

CREATE TABLE
  vehiculos (
    id INT (8) AUTO_INCREMENT,
    placa VARCHAR(20),
    id_modelo INT (8),
    capacidad_carga DECIMAL(10, 2),
    id_sucursal INT (8),
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (id),
    CONSTRAINT fk_id_modelo_vehiculo FOREIGN KEY (id_modelo) REFERENCES modelos (id),
    CONSTRAINT fk_id_sucursal_vehiculo FOREIGN KEY (id_sucursal) REFERENCES sucursales (id),
    CONSTRAINT uk_placa_vehiculo UNIQUE (placa)
  );

CREATE TABLE
  conductores_rutas (
    id INT (11) AUTO_INCREMENT,
    id_conductor VARCHAR(20),
    id_ruta INT (8),
    id_vehiculo INT (8),
    id_sucursal INT (8),
    CONSTRAINT pk_id_conductor_ruta PRIMARY KEY (id),
    CONSTRAINT fk_conductor_conductor_ruta FOREIGN KEY (id_conductor) REFERENCES conductores (id),
    CONSTRAINT fk_ruta_conductor_ruta FOREIGN KEY (id_ruta) REFERENCES rutas (id),
    CONSTRAINT fk_vehiculo_conductor_ruta FOREIGN KEY (id_vehiculo) REFERENCES vehiculos (id),
    CONSTRAINT fk_sucursal_conductor_ruta FOREIGN KEY (id_sucursal) REFERENCES sucursales (id)
  );

CREATE TABLE
  envios (
    id INT (9) AUTO_INCREMENT,
    id_cliente INT (9),
    id_paquete INT (9),
    fecha_envio DATE,
    destino VARCHAR(200),
    id_ruta INT (8),
    id_sucursal INT (8),
    estado VARCHAR(20),
    CONSTRAINT pk_id_envio PRIMARY KEY (id),
    CONSTRAINT fk_id_cliente_envio FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    CONSTRAINT fk_id_paquete_envio FOREIGN KEY (id_paquete) REFERENCES paquetes (id),
    CONSTRAINT fk_id_ruta_envio FOREIGN KEY (id_ruta) REFERENCES rutas (id),
    CONSTRAINT fk_id_sucursal_envio FOREIGN KEY (id_sucursal) REFERENCES sucursales (id)
  );