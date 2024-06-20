# sql-ddl-dml-project

Juan Diego Rojas Aguilar

## ERD

![Entity Relation Diagram](ERDDIagram1.png)

#### Tablas primarias

- paises
- telefonos
- estados_seguimientos
- tipos_servicios
- marcas

#### Tablas intermedias

- auxiliares_rutas
- conductores_rutas

## DML queries

1. *Un administrador desea registrar un nuevo pais en la base de datos*
    ```
    INSERT INTO paises (nombre) VALUES ('Value1')[,('value2')];
    ```

2. *Un administrador desea agregar una nueva ciudad asociada a un pais existente*
    ```
    INSERT INTO ciudades (nombre,id_pais) VALUES ('nombre_ciudad',id_pais)[,('nombre_ciudad',id_pais)];
    ```
