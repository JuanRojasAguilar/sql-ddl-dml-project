CREATE DATABASE IF NOT EXISTS juan_db;

USE juan_db;

CREATE TABLE
  paises (
    id INT (4) AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_id_pais PRIMARY KEY (id)
  );

CREATE TABLE
  ciudades (
    id INT (8) AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_id_ciudad PRIMARY KEY (id)
  );

CREATE TABLE
  sucursales (
    id INT (8) AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200) NOT NULL,
    id_ciudad INT (8),
    CONSTRAINT pk_id_sucursal PRIMARY KEY (id),
    CONSTRAINT fk_id_ciudad_sucursal FOREIGN KEY (id_ciudad) REFERENCES ciudades (id)
  );

CREATE TABLE
  auxiliares (
    id INT (8) AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    CONSTRAINT pk_id_auxiliar PRIMARY KEY (id)
  );

CREATE TABLE
  rutas (
    id INT (8) AUTO_INCREMENT,
    descripcion VARCHAR(200),
    id_sucursal INT (8),
    CONSTRAINT pk_id_ruta PRIMARY KEY (id),
    CONSTRAINT fk_id_sucursal_ruta FOREIGN KEY (id_sucursal) REFERENCES sucursales (id)
  );

CREATE TABLE
  ruta_auxiliares (
    id_ruta INT (8),
    id_auxiliar INT (8),
    CONSTRAINT pk_composite_id_ruta_auxiliar PRIMARY KEY (id_ruta, id_auxiliar),
    CONSTRAINT fk_id_ruta_auxiliar FOREIGN KEY (id_ruta) REFERENCES rutas (id),
    CONSTRAINT fk_id_ruta_auxiliar FOREIGN KEY (id_auxiliar) REFERENCES auxiliares (id),
  );

CREATE TABLE
  vehiculos (
    id int (8) AUTO_INCREMENT,
    placa VARCHAR(20),
    marca VARCHAR(50), --normalizar
    modelo VARCHAR(50), --normalizar
    capacidad_carga DECIMAL(10, 2), --normalizar?
    id_sucursal INT (8),
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (id),
    CONSTRAINT fk_id_sucursal_vehiculo FOREIGN KEY (id_sucursal) REFERENCES sucursales (id)
  );

CREATE TABLE
  conductores (
    id VARCHAR(20) NOT NULL,
    nombre VARCHAR(100),
    CONSTRAINT pk_id_conductor PRIMARY KEY (id)
  );

CREATE TABLE
  telefonos_conductores (
    id INT (8) AUTO_INCREMENT,
    numero VARCHAR(20),
    id_conductor VARCHAR(20),
    CONSTRAINT pk_id_telefono_conductor PRIMARY KEY (id),
    CONSTRAINT fk_id_conductor_telefono_conductor FOREIGN KEY (id_conductor) REFERENCES conductores (id)
  );

CREATE TABLE
  conductores_rutas (
    id_conductor VARCHAR(20),
    id_ruta INT (8),
    id_vehiculo INT (8),
    id_sucursal INT (8),
    CONSTRAINT pk_composite_id_conductor_ruta PRIMARY KEY (id_conductor, id_ruta),
    CONSTRAINT fk_vehiculo_conductor_ruta FOREIGN KEY (id_vehiculo) REFERENCES vehiculos (id),
    CONSTRAINT fk_sucursal_conductor_ruta FOREIGN KEY (id_sucursal) REFERENCES sucursales (id)
  );

CREATE TABLE
  paquetes (
    id INT (9) AUTO_INCREMENT,
    id_seguimiento INT (9),
    peso DECIMAL(10, 2),
    dimensiones VARCHAR(50), --analizar
    contenido TEXT,
    valor_declarado DECIMAL(10, 2),
    tipo_servicio VARCHAR(50), --normalizar?
    estado VARCHAR(50), --normalizar
    CONSTRAINT pk_id_paquete PRIMARY KEY (id)
  );

CREATE TABLE
  seguimientos (
    id INT (9) AUTO_INCREMENT,
    id_paquete INT (9),
    ubicacion VARCHAR(200),
    fecha_hora TIMESTAMP DEFAULT NOW (),
    estado VARCHAR(50) --normalizar x2
  );

CREATE TABLE
  clientes (
    id INT (9) AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    CONSTRAINT pk_id_cliente PRIMARY KEY (id)
  );

CREATE TABLE
  telefonos_clientes (
    id INT (9) AUTO_INCREMENT,
    numero VARCHAR(20),
    id_cliente INT (9),
    CONSTRAINT pk_id_telefono_cliente PRIMARY KEY (id),
    CONSTRAINT fk_id_cliente_telefono_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id)
  );

CREATE TABLE
  envios (
    id INT (9) AUTO_INCREMENT,
    id_cliente INT (9),
    id_paquete INT (9),
    fecha_envio DATE DEFAULT NOW (),
    destino VARCHAR(200), --conectar con ciudad
    id_ruta INT (8),
    id_sucursal INT (8),
    CONSTRAINT pk_id_envio PRIMARY KEY (id),
    CONSTRAINT fk_id_cliente_envio FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    CONSTRAINT fk_id_paquete_envio FOREIGN KEY (id_paquete) REFERENCES paquetes (id),
    CONSTRAINT fk_id_ruta_envio FOREIGN KEY (id_ruta) REFERENCES rutas (id),
    CONSTRAINT fk_id_cliente_envio FOREIGN KEY (id_sucursal) REFERENCES sucursales (id),
  );

ALTER TABLE paquetes ADD FOREIGN KEY (id_seguimiento) REFERENCES seguimientos (id);