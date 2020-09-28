/*
 Navicat Premium Data Transfer

 Source Server         : AZURE SQL SERVER
 Source Server Type    : SQL Server
 Source Server Version : 12002000
 Source Host           : fsd-desarrollo.database.windows.net:1433
 Source Catalog        : FSD
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002000
 File Encoding         : 65001

 Date: 13/09/2020 18:01:33
*/


-- ----------------------------
-- Table structure for clasificador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[clasificador]') AND type IN ('U'))
	DROP TABLE [dbo].[clasificador]
GO

CREATE TABLE [dbo].[clasificador] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [c_nombre] varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_ruc] varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for contactos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[contactos]') AND type IN ('U'))
	DROP TABLE [dbo].[contactos]
GO

CREATE TABLE [dbo].[contactos] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_entidad] numeric(18)  NULL,
  [id_cargo] numeric(18)  NULL,
  [c_nombres_contacto] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_apellidos_contacto] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_dni] int  NULL,
  [c_nro_celular] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_nro_telefono] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for deudas
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[deudas]') AND type IN ('U'))
	DROP TABLE [dbo].[deudas]
GO

CREATE TABLE [dbo].[deudas] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_entidad] numeric(18)  NULL,
  [id_concepto] numeric(18)  NULL,
  [c_observacion] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_monto] decimal(20,2)  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for entidad
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[entidad]') AND type IN ('U'))
	DROP TABLE [dbo].[entidad]
GO

CREATE TABLE [dbo].[entidad] (
  [N_COD_ENTIDAD] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_tipo_entidad] numeric(18)  NULL,
  [C_DES_RAZON] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COD_RUC] varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_direccion] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [D_FEC_REGISTRO] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL,
  [C_ID_DSTRO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_ID_PROV] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_ID_DPTO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Table structure for entidad_riesgo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[entidad_riesgo]') AND type IN ('U'))
	DROP TABLE [dbo].[entidad_riesgo]
GO

CREATE TABLE [dbo].[entidad_riesgo] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_clasificador] numeric(18)  NULL,
  [id_entidad] numeric(18)  NULL,
  [c_riesgo] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_peso] int  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for experiencia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[experiencia]') AND type IN ('U'))
	DROP TABLE [dbo].[experiencia]
GO

CREATE TABLE [dbo].[experiencia] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_entidad] numeric(18)  NULL,
  [id_entidad_cierre] numeric(18)  NULL,
  [c_nom_entidad_cierre] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_cierre] date  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for MENU
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MENU]') AND type IN ('U'))
	DROP TABLE [dbo].[MENU]
GO

CREATE TABLE [dbo].[MENU] (
  [N_COD_MENU] int  IDENTITY(1,1) NOT NULL,
  [N_COD_PADRE] int  NULL,
  [C_DES_NOMBRE] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COD_ICON] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_NOM_PAGE] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_FL_ACTIVO] int  NULL
)
GO


-- ----------------------------
-- Table structure for MENUROL
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MENUROL]') AND type IN ('U'))
	DROP TABLE [dbo].[MENUROL]
GO

CREATE TABLE [dbo].[MENUROL] (
  [N_COD_MENU] int  NULL,
  [N_COD_ROL] int  NULL,
  [N_FL_ACTIVO] int  NULL
)
GO


-- ----------------------------
-- Table structure for oficinas
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oficinas]') AND type IN ('U'))
	DROP TABLE [dbo].[oficinas]
GO

CREATE TABLE [dbo].[oficinas] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_entidad] numeric(18)  NULL,
  [c_nombre_oficina] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_direccion] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_codigo_postal] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_departamento] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_provincia] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL,
  [id_tipo_oficina] numeric(18)  NULL
)
GO


-- ----------------------------
-- Table structure for parametros
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[parametros]') AND type IN ('U'))
	DROP TABLE [dbo].[parametros]
GO

CREATE TABLE [dbo].[parametros] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [c_nombre] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_descripcion] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for parametros_valor
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[parametros_valor]') AND type IN ('U'))
	DROP TABLE [dbo].[parametros_valor]
GO

CREATE TABLE [dbo].[parametros_valor] (
  [id] numeric(18)  IDENTITY(1,1) NOT NULL,
  [id_parametros] numeric(18)  NULL,
  [c_nombre] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [c_descripcion] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_estado] int  NULL,
  [c_usuario_creacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_creacion] datetime  NULL,
  [c_usuario_modificacion] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [d_fecha_modificacion] datetime  NULL,
  [c_valor] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Table structure for PERFIL
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFIL]') AND type IN ('U'))
	DROP TABLE [dbo].[PERFIL]
GO

CREATE TABLE [dbo].[PERFIL] (
  [N_COD_PERFIL] int  IDENTITY(1,1) NOT NULL,
  [C_DET_NOMBRE] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_FL_ACTIVO] int  NULL,
  [C_DET_DETALLE] varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_USU_REGISTRO] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_USU_MODIFICACION] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [D_FEC_REGISTRO] datetime  NULL,
  [D_FEC_MODIFICACION] datetime  NULL
)
GO


-- ----------------------------
-- Table structure for PERFILROL
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILROL]') AND type IN ('U'))
	DROP TABLE [dbo].[PERFILROL]
GO

CREATE TABLE [dbo].[PERFILROL] (
  [N_COD_PERFIL] int  NULL,
  [N_COD_ROL] int  NULL,
  [N_FL_ACTIVO] int  NULL
)
GO


-- ----------------------------
-- Table structure for ROL
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ROL]') AND type IN ('U'))
	DROP TABLE [dbo].[ROL]
GO

CREATE TABLE [dbo].[ROL] (
  [N_COD_ROL] int  IDENTITY(1,1) NOT NULL,
  [C_DES_ROL] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_FL_ACTIVO] int  NULL,
  [C_DET_DETALLE] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Table structure for UBIGEO_DPTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[UBIGEO_DPTO]') AND type IN ('U'))
	DROP TABLE [dbo].[UBIGEO_DPTO]
GO

CREATE TABLE [dbo].[UBIGEO_DPTO] (
  [C_ID_DPTO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_DESCDPTO] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAX] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAY] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_ZOOM] int  NULL
)
GO


-- ----------------------------
-- Table structure for UBIGEO_DSTRO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[UBIGEO_DSTRO]') AND type IN ('U'))
	DROP TABLE [dbo].[UBIGEO_DSTRO]
GO

CREATE TABLE [dbo].[UBIGEO_DSTRO] (
  [C_ID_DSTRO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_ID_PROV] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_ID_DPTO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_DESCDSTRO] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAX] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAY] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_ZOOM] int  NULL
)
GO


-- ----------------------------
-- Table structure for UBIGEO_PROV
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[UBIGEO_PROV]') AND type IN ('U'))
	DROP TABLE [dbo].[UBIGEO_PROV]
GO

CREATE TABLE [dbo].[UBIGEO_PROV] (
  [C_ID_PROV] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_ID_DPTO] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [C_DESCPROV] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAX] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COORDENADAY] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_ZOOM] int  NULL
)
GO


-- ----------------------------
-- Table structure for USUARIO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO]') AND type IN ('U'))
	DROP TABLE [dbo].[USUARIO]
GO

CREATE TABLE [dbo].[USUARIO] (
  [N_COD_ID] int  IDENTITY(1,1) NOT NULL,
  [C_DET_CODIGO] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_DET_NOMBRE] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [N_COD_PERFIL] int  NULL,
  [N_COD_ENTIDAD] numeric(18)  NULL,
  [N_FL_ACTIVO] int  NULL,
  [D_FEC_REGISTRO] datetime  NULL,
  [C_USU_REGISTRO] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_DET_CONTRA] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_DET_EMAIL] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [C_COD_DOCUMENTO] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [D_FEC_MODIFICACION] datetime  NULL,
  [C_USU_MODIFICACION] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- function structure for fn_pre_seleccion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_pre_seleccion]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[fn_pre_seleccion]
GO

CREATE FUNCTION [dbo].[fn_pre_seleccion] 
(
	@idEntidad INT,
	@indicadorClasificacionRiesgo VARCHAR(2),
	@porcentajeCercaniaOficinas INT,
  @indicadorDeudasFSD  VARCHAR(2)
)
RETURNS @preseleccion TABLE (
			id_entidad INT,
			c_nombre VARCHAR(150) NOT NULL,
			clasificacion_riesgo VARCHAR(2) NOT NULL,
			porcentaje_oficinas VARCHAR(10) NOT NULL,
			deuda_fsd VARCHAR(2) NOT NULL,
			id_entidad_input INT,
			ind_clasificador_input VARCHAR(2),
			por_oficinas_input INT,
			ind_deudas_input VARCHAR(2)
		)
AS
BEGIN
    
		DECLARE @nroOficinasLiquidar INT;
		DECLARE @nroOficinasConsultar INT;
		DECLARE @idEntidadEvaluar INT;
		DECLARE @preIdEntidad INT;
		DECLARE @preNombreEntidad VARCHAR(150);
		DECLARE @prePorcentajeCalculado DECIMAL(6,2);
		DECLARE @prePorcentajeCalculadoSTR VARCHAR(10);
		DECLARE @preRiesgoEntidad VARCHAR(5);
		DECLARE @preValorRiesgo INT;
		DECLARE @preValorRiesgoEntidad INT;
		DECLARE @preDeudaFSD VARCHAR(2);
		
		SELECT @nroOficinasLiquidar = COUNT(*) FROM OFICINAS WHERE id_entidad = @idEntidad;
		
		DECLARE cursor_entidades CURSOR FOR
			SELECT N_COD_ENTIDAD FROM	ENTIDAD WHERE N_COD_ENTIDAD NOT IN (@idEntidad);
    
		OPEN cursor_entidades
		
		FETCH NEXT FROM cursor_entidades INTO @idEntidadEvaluar
		
		WHILE @@FETCH_STATUS = 0
		
		BEGIN
				SELECT @nroOficinasConsultar = COUNT(*) FROM OFICINAS WHERE 
					CONCAT(id_departamento, id_provincia, id_distrito) IN 
					(SELECT CONCAT(id_departamento, id_provincia, id_distrito) AS ubigeo FROM OFICINAS WHERE id_entidad =@idEntidad)
					AND id_entidad = @idEntidadEvaluar
				
				SET @prePorcentajeCalculado = @nroOficinasConsultar*100.0/@nroOficinasLiquidar
				SET @prePorcentajeCalculadoSTR = CONVERT(VARCHAR(10), @prePorcentajeCalculado)
				IF @prePorcentajeCalculado >= @porcentajeCercaniaOficinas
				BEGIN
					--(1) OBTENER ENTIDAD
					SELECT @preIdEntidad = N_COD_ENTIDAD, @preNombreEntidad = C_DES_RAZON FROM ENTIDAD WHERE N_COD_ENTIDAD = @idEntidadEvaluar
					--(2) OBTENER RIESGO ENTIDAD
						----PARAMETRO DE LA FUNCION
						SELECT @preValorRiesgo = CONVERT(INT, C_VALOR) FROM parametros_valor WHERE id_parametros = 1 AND TRIM(C_NOMBRE) = TRIM(@indicadorClasificacionRiesgo)
						----OBTENEMOS EL MINIMO DE LA ENTIDAD
						SELECT TOP 1 @preRiesgoEntidad = C_RIESGO FROM entidad_riesgo WHERE id_entidad = @idEntidadEvaluar ORDER BY C_RIESGO DESC
						SELECT @preValorRiesgoEntidad = CONVERT(INT, C_VALOR) FROM parametros_valor WHERE id_parametros = 1 AND TRIM(C_NOMBRE) = TRIM(@preRiesgoEntidad)
					--(3) OBTENER DEUDAS
					SET @preDeudaFSD = 'SI'
					IF 0 = (SELECT COUNT(*) FROM DEUDAS WHERE id_entidad = @idEntidadEvaluar)
					BEGIN
						SET @preDeudaFSD = 'NO'
					END
					--(4) VALIDAMOS CON LOS PARAMETROS DE LA FUNCION
					IF @indicadorDeudasFSD = @preDeudaFSD AND @preValorRiesgoEntidad >= @preValorRiesgo
					BEGIN
						INSERT INTO @preseleccion (id_entidad, c_nombre, clasificacion_riesgo, porcentaje_oficinas, deuda_fsd) 
						VALUES (@preIdEntidad, @preNombreEntidad, @preRiesgoEntidad, @prePorcentajeCalculadoSTR, @preDeudaFSD)
					END
				END
			
			FETCH NEXT FROM cursor_entidades INTO @idEntidadEvaluar
		END
		CLOSE cursor_entidades  
		DEALLOCATE cursor_entidades 
		
    RETURN
END
GO


-- ----------------------------
-- Auto increment value for clasificador
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[clasificador]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table clasificador
-- ----------------------------
ALTER TABLE [dbo].[clasificador] ADD CONSTRAINT [PK_CLASIFICADOR] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for contactos
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[contactos]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table contactos
-- ----------------------------
ALTER TABLE [dbo].[contactos] ADD CONSTRAINT [PK_CONTACTOS] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for deudas
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[deudas]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table deudas
-- ----------------------------
ALTER TABLE [dbo].[deudas] ADD CONSTRAINT [PK_DEUDAS] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for entidad
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[entidad]', RESEED, 45)
GO


-- ----------------------------
-- Primary Key structure for table entidad
-- ----------------------------
ALTER TABLE [dbo].[entidad] ADD CONSTRAINT [PK_ENTIDADES] PRIMARY KEY CLUSTERED ([N_COD_ENTIDAD])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for entidad_riesgo
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[entidad_riesgo]', RESEED, 264)
GO


-- ----------------------------
-- Primary Key structure for table entidad_riesgo
-- ----------------------------
ALTER TABLE [dbo].[entidad_riesgo] ADD CONSTRAINT [PK_ENTIDAD_RIESGO] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for experiencia
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[experiencia]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table experiencia
-- ----------------------------
ALTER TABLE [dbo].[experiencia] ADD CONSTRAINT [PK_EXPERIENCIA] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for MENU
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[MENU]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table MENU
-- ----------------------------
ALTER TABLE [dbo].[MENU] ADD CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED ([N_COD_MENU])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for oficinas
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[oficinas]', RESEED, 4427)
GO


-- ----------------------------
-- Primary Key structure for table oficinas
-- ----------------------------
ALTER TABLE [dbo].[oficinas] ADD CONSTRAINT [PK_OFICINAS] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for parametros
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[parametros]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table parametros
-- ----------------------------
ALTER TABLE [dbo].[parametros] ADD CONSTRAINT [PK_PARAMETROS] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for parametros_valor
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[parametros_valor]', RESEED, 30)
GO


-- ----------------------------
-- Primary Key structure for table parametros_valor
-- ----------------------------
ALTER TABLE [dbo].[parametros_valor] ADD CONSTRAINT [PK_PARAMETROS_VALOR] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for PERFIL
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[PERFIL]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table PERFIL
-- ----------------------------
ALTER TABLE [dbo].[PERFIL] ADD CONSTRAINT [PK_PERFIL] PRIMARY KEY CLUSTERED ([N_COD_PERFIL])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for ROL
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ROL]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table ROL
-- ----------------------------
ALTER TABLE [dbo].[ROL] ADD CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED ([N_COD_ROL])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table UBIGEO_DPTO
-- ----------------------------
ALTER TABLE [dbo].[UBIGEO_DPTO] ADD CONSTRAINT [PK_UBIGEO_DPTO] PRIMARY KEY CLUSTERED ([C_ID_DPTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table UBIGEO_DSTRO
-- ----------------------------
ALTER TABLE [dbo].[UBIGEO_DSTRO] ADD CONSTRAINT [PK_UBIGEO_DSTRO] PRIMARY KEY CLUSTERED ([C_ID_DSTRO], [C_ID_PROV], [C_ID_DPTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table UBIGEO_PROV
-- ----------------------------
ALTER TABLE [dbo].[UBIGEO_PROV] ADD CONSTRAINT [PK_UBIGEO_PROV] PRIMARY KEY CLUSTERED ([C_ID_PROV], [C_ID_DPTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for USUARIO
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[USUARIO]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table USUARIO
-- ----------------------------
ALTER TABLE [dbo].[USUARIO] ADD CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED ([N_COD_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Foreign Keys structure for table contactos
-- ----------------------------
ALTER TABLE [dbo].[contactos] ADD CONSTRAINT [fk_contactos_entidades_1] FOREIGN KEY ([id_entidad]) REFERENCES [dbo].[entidad] ([N_COD_ENTIDAD]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table deudas
-- ----------------------------
ALTER TABLE [dbo].[deudas] ADD CONSTRAINT [fk_deudas_entidades_1] FOREIGN KEY ([id_entidad]) REFERENCES [dbo].[entidad] ([N_COD_ENTIDAD]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table experiencia
-- ----------------------------
ALTER TABLE [dbo].[experiencia] ADD CONSTRAINT [fk_experiencia_entidades_1] FOREIGN KEY ([id_entidad]) REFERENCES [dbo].[entidad] ([N_COD_ENTIDAD]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table MENUROL
-- ----------------------------
ALTER TABLE [dbo].[MENUROL] ADD CONSTRAINT [FK_MENUROL_REFERENCE_ROL] FOREIGN KEY ([N_COD_ROL]) REFERENCES [dbo].[ROL] ([N_COD_ROL]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[MENUROL] ADD CONSTRAINT [FK_MENUROL_REFERENCE_MENU] FOREIGN KEY ([N_COD_MENU]) REFERENCES [dbo].[MENU] ([N_COD_MENU]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table oficinas
-- ----------------------------
ALTER TABLE [dbo].[oficinas] ADD CONSTRAINT [fk_oficinas_entidades_1] FOREIGN KEY ([id_entidad]) REFERENCES [dbo].[entidad] ([N_COD_ENTIDAD]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table parametros_valor
-- ----------------------------
ALTER TABLE [dbo].[parametros_valor] ADD CONSTRAINT [fk_parametros_valor_parametros_1] FOREIGN KEY ([id_parametros]) REFERENCES [dbo].[parametros] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table PERFILROL
-- ----------------------------
ALTER TABLE [dbo].[PERFILROL] ADD CONSTRAINT [FK_PERFILRO_REFERENCE_ROL] FOREIGN KEY ([N_COD_ROL]) REFERENCES [dbo].[ROL] ([N_COD_ROL]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[PERFILROL] ADD CONSTRAINT [FK_PERFILRO_REFERENCE_PERFIL] FOREIGN KEY ([N_COD_PERFIL]) REFERENCES [dbo].[PERFIL] ([N_COD_PERFIL]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table USUARIO
-- ----------------------------
ALTER TABLE [dbo].[USUARIO] ADD CONSTRAINT [FK_USUARIO_REFERENCE_PERFIL] FOREIGN KEY ([N_COD_PERFIL]) REFERENCES [dbo].[PERFIL] ([N_COD_PERFIL]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[USUARIO] ADD CONSTRAINT [FK_USUARIO_REFERENCE_ENTIDADE] FOREIGN KEY ([N_COD_ENTIDAD]) REFERENCES [dbo].[entidad] ([N_COD_ENTIDAD]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

