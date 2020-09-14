
  insert into menu(N_COD_PADRE, C_DES_NOMBRE, C_COD_ICON,C_NOM_PAGE,N_FL_ACTIVO)
  values (0, 'Entidad', 'icon-lock-open', 'iniciarEntidad',1)


  insert into dbo.MENUROL(N_COD_MENU, N_COD_ROL, N_FL_ACTIVO)
  values(6,5,1)



   Alter table entidad add c_latitud varchar(20);
 Alter table entidad add c_longitud varchar(20);
 alter table entidad add c_codigo_postal  varchar(30);


 ---- parametro cargo

   insert into dbo.parametros(c_nombre, c_descripcion, n_estado,c_usuario_creacion, d_fecha_creacion)
   values('CARGO', 'CARGO DEL PERSONAL-CONTACTO',1,user, GETDATE());

   ---- parametro cargo valor
   insert into dbo.parametros_valor(id_parametros, c_nombre, c_descripcion, n_estado, c_usuario_creacion, d_fecha_creacion)
   values(6, 'GERENTE FINANCIERO','GERENTE FINANCIERO',1,user, GETDATE());
   
   insert into dbo.parametros_valor(id_parametros, c_nombre, c_descripcion, n_estado, c_usuario_creacion, d_fecha_creacion)
   values(6, 'ANALISTA FINANCIERO','ANALISTA FINANCIERO',1,user, GETDATE());

