DROP DATABASE IF exists MEC;
CREATE DATABASE MEC;
use MEC;

-- Crear tabla Proyectos
CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT
);

-- Crear tabla Pistas
CREATE TABLE Pistas (
    id_pista INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    nombre_pista VARCHAR(100) NOT NULL,
    tipo ENUM('audio', 'midi') NOT NULL,
    volumen FLOAT DEFAULT 1.0,
    paneo FLOAT DEFAULT 0.0,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto) ON DELETE CASCADE
);

-- Crear tabla Efectos
CREATE TABLE Efectos (
    id_efecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_efecto VARCHAR(100) NOT NULL,
    parametros JSON NOT NULL,
    id_pista INT,
    FOREIGN KEY (id_pista) REFERENCES Pistas(id_pista) ON DELETE CASCADE
);

-- Crear tabla Samples
CREATE TABLE Samples (
    id_sample INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sample VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    ruta_archivo VARCHAR(255) NOT NULL
);

-- Crear tabla Mezclas
CREATE TABLE Mezclas (
    id_mezcla INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    ruta_exportada VARCHAR(255) NOT NULL,
    formato VARCHAR(10) NOT NULL,
    fecha_exportacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto) ON DELETE CASCADE
);

-- Crear tabla Samples_Pistas (tabla de conexión)
CREATE TABLE Samples_Pistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sample INT,
    id_pista INT,
    inicio FLOAT NOT NULL,
    duracion FLOAT NOT NULL,
    FOREIGN KEY (id_sample) REFERENCES Samples(id_sample) ON DELETE CASCADE,
    FOREIGN KEY (id_pista) REFERENCES Pistas(id_pista) ON DELETE CASCADE
);
