﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PE.COM.FSD.Entity.Common;
using PE.COM.FSD.DataAccess.Mapper;

namespace PE.COM.FSD.DataAccess.Common
{
    public class RolDataAccess
    {
        public List<Rol> ListarPorRol()
        {
            return (BaseService<Rol>.QueryForList("select_rol", null));
        }

        public Rol RolForId(int idRol)
        {
            return (BaseService<Rol>.QueryForObject("select_rol_id", idRol));
        }
        
        public int GuardarRol(Rol _rol)
        {
            return (Convert.ToInt32(MapperPro.Instance().Insert("insert_rol", _rol)));
        }

        public int ActualizarRol(Rol _rol)
        {
            return (Convert.ToInt32(MapperPro.Instance().Update("update_rol", _rol)));
        }

        public void InactivarRol(Rol _rol)
        {
            MapperPro.Instance().Update("inactive_rol", _rol);
        }
        
    }
}
