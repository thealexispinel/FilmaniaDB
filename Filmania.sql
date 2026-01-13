CREATE DATABASE FILMANIA;
USE FILMANIA;

CREATE TABLE TipoPelicula (
    id_tipo_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    basica BOOLEAN,
    subtitulada BOOLEAN,
    inclusiva BOOLEAN
);

CREATE TABLE Sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sala VARCHAR(255),
    capacidad INT,
    tipo_sala VARCHAR(50),
    ubicacion VARCHAR(255)
);

CREATE TABLE ReporteVentas (
    id_Ventas INT AUTO_INCREMENT PRIMARY KEY,
    totVentas INT NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Asientos (
    id_Asiento INT AUTO_INCREMENT PRIMARY KEY,
    Seccion VARCHAR(255),
    Estado VARCHAR(255),
    id_sala INT,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20),
    tiposUsuario VARCHAR(20),
    contraseña VARCHAR(255)
);

CREATE TABLE Admin (
    IdAdmin INT AUTO_INCREMENT PRIMARY KEY,
    IdReporteVentas INT,
    foto VARCHAR(255),
    Nombre VARCHAR(100) NOT NULL,    FOREIGN KEY (IdReporteVentas) REFERENCES ReporteVentas(id_Ventas)
);

CREATE TABLE Rol (
    IdRol INT AUTO_INCREMENT PRIMARY KEY,
    IdUsuario INT,
    IdAdmin INT,
    Rango VARCHAR(50) NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (IdAdmin) REFERENCES Admin(IdAdmin)
);

CREATE TABLE Horario (
    Id_horario INT AUTO_INCREMENT PRIMARY KEY,
    tandas VARCHAR(255),
    id_sala INT,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Qr (
    id_Qr INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT NOT NULL,
    fecha_creacion DATE NOT NULL,
    descripcion VARCHAR(255),
    otra_informacion VARCHAR(255)
);

CREATE TABLE Pelicula (
    id_pelicula VARCHAR(15) PRIMARY KEY NOT NULL,
    duracion VARCHAR(30) NOT NULL,
    director VARCHAR(50) NOT NULL,
    actor VARCHAR(50) NOT NULL,
    año INT NOT NULL,
    sipnosis VARCHAR(100) NOT NULL,
    productora VARCHAR(50) NOT NULL,
    clasificacion INT NOT NULL,
    genero VARCHAR(15) NOT NULL,
    precio FLOAT NOT NULL,
    nombrePelicula VARCHAR(30) NOT NULL,
    id_tipoP INT,
    id_Qr INT,
    FOREIGN KEY (id_tipoP) REFERENCES TipoPelicula(id_tipo_pelicula),
    FOREIGN KEY (id_Qr) REFERENCES Qr(id_Qr)
);

CREATE TABLE Cartelera (
    id_cartelera INT AUTO_INCREMENT PRIMARY KEY,
    nomPelicula VARCHAR(255) NOT NULL UNIQUE,
    fechaEstreno DATE,
    clasificacion VARCHAR(50),
    estado VARCHAR(50),
    id_pelicula VARCHAR(15) NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
    FOREIGN KEY (id_horario) REFERENCES Horario(Id_horario)
);


CREATE TABLE Sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_usuario INT,
    provincia VARCHAR(255),
    ubicacion VARCHAR(255),
    nombre_sucursal VARCHAR(255),
    telefono VARCHAR(20),
    FOREIGN KEY (id_venta) REFERENCES ReporteVentas(id_Ventas),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Oferta (
    id_oferta VARCHAR(15) PRIMARY KEY,
    precio FLOAT NOT NULL,
    descuento VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_cartelera INT,
    FOREIGN KEY (id_cartelera) REFERENCES Cartelera(id_cartelera)
);

CREATE TABLE Ticket (
    id_Ticket INT AUTO_INCREMENT PRIMARY KEY,
    NombrePelicula VARCHAR(255) NOT NULL,
    id_sala INT,
    id_asiento INT,
    NombreUsuario VARCHAR(255) NOT NULL,
    Clasificacion VARCHAR(255) NOT NULL,
    reserva VARCHAR(255) NOT NULL,
    fechaTicket DATE NOT NULL,
    horaTicket TIME NOT NULL,
    id_horario INT,
    emailUsuario VARCHAR(255) NOT NULL,
    cantidadTicket INT NOT NULL,
    id_Sucursal INT,
    id_Qr INT,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_asiento) REFERENCES Asientos(id_Asiento),
    FOREIGN KEY (id_horario) REFERENCES Horario(Id_horario),
    FOREIGN KEY (id_Sucursal) REFERENCES Sucursal(id_sucursal),
    FOREIGN KEY (id_Qr) REFERENCES Qr(id_Qr)
);