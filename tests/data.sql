CREATE TABLE Alumnos(
	id_alumno INT IDENTITY(1,1) CONSTRAINT PK_id_alumno PRIMARY KEY,
	mail_alumno VARCHAR(60) CONSTRAINT UQ_mail_alumno UNIQUE NOT NULL,
	name_alumno VARCHAR(16) CONSTRAINT UQ_name_alumno UNIQUE NOT NULL,
	pswd_alumno VARCHAR(8) CONSTRAINT UQ_pswd_alumno UNIQUE NOT NULL --Check que sean 8 y no menos
);

CREATE TABLE Paginas(
	id_alumno INT CONSTRAINT FK_id_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
	--state_pagina BOOL CONSTRAINT NOT NULL -- Trigger de la página
	--tiempo dentro
	act_pagina INT CONSTRAINT CK_act_pagina CHECK(act_pagina >= 0),
	act_file BINARY
);

CREATE TABLE Banco_Respuestas(
	id_pregunta INT IDENTITY(1,1) CONSTRAINT PK_banco_pregunta PRIMARY KEY,
	pregunta VARCHAR(300) CONSTRAINT NN_pregunta NOT NULL,
	respuesta CHAR(1) CONSTRAINT NN_respuesta NOT NULL
);

CREATE TABLE Preguntas(
	id_alumno INT CONSTRAINT FK_id_alumno_preguntas FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno), 
	id_pregunta INT CONSTRAINT PK_id_pregunta FOREIGN KEY (id_pregunta) REFERENCES Banco_Respuestas(id_pregunta),
	calificacion INT CONSTRAINT NN_calificacion NOT NULL,
	respuesta_input CHAR(1) CONSTRAINT NN_respuesta NOT NULL,
);

CREATE TABLE Actividades(
	id_actividad INT IDENTITY(1,1) CONSTRAINT PK_id_actividad PRIMARY KEY,
	tipo_actividad VARCHAR(16) CONSTRAINT NN_tipo_actividad NOT NULL
);

CREATE TABLE Tareas(
	id_alumno INT CONSTRAINT FK_id_alumno_tareas FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
	id_tarea INT IDENTITY(1,1) CONSTRAINT PK_id_tarea PRIMARY KEY,
	tipo_act INT CONSTRAINT FK_id_actividad FOREIGN KEY (tipo_act) REFERENCES Actividades(id_actividad),
	act_file BINARY,
	upload_time DATETIME DEFAULT GETDATE()
);