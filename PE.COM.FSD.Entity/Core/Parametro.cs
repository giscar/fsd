using System;
using PE.COM.FSD.Entity.Common;

namespace PE.COM.FSD.Entity.Core
{
    public class Parametro : EntidadAuditoriaComun
    {
        public int IdParametro { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
    }
}
