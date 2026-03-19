------------------------------------------------------
--- GUARDA EL NOMBRE DE USUARIO PARA NO TENER QUE HACER UN HISTÓRICO SI NO ES NECESARIO Y 
--- ÙNICAMENTE IDENTIFICARLO SI TIENE EL MISMO USERNAME
------------------------------------------------------
------------------------------------------------------
--- ESTATUS : sp_deshabilitar
--- 1 -> activo
------------------------------------------------------
CREATE TABLE passwords(
    id_pswd INT IDENTITY(1,1) PRIMARY KEY,
    pswd VARCHAR(10) NOT NULL,
    estatus BIT DEFAULT (1),
    username VARCHAR(64) NOT NULL
);
CREATE TABLE usuarios(
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    id_pswd INT,
    username VARCHAR(64) NOT NULL,
    estatus BIT DEFAULT (0),

    CONSTRAINT FK_pswd FOREIGN KEY (id_pswd) REFERENCES passwords(id_pswd)
);
CREATE TABLE catalogo_preguntas(
    id_pregunta INT IDENTITY(1,1) PRIMARY KEY,
    pregunta VARCHAR(254) NOT NULL,
    respuesta_correcta BIT NOT NULL
);
------------------------------------------------------
--- CUANDO UN USUARIO CREA CUENTA, LA OPCIÓN ES TOMAR SESIÓN COMO NULL YA QUE
--- NO SE LE HA OTORGADO EL ACCESO COMO ALUMNO, SÓLO COMO USUARIO CON CUENTA
------------------------------------------------------

------------------------------------------------------
--- PUEDE QUE AL INICIO NO HAYA PREGUNTAS,Y POR LO TANTO ES NULL
------------------------------------------------------
CREATE TABLE sesiones(
    id_sesion INT IDENTITY(1,1) PRIMARY KEY,
    id_pregunta_login INT NULL,
    fecha_entrada DATETIME DEFAULT GETDATE(),
    fecha_salida DATETIME NOT NULL,

    CONSTRAINT FK_pregunta FOREIGN KEY (id_pregunta_login) REFERENCES catalogo_preguntas(id_pregunta)
);
------------------------------------------------------
--- LA TABLA DE ALUMNOS CONTIENE AL USUARIO LIGADO, 
--- EL ESTATUS SIGNIFICA SI TIENE PÁGINA/SET DE TAREAS O SI ES OBSOLETA LA CUENTA
------------------------------------------------------
CREATE TABLE alumnos(
    id_alumno INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT,
    mail VARCHAR(64),
    calificacion DECIMAL(5,3),
    estatus BIT DEFAULT 0
);
CREATE TABLE tareas_recibidas(
    id_tarea_post INT IDENTITY(1,1) PRIMARY KEY,
    id_alumno INT NOT NULL,
    archivo BINARY NULL,
    upload DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_alumno_tareas FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno)
);
CREATE TABLE tareas(
    id_tarea_get INT IDENTITY(1,1) PRIMARY KEY,
    archivo BINARY NULL,
    descripcion VARCHAR(254) NOT NULL
);
CREATE TABLE tareas_sets(
    id_set_de_tareas INT IDENTITY(1,1) PRIMARY KEY,
    id_tarea INT NOT NULL,
    id_necesita_set INT NULL,

    CONSTRAINT FK_tarea_get FOREIGN KEY (id_tarea) REFERENCES tareas(id_tarea_get), 
    CONSTRAINT FK_recursivo FOREIGN KEY (id_necesita_set) REFERENCES tareas_sets(id_set_de_tareas)    
);
------------------------------------------------------
-- LOS SETS DE TAREAS SON PRECARGADOS
------------------------------------------------------
CREATE TABLE set_tareas_alumnos(
    id_set INT IDENTITY(1,1) PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_set_de_tareas INT NOT NULL,
    estatus BIT DEFAULT (0),

    CONSTRAINT FK_alumno_set FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    CONSTRAINT FK_set FOREIGN KEY (id_set_de_tareas) REFERENCES tareas_sets(id_set_de_tareas)
);
--CREATE TABLE retos_diarios();
--CREATE TABLE chat();
CREATE TABLE sesiones_de_alumnos(
    id_sesion_de_alumno INT IDENTITY(1,1) PRIMARY KEY,
    id_sesion INT NOT NULL,
    id_alumno INT NOT NULL,

    CONSTRAINT FK_alumno_sesion FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),    
    CONSTRAINT FK_sesion FOREIGN KEY (id_sesion) REFERENCES sesiones(id_sesion)
);
