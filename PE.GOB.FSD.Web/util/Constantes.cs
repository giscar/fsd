using System;
namespace PE.GOB.FSD.Web.util
{
    public class Constantes
    {
        public const String FuenteSIGSO = "SIGSO";
        public const String FuenteSISDEL = "SISDEL";
        public const string PrefijoSBS = "SBS";
        public const string PrefijoUIF = "UIF";
        public const string PrefijoSISDEL = "SISDEL";
        public const string pdfLogo = "sbs_logo.jpg";

        public const String MensajeComboRegistro = "- Seleccione -";
        public const String MensajeComboReporte = "- Todos -";

        public const String SELECCION_DEFECTO_CLASIFICACION_RIESGO = "B";
        public const String SELECCION_DEFECTO_PORCENTAJE_COINCIDENCIA_OFICINAS = "75%";
        public const String SELECCION_DEFECTO_DEUDA_FSD = "NO";

        public enum EstadoFlag
        {
            ACTIVO = 1,
            INACTIVO = 2
        }

        public enum Parametro
        {
            CLASIFICACION_RIESGO = 1,
            PORCENTAJE_COINCIDENCIA_OFICINAS = 2,
            DEUDA_FSD = 3
        }
    }
}
