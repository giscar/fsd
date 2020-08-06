

/*==============================================================*/
/* Table: UBIGEO_DPTO                                       */
/*==============================================================*/
create table UBIGEO_DPTO 
(
   C_ID_DPTO            VARCHAR(2)          not null,
   C_DESCDPTO           VARCHAR(100),
   C_COORDENADAX        VARCHAR(30),
   C_COORDENADAY        VARCHAR(30),
   N_ZOOM               int,
   constraint PK_UBIGEO_DPTO primary key (C_ID_DPTO)
);
/*==============================================================*/
/* Table: UBIGEO_PROV                                       */
/*==============================================================*/
create table UBIGEO_PROV 
(
   C_ID_PROV            VARCHAR(2)          not null,
   C_ID_DPTO            VARCHAR(2)          not null,
   C_DESCPROV           VARCHAR(100),
   C_COORDENADAX        VARCHAR(30),
   C_COORDENADAY        VARCHAR(30),
   N_ZOOM               INT,
   constraint PK_UBIGEO_PROV primary key (C_ID_PROV, C_ID_DPTO)
);

/*==============================================================*/
/* Table: SID_UBIGEO_DSTRO                                      */
/*==============================================================*/
create table UBIGEO_DSTRO 
(
   C_ID_DSTRO           VARCHAR(2)          not null,
   C_ID_PROV            VARCHAR(2)          not null,
   C_ID_DPTO            VARCHAR(2)          not null,
   C_DESCDSTRO          VARCHAR(100),
   C_COORDENADAX        VARCHAR(30),
   C_COORDENADAY        VARCHAR(30),
   N_ZOOM               INT,
   constraint PK_UBIGEO_DSTRO primary key (C_ID_DSTRO, C_ID_PROV, C_ID_DPTO)
);


 /*--  Cambios en las tablas */
 
 

 --1
 ALTER TABLE dbo.entidades ADD C_ID_DSTRO VARCHAR(2) NULL, C_ID_PROV VARCHAR(2) NULL , C_ID_DPTO VARCHAR(2) NULL ;
  
 -- 2 
 ALTER TABLE oficinas ALTER COLUMN id_departamento varchar(2)
 ALTER TABLE oficinas ALTER COLUMN id_provincia varchar(2)
 ALTER TABLE oficinas ALTER COLUMN id_distrito varchar(2)






   
