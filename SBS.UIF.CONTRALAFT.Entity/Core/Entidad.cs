#pragma warning disable 1591

using System;

namespace PE.GOB.FSD.Entity.Core
{
    public class Entidad
    {
        public int IdTipo { get; set; }
        public string DesTipo { get; set; }
        public string CodRuc { get; set; }
        public string Direccion { get; set; }
        public int Estado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FecRegistro { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FecModificacion { get; set; }
        public string IdDstro { get; set; }
        public string IdProv { get; set; }
        public string IdDpto { get; set; }
        public string Distrito { get; set; }
        public string Provincia { get; set; }
        public string Departamento { get; set; }
        public int FlActivo { get; set; } // vericar



    }
}
#pragma warning restore 1591