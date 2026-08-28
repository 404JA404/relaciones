CREATE DATABASE `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE universidad;

CREATE TABLE profesores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    correo VARCHAR(100)
);
-- abajo se encuentra el uso de referencia
CREATE TABLE materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    creditos INT,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO profesores (nombre, especialidad, correo) VALUES
('Carlos Martinez', 'Matematicas', 'carlos@universidad.com'),
('Jane Doe', 'Programacion', 'Anonymous@universidad.com'),
('Andres Rodriguez', 'Fisica', 'andres@universidad.com'),
('Maria Torres', 'Ingles', 'maria@universidad.com'),
('Sofia Hernandez', 'Bases de Datos', 'sofia@universidad.com');

INSERT INTO materias (nombre, creditos, profesor_id) VALUES
('Calculo I', 4, 1),
('Programacion I', 4, 2),
('Fisica I', 3, 3),
('Ingles I', 2, 4),
('Bases de Datos', 4, 5);

-- aqui se usa las referencias de mucho a muchos
CREATE TABLE estudiante (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE cursos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL
);

CREATE TABLE estudiante_curso (
  estudiante_id INT,
  cursos_id INT,
  PRIMARY KEY (estudiante_id, cursos_id),
  FOREIGN KEY (estudiante_id) REFERENCES estudiante(id) ON DELETE CASCADE,
  FOREIGN KEY (cursos_id) REFERENCES cursos(id) ON DELETE CASCADE
);

INSERT INTO estudiante (name) VALUES ('Hana Dam');
INSERT INTO cursos (title) VALUES ('MySQL');

INSERT INTO estudiante (name) VALUES ('Juan Pérez'), ('María López');
INSERT INTO cursos (title) VALUES ('PostgreSQL'), ('MongoDB');
INSERT INTO estudiante_curso (estudiante_id, cursos_id) VALUES 
(1, 1), (1, 2), (2, 1), (3, 2);