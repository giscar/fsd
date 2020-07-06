drop database FSD
go

/*==============================================================*/
/* Database: FSD                                                */
/*==============================================================*/
create database FSD
go

use FSD
go

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU (
   N_COD_MENU           int                  identity(1,1),
   N_COD_PADRE          int                  null,
   C_DES_NOMBRE         varchar(50)          null,
   C_COD_ICON           varchar(50)          null,
   C_NOM_PAGE           varchar(50)          null,
   N_FL_ACTIVO          int                  null,
   constraint PK_MENU primary key (N_COD_MENU)
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: MENUROL                                               */
/*==============================================================*/
create table MENUROL (
   N_COD_MENU           int                  null,
   N_COD_ROL            int                  null,
   N_FL_ACTIVO          int                  null
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: PERFIL                                                */
/*==============================================================*/
create table PERFIL (
   N_COD_PERFIL         int                  identity(1,1),
   C_DET_NOMBRE         varchar(100)         null,
   N_FL_ACTIVO          int                  null,
   C_DET_DETALLE        varchar(1000)        null,
   C_USU_REGISTRO       varchar(100)         null,
   C_USU_MODIFICACION   varchar(100)         null,
   D_FEC_REGISTRO       datetime             null,
   D_FEC_MODIFICACION   datetime             null,
   constraint PK_PERFIL primary key (N_COD_PERFIL)
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: PERFILROL                                             */
/*==============================================================*/
create table PERFILROL (
   N_COD_PERFIL         int                  null,
   N_COD_ROL            int                  null,
   N_FL_ACTIVO          int                  null
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   N_COD_ROL            int                  identity(1,1),
   C_DES_ROL            varchar(50)          null,
   N_FL_ACTIVO          int                  null,
   C_DET_DETALLE        varchar(500)         null,
   constraint PK_ROL primary key (N_COD_ROL)
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   N_COD_ID             int                  identity(1,1),
   C_DET_CODIGO         varchar(100)         null,
   C_DET_NOMBRE         varchar(300)         null,
   N_COD_PERFIL         int                  null,
   N_ID_ENTIDAD         numeric(18)          null,
   N_FL_ACTIVO          int                  null,
   D_FEC_REGISTRO       datetime             null,
   C_USU_REGISTRO       varchar(100)         null,
   C_DET_CONTRA         varchar(500)         null,
   constraint PK_USUARIO primary key (N_COD_ID)
)
ON [PRIMARY]
go

/*==============================================================*/
/* Table: contactos                                             */
/*==============================================================*/
create table contactos (
   id                   numeric(18)          identity,
   id_entidad           numeric(18)          null,
   id_cargo             numeric(18)          null,
   c_nombres_contacto   varchar(80)          null,
   c_apellidos_contacto varchar(80)          null,
   c_dni                int                  null,
   c_nro_celular        varchar(20)          null,
   c_nro_telefono       varchar(20)          null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_CONTACTOS primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: deudas                                                */
/*==============================================================*/
create table deudas (
   id                   numeric(18)          identity,
   id_entidad           numeric(18)          null,
   id_concepto          numeric(18)          null,
   c_observacion        varchar(255)         null,
   c_monto              decimal(20,2)        null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_DEUDAS primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: entidades                                             */
/*==============================================================*/
create table entidades (
   id                   numeric(18)          identity,
   id_tipo_entidad      numeric(18)          null,
   c_nombre_entidad     varchar(255)         null,
   c_ruc                varchar(11)          null,
   c_direccion          varchar(255)         null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_ENTIDADES primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: experiencia                                           */
/*==============================================================*/
create table experiencia (
   id                   numeric(18)          identity,
   id_entidad           numeric(18)          null,
   id_entidad_cierre    numeric(18)          null,
   c_nom_entidad_cierre varchar(255)         null,
   d_fecha_cierre       date                 null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_EXPERIENCIA primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: oficinas                                              */
/*==============================================================*/
create table oficinas (
   id                   numeric(18)          identity,
   id_entidad           numeric(18)          null,
   c_nombre_oficina     varchar(255)         null,
   c_direccion          varchar(255)         null,
   c_codigo_postal      varchar(30)          null,
   id_departamento      numeric(18)          null,
   id_provincia         numeric(18)          null,
   id_distrito          numeric(18)          null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_OFICINAS primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: parametros                                            */
/*==============================================================*/
create table parametros (
   id                   numeric(18)          identity,
   c_nombre             varchar(80)          null,
   c_descripcion        varchar(255)         null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_PARAMETROS primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

/*==============================================================*/
/* Table: parametros_valor                                      */
/*==============================================================*/
create table parametros_valor (
   id                   numeric(18)          identity,
   id_parametros        numeric(18)          null,
   c_nombre             varchar(80)          null,
   c_descripcion        varchar(255)         null,
   n_estado             int                  null,
   c_usuario_creacion   varchar(30)          null,
   d_fecha_creacion     datetime             null,
   c_usuario_modificacion varchar(30)          null,
   d_fecha_modificacion datetime             null,
   constraint PK_PARAMETROS_VALOR primary key (id)
         WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
go

alter table MENUROL
   add constraint FK_MENUROL_REFERENCE_ROL foreign key (N_COD_ROL)
      references ROL (N_COD_ROL)
go

alter table MENUROL
   add constraint FK_MENUROL_REFERENCE_MENU foreign key (N_COD_MENU)
      references MENU (N_COD_MENU)
go

alter table PERFILROL
   add constraint FK_PERFILRO_REFERENCE_ROL foreign key (N_COD_ROL)
      references ROL (N_COD_ROL)
go

alter table PERFILROL
   add constraint FK_PERFILRO_REFERENCE_PERFIL foreign key (N_COD_PERFIL)
      references PERFIL (N_COD_PERFIL)
go

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PERFIL foreign key (N_COD_PERFIL)
      references PERFIL (N_COD_PERFIL)
go

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_ENTIDADE foreign key (N_ID_ENTIDAD)
      references entidades (id)
go

alter table contactos
   add constraint fk_contactos_entidades_1 foreign key (id_entidad)
      references entidades (id)
go

alter table deudas
   add constraint fk_deudas_entidades_1 foreign key (id_entidad)
      references entidades (id)
go

alter table experiencia
   add constraint fk_experiencia_entidades_1 foreign key (id_entidad)
      references entidades (id)
go

alter table oficinas
   add constraint fk_oficinas_entidades_1 foreign key (id_entidad)
      references entidades (id)
go

alter table parametros_valor
   add constraint fk_parametros_valor_parametros_1 foreign key (id_parametros)
      references parametros (id)
go
