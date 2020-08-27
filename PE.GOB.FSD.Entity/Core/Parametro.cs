using System;
using PE.GOB.FSD.Entity.Common;

namespace PE.GOB.FSD.Entity.Core
{
    public class Parametro : EntidadAuditoriaComun
    {
        public int IdParametro { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
    }
}
