#pragma warning disable 1591

using System;

namespace PE.COM.FSD.Entity.Core
{
    public class Deuda
    {
        public int Id { get; set; }
        public int IdTipo { get; set; }
        public string Entidad { get; set; }
        public int IdConcepto { get; set; }
        public string Concepto { get; set; }
        public string Observacion { get; set; }
        public int Monto { get; set; }
        public int Estado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FecCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FecModificacion { get; set; }
    }
}

#pragma warning restore 1591