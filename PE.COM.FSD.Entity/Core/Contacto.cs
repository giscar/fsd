#pragma warning disable 1591

using System;

namespace PE.COM.FSD.Entity.Core
{
    public class Contacto
    {
        public int Id { get; set; }
        public int IdEntidad { get; set; }
        public int IdCargo { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string DNI { get; set; }
        public string Celular { get; set; }
        public string TelefonoFijo { get; set; }
        public int Estado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FecCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FecModificacion { get; set; }

    }
}
#pragma warning restore 1591