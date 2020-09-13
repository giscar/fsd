using System;
using PE.COM.FSD.Entity.Common;

namespace PE.COM.FSD.Entity.Core
{
    public class PreSeleccion
    {
        public int IdEntidad { get; set; }
        public string Nombre { get; set; }
        public string ClasificacionRiesgo { get; set; }
        public string PorcentajeOficinas { get; set; }
        public string DeudaFSD { get; set; }
        //inputs
        public int IdEntidadInput { get; set; }
        public string IndClasificadorInput { get; set; }
        public int PorcentajeOficinaInput { get; set; }
        public string IndDeudaFSDInput { get; set; }
    }
}
