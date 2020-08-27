using System;
using PE.GOB.FSD.Entity.Common;

namespace PE.GOB.FSD.Entity.Core
{
    public class ParametroValor : EntidadAuditoriaComun
    {
        public int IdParametroValor { get; set; }
        public int IdParametro { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Valor { get; set; }
    }
}
