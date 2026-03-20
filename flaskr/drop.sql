BEGIN TRANSACTION
    IF OBJECT_ID('[dbo].[sesiones_de_alumnos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sesiones_de_alumnos]
    GO
    IF OBJECT_ID('[dbo].[set_tareas_alumnos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[set_tareas_alumnos]
    GO
    IF OBJECT_ID('[dbo].[tareas_sets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tareas_sets]
    GO
    IF OBJECT_ID('[dbo].[tareas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tareas]
    GO
    IF OBJECT_ID('[dbo].[tareas_recibidas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tareas_recibidas]
    GO
    IF OBJECT_ID('[dbo].[alumnos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[alumnos]
    GO
    IF OBJECT_ID('[dbo].[sesiones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sesiones]
    GO
    IF OBJECT_ID('[dbo].[catalogo_preguntas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[catalogo_preguntas]
    GO
    IF OBJECT_ID('[dbo].[usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usuarios]
    GO
    IF OBJECT_ID('[dbo].[passwords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[passwords]
    GO
COMMIT TRANSACTION
--ROLLBACK
