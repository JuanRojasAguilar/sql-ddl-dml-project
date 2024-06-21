INSERT INTO
  paises (nombre)
VALUES
  ('Burundi'),
  ('Brazil'),
  ('Bosnia and Herzegovina'),
  ('Bhutan'),
  ('Belize'),
  ('Benin'),
  ('Bahrain'),
  ('Bangladesh'),
  ('Barbados'),
  ('Austria'),
  ('Australia'),
  ('Angola'),
  ('Algeria'),
  ('Albania'),
  ('Zimbabwe'),
  ('Yemen'),
  ('Venezuela'),
  ('Vietnam'),
  ('Uruguay'),
  ('Tunisia'),
  ('Trinidad and Tobago'),
  ('Togo'),
  ('Thailand'),
  ('Swaziland'),
  ('Sweden'),
  ('Spain'),
  ('Slovakia'),
  ('Slovenia'),
  ('Solomon Islands'),
  ('Somalia'),
  ('Colombia');

INSERT INTO
  ciudades (id_pais, nombre)
VALUES
  (1, 'Gitega'),
  (2, 'São Paulo'),
  (3, 'Sarajevo'),
  (4, 'Thimphu'),
  (5, 'Belize City'),
  (6, 'Porto-Novo'),
  (7, 'Manama'),
  (8, 'Dhaka'),
  (9, 'Bridgetown'),
  (10, 'Vienna'),
  (11, 'Perth'),
  (12, 'Luanda'),
  (13, 'Algiers'),
  (14, 'Tirana'),
  (15, 'Harare'),
  (16, 'Sanaa'),
  (17, 'Caracas'),
  (18, 'Hanoi'),
  (19, 'Montevideo'),
  (20, 'Tunis'),
  (21, 'Port of Spain'),
  (22, 'Lomé'),
  (23, 'Bangkok'),
  (24, 'Mbabane'),
  (25, 'Stockholm'),
  (26, 'Madrid'),
  (27, 'Bratislava'),
  (28, 'Ljubljana'),
  (29, 'Honiara'),
  (30, 'Mogadishu'),
  (1, 'Ngozi'),
  (2, 'Curitiba'),
  (3, 'Mostar'),
  (4, 'Punakha'),
  (5, 'Corozal'),
  (6, 'Cotonou'),
  (7, 'Muharraq'),
  (8, 'Chittagong'),
  (9, 'Speightstown'),
  (10, 'Graz'),
  (11, 'Melbourne'),
  (12, 'Huambo'),
  (13, 'Oran'),
  (14, 'Vlorë'),
  (15, 'Bulawayo'),
  (16, 'Aden'),
  (17, 'Maracaibo'),
  (18, 'Ho Chi Minh City'),
  (19, 'Punta del Este'),
  (20, 'Sfax'),
  (21, 'San Fernando'),
  (22, 'Atakpamé'),
  (23, 'Chiang Mai'),
  (24, 'Manzini'),
  (25, 'Gothenburg'),
  (26, 'Valencia'),
  (27, 'Košice'),
  (28, 'Celje'),
  (29, 'Auki'),
  (30, 'Hargeisa'),
  (1, 'Rumonge'),
  (2, 'Florianópolis'),
  (3, 'Tuzla'),
  (4, 'Wangdue Phodrang'),
  (5, 'Dangriga'),
  (6, 'Parakou'),
  (7, 'Riffa'),
  (8, 'Sylhet'),
  (9, 'Oistins'),
  (10, 'Linz'),
  (11, 'Hobart'),
  (12, 'Lubango'),
  (13, 'Constantine'),
  (14, 'Sarandë'),
  (15, 'Mutare'),
  (16, 'Taiz'),
  (17, 'Barquisimeto'),
  (18, 'Da Nang'),
  (20, 'Kairouan'),
  (21, 'Princes Town'),
  (22, 'Kpalimé'),
  (23, 'Udon Thani'),
  (24, 'Mhlume'),
  (25, 'Malmö'),
  (26, 'Zaragoza'),
  (27, 'Prešov'),
  (28, 'Novo Mesto'),
  (29, 'Honiara'),
  (30, 'Berbera'),
  (31, 'Bucaramanga');

CREATE PROCEDURE generate_random_celphone () BEGIN DECLARE counter INT DEFAULT 1;
DECLARE random_celphone BIGINT DEFAULT 0;
WHILE counter <= 300 DO
SET
  random_celphone = FLOOR(RAND () * 100000000000) + UUID_SHORT ();
INSERT INTO
  telefonos (numero)
VALUES
  (random_celphone);
SET
  counter = counter + 1;
END WHILE;
END;
CALL generate_random_celphone ();

INSERT INTO
  tipos_servicios (nombre)
VALUES
  ('Nacional'),
  ('Internacional'),
  ('Express'),
  ('Estandar');

INSERT INTO
  estados_seguimientos (nombre)
VALUES
  ('Recibido'),
  ('En Transito'),
  ('Retenido en aduana');

INSERT INTO
  marcas (nombre)
VALUES
  ('Toyota'),
  ('Harley-Davidson'),
  ('Bayliner'),
  ('Ford'),
  ('Yamaha'),
  ('Sea-Doo'),
  ('Chevrolet'),
  ('Kawasaki'),
  ('MasterCraft'),
  ('Honda'),
  ('Suzuki'),
  ('Mercedes-Benz'),
  ('BMW'),
  ('Polaris'),
  ('Ferrari'),
  ('Lamborghini'),
  ('Porsche'),
  ('Volkswagen'),
  ('Nissan'),
  ('Mazda'),
  ('Hyundai'),
  ('Kia'),
  ('Ducati'),
  ('Triumph'),
  ('Aprilia'),
  ('Mitsubishi'),
  ('Jeep'),
  ('Land Rover'),
  ('Audi'),
  ('Volvo'),
  ('Scania'),
  ('MAN'),
  ('Iveco'),
  ('Renault'),
  ('Peugeot'),
  ('Citroen'),
  ('Skoda'),
  ('Seat'),
  ('Chrysler'),
  ('Dodge'),
  ('Ram'),
  ('GMC'),
  ('Buick'),
  ('Cadillac'),
  ('Lincoln'),
  ('Mercury'),
  ('Fiat'),
  ('Alfa Romeo'),
  ('Maserati'),
  ('Lancia'),
  ('Jaguar'),
  ('Land Rover'),
  ('Aston Martin'),
  ('Bentley'),
  ('Rolls-Royce'),
  ('Mini'),
  ('Smart'),
  ('Tesla'),
  ('Riviera'),
  ('Regal'),
  ('Sea Ray'),
  ('Boston Whaler'),
  ('Grady-White'),
  ('Hatteras'),
  ('Azimut'),
  ('Sunseeker'),
  ('Ferretti'),
  ('Riva'),
  ('Princess'),
  ('Jeanneau'),
  ('Beneteau'),
  ('Hunter'),
  ('Catalina'),
  ('J/Boats'),
  ('Bennington'),
  ('Regal'),
  ('Chaparral'),
  ('Cobalt'),
  ('Malibu'),
  ('MasterCraft'),
  ('Supra'),
  ('Moomba'),
  ('Tige'),
  ('Axis'),
  ('Supreme'),
  ('Centurion'),
  ('Ski Nautique'),
  ('Correct Craft'),
  ('Boston Whaler'),
  ('Grady-White'),
  ('Hatteras'),
  ('Azimut'),
  ('Sunseeker'),
  ('Ferretti'),
  ('Riva'),
  ('Princess'),
  ('Jeanneau'),
  ('Beneteau'),
  ('Hunter'),
  ('Catalina'),
  ('J/Boats'),
  ('Bennington'),
  ('Regal'),
  ('Chaparral'),
  ('Cobalt'),
  ('Malibu'),
  ('MasterCraft'),
  ('Supra'),
  ('Moomba'),
  ('Tige'),
  ('Axis'),
  ('Supreme'),
  ('Centurion'),
  ('Ski Nautique'),
  ('Correct Craft');

INSERT INTO
  tipos_vehiculos (nombre)
VALUES
  ('Avion'),
  ('Barco'),
  ('Camion Doble Troque'),
  ('Camion de reparto'),
  ('Moto de reparto');

INSERT INTO
  clientes (id_telefono, nombre, email)
VALUES
  (14, 'Ana García', 'ana.garcia@example.com'),
  (27, 'Juan Pérez', 'juan.perez@example.com'),
  (
    31,
    'María Rodríguez',
    'aria.rodriguez@example.com'
  ),
  (42, 'Pedro Sánchez', 'pedro.sanchez@example.com'),
  (53, 'Sofía Gómez', 'ofia.gomez@example.com'),
  (61, 'Luisa Díaz', 'luisa.diaz@example.com'),
  (
    67,
    'Carlos Martínez',
    'carlos.martinez@example.com'
  ),
  (73, 'Rocío López', 'rocio.lopez@example.com'),
  (79, 'Miguel Álvarez', 'iguel.alvarez@example.com'),
  (
    85,
    'Elena González',
    'elena.gonzalez@example.com'
  ),
  (
    91,
    'Cristina Hernández',
    'cristina.hernandez@example.com'
  ),
  (
    97,
    'Alejandro Torres',
    'alejandro.torres@example.com'
  ),
  (103, 'Laura Moreno', 'laura.moreno@example.com'),
  (
    109,
    'Francisco Jiménez',
    'francisco.jimenez@example.com'
  ),
  (
    115,
    'Sandra Gutiérrez',
    'andra.gutierrez@example.com'
  ),
  (
    121,
    'Daniel Sánchez',
    'daniel.sanchez@example.com'
  ),
  (127, 'Verónica Díaz', 'eronica.diaz@example.com'),
  (133, 'Iván García', 'ivan.garcia@example.com'),
  (
    139,
    'María José Martínez',
    'ariajose.martinez@example.com'
  ),
  (145, 'Javier López', 'javier.lopez@example.com'),
  (151, 'Carmen Pérez', 'carmen.perez@example.com'),
  (
    157,
    'Rafael Álvarez',
    'rafael.alvarez@example.com'
  ),
  (163, 'Eva González', 'eva.gonzalez@example.com'),
  (
    169,
    'Juan Carlos Gómez',
    'juancarlos.gomez@example.com'
  ),
  (
    175,
    'Luisa Rodríguez',
    'luisa.rodriguez@example.com'
  ),
  (
    181,
    'Marta Hernández',
    'arta.hernandez@example.com'
  ),
  (187, 'Pablo Torres', 'pablo.torres@example.com'),
  (193, 'Sofía Sánchez', 'ofia.sanchez@example.com'),
  (
    199,
    'Cristina Moreno',
    'cristina.moreno@example.com'
  ),
  (
    205,
    'Francisco Jiménez',
    'francisco.jimenez@example.com'
  );

INSERT INTO
  conductores (id_telefono, nombre)
VALUES
  (214, 'Juan Pérez'),
  (227, 'Carlos Martínez'),
  (231, 'Alejandro Torres'),
  (242, 'Miguel Álvarez'),
  (253, 'Francisco Jiménez'),
  (261, 'Rafael Álvarez'),
  (267, 'Javier López'),
  (273, 'Pablo Torres'),
  (279, 'Daniel Sánchez'),
  (285, 'Iván García'),
  (291, 'Luis Gómez'),
  (297, 'Sergio Hernández'),
  (103, 'Mario González'),
  (109, 'Fernando Díaz'),
  (115, 'Cristóbal Moreno'),
  (11, 'Álvaro Rodríguez'),
  (17, 'Eduardo Sánchez'),
  (13, 'Gabriel López'),
  (19, 'Héctor Gutiérrez'),
  (15, 'María José Martínez');

INSERT INTO
  auxiliares (id_telefono, nombre)
VALUES
  (141, 'Tomás García'),
  (147, 'Adrián Pérez'),
  (153, 'Julio Sánchez'),
  (159, 'Óscar Martínez'),
  (165, 'Enrique López'),
  (171, 'Rubén Álvarez'),
  (177, 'David Gómez'),
  (183, 'Félix Hernández'),
  (189, 'Manuel González'),
  (195, 'César Díaz'),
  (201, 'Jesús Moreno'),
  (207, 'Ramón Rodríguez'),
  (213, 'Vicente Gutiérrez'),
  (219, 'Antonio Torres'),
  (225, 'Luis Miguel Jiménez'),
  (231, 'Pedro José Sánchez'),
  (237, 'Santiago López'),
  (243, 'Miguel Ángel García'),
  (249, 'Jorge Pérez'),
  (255, 'Ignacio Martínez'),
  (261, 'Eduardo Álvarez'),
  (267, 'Gabriel Gómez'),
  (273, 'Cristóbal Hernández'),
  (279, 'Fernando González'),
  (285, 'María del Carmen Díaz'),
  (291, 'Ricardo Moreno'),
  (297, 'Juan Carlos Rodríguez');

INSERT INTO
