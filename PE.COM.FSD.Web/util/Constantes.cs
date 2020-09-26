using System;
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

        public enum Parametro
        {
            CLASIFICACION_RIESGO = 1,
            PORCENTAJE_COINCIDENCIA_OFICINAS = 2,
            DEUDA_FSD = 3
        }

        public const String PaginaInicioLogin = "../pages/login.aspx";
        public const String codigoPerfilAdministrador = "1";
        public const String codigoPerfilGestor = "2";
        public const String selectValueDefault = "0";
        public const String selectLabelDefault = "Seleccione";

        public const String SELECCION_DEFECTO_CLASIFICACION_RIESGO = "B";
        public const String SELECCION_DEFECTO_PORCENTAJE_COINCIDENCIA_OFICINAS = "75%";
        public const String SELECCION_DEFECTO_DEUDA_FSD = "NO";

        public const String MensajeComboRegistro = "- Seleccione -";
        public const String MensajeComboReporte = "- Todos -";

        public const String textoSubject = "Creación de usuario del modulo de CONTRALAFT";
        public const String estadoPlanBORRADOR = "Borrador";
        public const String estadoPlanPUBLICADO = "Publicado";


    }
}
