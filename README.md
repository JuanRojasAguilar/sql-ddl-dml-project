# sql - ddl - dml project

Juan Diego Rojas Aguilar

## ERD

![Entity Relation Diagram](ERDDiagram.jpg)

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

1. _Un administrador desea registrar un nuevo pais en la base de datos_

   ```
   INSERT INTO paises (nombre) VALUES ('Value1')[,('value2')];
   ```

2. _Un administrador desea agregar una nueva ciudad asociada a un pais existente_

   ```
   INSERT INTO ciudades (nombre,id_pais) VALUES ('nombre_ciudad',id_pais)[,('nombre_ciudad',id_pais)];
   ```

3. _Un administrador desea agregar una nueva sucursar asociada a una ciudad existente_

   Para ingresar una sucursal es importante saber su ubicacion por eso invitamos a ver si ya existe la direccion. En caso contrario, añadirla.

   ```
   INSERT INTO sucursales (nombre, id_ciudad), ('nombre_sucursal', id_direccion)[,('nombre_sucursal', id_direccion)]
   ```

4. _Un administrador desea agregar un cliente a la base de datos_

   Los clientes son entidades que reciben un id_telefono y tambien sus emails son unicos. Los telefonos son nullables entonces puede dejar el campo vacio, usaremos un caso donde este no es asi.

   ```
   INSERT INTO clientes (id_telefono,nombre,email) VALUES (id_telefono,'nombre_completo','email@mail.com');
   ```

5. _Un administrador desea agregar un numero de telefono para un cliente existente_

   ```
   UPDATE clientes SET id_telefono = id_nuevo WHERE id = id_cliente;
   ```

   Aca tambien podriamos usar el email del cliente debido a que es un atributo unico.

6. _Un administrador desea registrar un nuevo paquete en la base de datos_

   Las consideraciones son: id_tipo_servicio

   ```
   INSERT (id_tipo_servicio,peso,dimensiones,contenido,valor_declarado) VALUES (int,string,decimal(10,2),dimensiones,contenido,valor_declarado(10,2));
   ```
