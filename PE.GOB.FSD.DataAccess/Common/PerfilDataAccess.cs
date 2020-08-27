﻿using System;
using System.Collections.Generic;
using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Mapper;

namespace PE.GOB.FSD.DataAccess.Common
{
    public class PerfilDataAccess
    {
        public List<Perfil> ListarPorPerfil()
        {
            return (BaseService<Perfil>.QueryForList("select_perfil", null));
        }

        public int GuardarPerfil(Perfil _perfil)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_perfil", _perfil)));
        }

        public Perfil PerfilForId(int _idPerfil)
        {
            return (BaseService<Perfil>.QueryForObject("select_perfil_id", _idPerfil));
        }

        public void ActualizarPerfil(Perfil _perfil)
        {
            MapperPro.Instance().Update("update_perfil", _perfil);
        }

        public void InactivarPerfil(Perfil _perfil)
        {
            MapperPro.Instance().Update("inactive_perfil", _perfil);
        }

    }
}
