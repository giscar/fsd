/****** Script for SelectTopNRows command from SSMS  ******/
/*
SELECT C_ID_DPTO,C_DESCDPTO,C_COORDENADAX,C_COORDENADAY,N_ZOOM FROM UBIGEO_DPTO
SELECT C_ID_PROV, C_ID_DPTO, C_DESCPROV,C_COORDENADAX,C_COORDENADAY,N_ZOOM FROM UBIGEO_PROV
SELECT C_ID_DSTRO, C_ID_PROV, C_ID_DPTO, C_DESCDSTRO,C_COORDENADAX,C_COORDENADAY,N_ZOOM FROM UBIGEO_DSTRO
SELECT C_ID_DSTRO, C_ID_PROV, C_ID_DPTO,  null C_DESCDSTRO, null C_DESCPROV, C_DESCDSTRO,C_COORDENADAX,C_COORDENADAY,N_ZOOM FROM UBIGEO_DSTRO where C_ID_DPTO = #IdDepartamento#
*/
 -- 0 
 exec sp_rename 'entidades','entidad';
 EXECUTE sp_rename 'entidad.id', 'N_COD_ENTIDAD', 'COLUMN';
  EXECUTE sp_rename 'entidad.c_nombre_entidad', 'C_DES_RAZON', 'COLUMN';
   EXECUTE sp_rename 'entidad.c_ruc', 'C_COD_RUC', 'COLUMN';
    EXECUTE sp_rename 'entidad.d_fecha_creacion', 'D_FEC_REGISTRO', 'COLUMN';
	 EXECUTE sp_rename 'usuario.N_ID_ENTIDAD', 'N_COD_ENTIDAD', 'COLUMN';
	
  --1
  ALTER TABLE dbo.entidad ADD C_ID_DSTRO VARCHAR(2) NULL, C_ID_PROV VARCHAR(2) NULL , C_ID_DPTO VARCHAR(2) NULL ;
  
 -- 2 
 ALTER TABLE oficinas ALTER COLUMN id_departamento varchar(2)
 ALTER TABLE oficinas ALTER COLUMN id_provincia varchar(2)
 ALTER TABLE oficinas ALTER COLUMN id_distrito varchar(2)



    SELECT * FROM oficinas
	SELECT * FROM entidad

         