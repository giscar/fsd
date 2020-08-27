using System;
namespace PE.GOB.FSD.Entity.Common
{
    public class EntidadAuditoriaComun
    {
        public int Estado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }
}
