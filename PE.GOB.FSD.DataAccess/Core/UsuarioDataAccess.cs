﻿using System;

using PE.GOB.FSD.Entity.Core;
using PE.GOB.FSD.DataAccess.Mapper;
using System.Collections.Generic;

namespace PE.GOB.FSD.DataAccess.Core
{

    public class UsuarioDataAccess {

        public int guardarPersona(Usuario _usuario)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_usuario", _usuario)));
        }

        public Usuario buscarUsuario(Usuario _usuario)
        {
            return (BaseService<Usuario>.QueryForObject("select_usuario", _usuario));
        }

        public List<Usuario> buscarTodos()
        {
            return (BaseService<Usuario>.QueryForList("select_todos", null));
        }

        public Usuario buscarUsuarioForID(int idUsuario)
        {
            return (BaseService<Usuario>.QueryForObject("select_usuario_id", idUsuario));
        }
        

    }
}
