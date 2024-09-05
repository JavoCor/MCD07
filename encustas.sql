-- 1. Clientes Table
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo VARCHAR(100)
);

-- 2. Campañas Table
CREATE TABLE Campañas (
    id SERIAL PRIMARY KEY,
    muestra_n INT,
    margen_error DECIMAL,
    satisfaccion_cliente DECIMAL,
    nombre_campaña VARCHAR(255),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 3. Encuestas Table
CREATE TABLE Encuestas (
    id_encuesta SERIAL PRIMARY KEY,
    tipo VARCHAR(100),
    costo DECIMAL,
    id_campaña INT,
    FOREIGN KEY (id_campaña) REFERENCES Campañas(id)
);

-- 4. Cuestionario Table
CREATE TABLE Cuestionario (
    id_cuestionario SERIAL PRIMARY KEY,
    id_encuesta INT,
    FOREIGN KEY (id_encuesta) REFERENCES Encuestas(id_encuesta)
);

-- 5. Preguntas Table with Disjoint (Category) Implementation
CREATE TABLE Preguntas (
    id_pregunta SERIAL PRIMARY KEY,
    pregunta TEXT NOT NULL,
    id_cuestionario INT,
    category VARCHAR(50) NOT NULL, -- Disjoint category column
    FOREIGN KEY (id_cuestionario) REFERENCES Cuestionario(id_cuestionario),
    CHECK (category IN ('pregunta_caracterizacion', 'pregunta_encuesta')) -- Ensure valid categories
);

-- 6. Respuestas Table
CREATE TABLE Respuestas (
    id_respuesta SERIAL PRIMARY KEY,
    respuesta TEXT NOT NULL,
    id_pregunta INT,
    FOREIGN KEY (id_pregunta) REFERENCES Preguntas(id_pregunta)
);

-- 7. Operadores Table
CREATE TABLE Operadores (
    id_operador SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    calendario DATE,
    costo DECIMAL
);

-- 8. Telefono Table
CREATE TABLE Telefono (
    id_telefono SERIAL PRIMARY KEY,
    datos_contacto TEXT,
    no_llame BOOLEAN,
    id_operador INT,
    FOREIGN KEY (id_operador) REFERENCES Operadores(id_operador)
);

-- 9. Moderadores Table
CREATE TABLE Moderadores (
    id_moderador SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    especialidad VARCHAR(255),
    costo DECIMAL
);

-- 10. Panel Table
CREATE TABLE Panel (
    id_panel SERIAL PRIMARY KEY,
    tipo_incentivo VARCHAR(255),
    monto_incentivo DECIMAL
);

-- 11. Participantes Table
CREATE TABLE Participantes (
    id_participante_panel SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    email VARCHAR(255),
    id_panel INT,
    FOREIGN KEY (id_panel) REFERENCES Panel(id_panel)
);

-- 12. Participa (Focus Group Participation) Table
CREATE TABLE Participa (
    id_part_focus SERIAL PRIMARY KEY,
    datos_personales TEXT,
    id_encuesta_focus_group INT,
    id_panel INT,
    FOREIGN KEY (id_encuesta_focus_group) REFERENCES Encuestas(id_encuesta),
    FOREIGN KEY (id_panel) REFERENCES Panel(id_panel)
);



INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa X', 'Productos de consumo masivo');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa Y', 'Tecnología');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa Z', 'Automotriz');
INSERT INTO Clientes (nombre, tipo) VALUES ('Corporación A', 'Alimentos');
INSERT INTO Clientes (nombre, tipo) VALUES ('Consultora B', 'Servicios');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa C', 'Electrodomésticos');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa D', 'Cosméticos');
INSERT INTO Clientes (nombre, tipo) VALUES ('Corporación E', 'Textil');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa F', 'Hogar y Muebles');
INSERT INTO Clientes (nombre, tipo) VALUES ('Empresa G', 'Servicios Financieros');

INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (1000, 2.5, 85.0, 'Campaña 1', 1);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (500, 3.0, 90.0, 'Campaña 2', 2);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (1500, 2.0, 88.0, 'Campaña 3', 3);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (800, 3.5, 92.0, 'Campaña 4', 4);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (2000, 1.5, 89.0, 'Campaña 5', 5);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (1200, 2.8, 91.0, 'Campaña 6', 6);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (600, 3.2, 87.0, 'Campaña 7', 7);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (1700, 2.1, 93.0, 'Campaña 8', 8);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (1100, 2.9, 86.0, 'Campaña 9', 9);
INSERT INTO Campañas (muestra_n, margen_error, satisfaccion_cliente, nombre_campaña, id_cliente) VALUES (900, 3.0, 94.0, 'Campaña 10', 10);

INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de satisfacción', 10000, 1);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Estudio de mercado', 15000, 2);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de producto', 20000, 3);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de consumo', 8000, 4);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de opinión', 12000, 5);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta telefónica', 6000, 6);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta en línea', 5000, 7);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de prueba de producto', 18000, 8);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta de segmentación', 14000, 9);
INSERT INTO Encuestas (tipo, costo, id_campaña) VALUES ('Encuesta demográfica', 16000, 10);

INSERT INTO Cuestionario (id_encuesta) VALUES (1);
INSERT INTO Cuestionario (id_encuesta) VALUES (2);
INSERT INTO Cuestionario (id_encuesta) VALUES (3);
INSERT INTO Cuestionario (id_encuesta) VALUES (4);
INSERT INTO Cuestionario (id_encuesta) VALUES (5);
INSERT INTO Cuestionario (id_encuesta) VALUES (6);
INSERT INTO Cuestionario (id_encuesta) VALUES (7);
INSERT INTO Cuestionario (id_encuesta) VALUES (8);
INSERT INTO Cuestionario (id_encuesta) VALUES (9);
INSERT INTO Cuestionario (id_encuesta) VALUES (10);

INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Qué tan satisfecho está con el producto?', 1, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cuántas veces ha comprado este producto en los últimos 6 meses?', 2, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cuál es su grupo de edad?', 3, 'pregunta_caracterizacion');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cuál es su género?', 4, 'pregunta_caracterizacion');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Recomendaría este producto a un amigo?', 5, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Con qué frecuencia usa este servicio?', 6, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cómo calificaría la calidad del producto?', 7, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Qué otros productos similares ha usado?', 8, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cuáles son sus principales motivos para elegir este producto?', 9, 'pregunta_encuesta');
INSERT INTO Preguntas (pregunta, id_cuestionario, category) VALUES ('¿Cuál es su nivel de ingresos?', 10, 'pregunta_caracterizacion');

INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Muy satisfecho', 1);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('2-3 veces', 2);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('25-34 años', 3);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Masculino', 4);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Sí, definitivamente', 5);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Una vez al mes', 6);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Excelente', 7);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Marca A, Marca B', 8);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Precio accesible', 9);
INSERT INTO Respuestas (respuesta, id_pregunta) VALUES ('Entre $50,000 y $60,000', 10);

INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 1', '2024-01-01', 150);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 2', '2024-01-02', 200);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 3', '2024-01-03', 250);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 4', '2024-01-04', 180);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 5', '2024-01-05', 300);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 6', '2024-01-06', 120);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 7', '2024-01-07', 170);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 8', '2024-01-08', 220);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 9', '2024-01-09', 190);
INSERT INTO Operadores (nombre, calendario, costo) VALUES ('Operador 10', '2024-01-10', 140);


INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 1234 5678', FALSE, 1);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 2234 5678', TRUE, 2);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 3234 5678', FALSE, 3);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 4234 5678', TRUE, 4);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 5234 5678', FALSE, 5);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 6234 5678', FALSE, 6);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 7234 5678', TRUE, 7);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 8234 5678', FALSE, 8);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 9234 5678', TRUE, 9);
INSERT INTO Telefono (datos_contacto, no_llame, id_operador) VALUES ('+54 9 11 10234 5678', FALSE, 10);

INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador A', 'Sociología', 500);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador B', 'Psicología', 450);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador C', 'Marketing', 600);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador D', 'Economía', 550);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador E', 'Estadística', 520);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador F', 'Antropología', 480);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador G', 'Ciencias Políticas', 470);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador H', 'Gestión de Proyectos', 510);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador I', 'Ciencias Sociales', 530);
INSERT INTO Moderadores (nombre, especialidad, costo) VALUES ('Moderador J', 'Comunicaciones', 490);

INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Cupón de compra', 100);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Descuento en productos', 50);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Tarjeta regalo', 75);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Vale de compra', 120);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Acceso a promociones', 80);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Suscripción premium', 60);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Puntos de fidelidad', 90);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Bonificación', 110);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Crédito para compras', 70);
INSERT INTO Panel (tipo_incentivo, monto_incentivo) VALUES ('Entrada a sorteos', 95);

INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Juan Pérez', 'juan.perez@mail.com', 1);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Ana López', 'ana.lopez@mail.com', 2);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Carlos García', 'carlos.garcia@mail.com', 3);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('María Rodríguez', 'maria.rodriguez@mail.com', 4);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('José Martínez', 'jose.martinez@mail.com', 5);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Laura Sánchez', 'laura.sanchez@mail.com', 6);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Pedro Gómez', 'pedro.gomez@mail.com', 7);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Luisa Fernández', 'luisa.fernandez@mail.com', 8);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Martín Torres', 'martin.torres@mail.com', 9);
INSERT INTO Participantes (nombre, email, id_panel) VALUES ('Sofía Ramírez', 'sofia.ramirez@mail.com', 10);

INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Juan Pérez, 35 años', 1, 1);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Ana López, 28 años', 2, 2);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Carlos García, 40 años', 3, 3);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('María Rodríguez, 25 años', 4, 4);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('José Martínez, 45 años', 5, 5);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Laura Sánchez, 32 años', 6, 6);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Pedro Gómez, 37 años', 7, 7);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Luisa Fernández, 29 años', 8, 8);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Martín Torres, 41 años', 9, 9);
INSERT INTO Participa (datos_personales, id_encuesta_focus_group, id_panel) VALUES ('Sofía Ramírez, 34 años', 10, 10);
