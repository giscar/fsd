﻿using System;
namespace PE.COM.FSD.Web.util
{
    public class Constantes
    {
        public enum EstadoFlag
        {
            ACTIVO = 1,
            INACTIVO = 0
        }

        public enum PerfilFlag
        {
            ADMINISTRADOR = '1'
        }

        public const String PaginaInicioLogin = "../pages/login.aspx";
        public const String codigoPerfilAdministrador = "1";
        public const String codigoPerfilGestor = "2";
        public const String selectValueDefault = "0";
        public const String selectLabelDefault = "Seleccione";
    }
}
