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
   INSERT INTO sucursales (nombre, id_ciudad), ({nombre_sucursal}, {id_direccion});
   ```

4. _Un administrador desea agregar un cliente a la base de datos_

   Los clientes son entidades que reciben un id_telefono y tambien sus emails son unicos. Los telefonos son nullables entonces puede dejar el campo vacio, usaremos un caso donde este no es asi.

   ```
   INSERT INTO clientes (id_telefono,nombre,email) VALUES ({id_telefono},{nombre_completo},{email@mail.com});
   ```

5. _Un administrador desea agregar un numero de telefono para un cliente existente_

   El telefono tiene que estar registrado por adelantado
   ```
   UPDATE clientes SET id_telefono = {id_nuevo} WHERE id = id_cliente;
   ```

   Aca tambien podriamos usar el email del cliente debido a que es un atributo unico.

6. _Un administrador desea registrar un nuevo paquete en la base de datos_

   Las consideraciones son: id_tipo_servicio

   ```
   INSERT INTO paquetes (id_tipo_servicio,peso,dimensiones,contenido,valor_declarado) VALUES ({id_tipo_servicio},{peso},{dimensiones},{contenido},{valor_declarado});
   ```
7. _Un administrador desea registrar un nuevo envio, asociando un cliente, paquete ruta y sucursal_

   ```
   INSERT INTO paquetes (id_tipo_servicio, peso, dimensiones, contenido, valor_declarado) VALUES ({id_tipo_servicio},{peso});
   INSERT INTO envios (id_cliente,id_paquete, id_ruta) VALUES ({id_cliente},{id_paquete},{id_ruta});
   ```

8. _Registrar un nuevo vehiculo_

    ```
    INSERT INTO vehiculos (id_modelo, id_sucursal, placa, capacidad_carga) VALUES (1, 3, 'EAM57G', '500 kg');
    ```

9. _Registrar un nuevo conductor_

    ```
    INSERT INTO conductores (id, id_telefono, nombre) VALUES (1005337333, 34,'Omar Shakill');
    ```

10. _Registrar un nuevo telefono para un conductor_

    ```
    INSERT INTO telefonos (numero) VALUES ('315888877');
    -- Esto nos permite ver el id del telefono recien añadido
    SELECT id, numero FROM telefonos WHERE numero LIKE '%315888877%';
    UPDATE conductores SET id_telefono = {id} WHERE id = {id_cliente};
    ```
   
11. _Asignar un conductor a una ruta y un vehiculo_

    ```
    INSERT INTO conductores_rutas (id_conductor,id_ruta,id_vehiculo,fecha_viaje) VALUES (2, 6, 1, NOW());
    ```
12. _Registrar un nuevo auxiliar_

    ```
    INSERT INTO auxiliares (id_telefono,nombe) VALUES (99,'Ximena Calderon');
    ```

13. _Asignar una Auxiliar a una ruta_
    ```
    INSERT INTO auxiliares_rutas(id_auxiliar,id_ruta) VALUES (3, 55);
    ```

14. _Registrar un evento de seguimiento para un paquete_

    ```
    INSERT INTO seguimientos(id_paquete,id_estado) VALUES (3, 2);
    ```

15. _Generar un reporte de envios por cliente_

    ```
    SELECT c.id, c.nombre, c.email, GROUP_CONCAT(e.id) AS envios
    FROM clientes AS c 
    INNER JOIN envios AS e ON e.id_cliente = c.id
    GROUP BY c.id, c.nombre, c.email;
    ```

16. _Actualizar el estado de un paquete_

    Esto es debido a que se toma el ultimo estado de seguimiento como el actual.
    ```
    INSERT INTO seguimientos(id_paquete, id_estado) VALUES (1, 1);
    ```

17. _Rastrear la ubicacion actual de un paquete_

    ```
    SELECT p.id, c.nombre, d.descripcion
    FROM paquetes AS p
    INNER JOIN envios AS e ON e.id_paquete = p.id
    INNER JOIN rutas AS r ON r.id = e.id_ruta
    INNER JOIN sucursales AS s ON s.id = r.id_sucursal
    INNER JOIN direcciones AS d ON d.id = s.id_direccion
    INNER JOIN ciudades AS c ON c.id = d.id_ciudad;
    ```

## Casos Multitabla

1. _Obtener informacion completa de envios_

    ```
    SELECT 
        e.id AS envio_id,
        c.email,
        p.contenido,
        r.descripcion AS ruta,
        v.placa,
        m.nombre AS vehiculo,
        s.id AS sucursal,
        e.fecha_orden
    FROM envio AS e
    JOIN clientes AS c ON c.id = e.id_cliente
    JOIN paquetes AS p ON p.id = e.id_paquete
    JOIN rutas AS r ON r.id = e.id_ruta
    JOIN sucursales AS s ON s.id = r.id_sucursal
    JOIN vehiculos AS v ON v.id_sucursal = s.id
    JOIN modelos AS m ON m.id = v.id_modelo;
    ```

2. _Obtener el historial de envios de un cliente_

    ```
    SELECT c.id, c.email, GROUP_CONCAT(e.id), e.fecha_orden
    FROM envios AS e
    RIGHT JOIN clientes AS c ON c.id = e.id_cliente
    WHERE c.id IS NOT NULL
    GROUP BY c.id, c.email, e.fecha_orden;
    ```

3. _Listar conductores y sus rutas asignadas_

    ```
    SELECT c.id, t.numero AS telefono, GROUP_CONCAT(cr_id.ruta)
    FROM conductores AS c 
    LEFT JOIN telefonos AS t ON t.id = c.id_telefono
    LEFT JOIN conductores_rutas AS cr ON cr.id_conductor = c.id
    GROUP BY c.id, t.numero;
    ```

4. _Obtener detalles de rutas y auxiliares asignados_

    ```
    SELECT r.id, s.nombre AS sucursal, r.nombre AS ruta, a.id, a.nombre, t.numero
    FROM rutas AS r 
    INNER JOIN sucursales AS s ON s.id = r.id_sucursal
    JOIN auxiliares_rutas AS ar ON ar.id_ruta = r.id
    INNER JOIN auxiliares AS a ON a.id = ar.id_auxiliar
    LEFT JOIN telefonos AS t ON t.id = a.id_telefono;
    ```

5. _Generar reporte de paquetes por sucursal y estado_

    ```
    SELECT
    ```

