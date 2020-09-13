#pragma warning disable 1591

using System;

namespace PE.COM.FSD.Entity.Common

{
    public class Ubigeo
    {
        public string IdDistrito { get; set; }
        public string IdProvincia { get; set; }
        public string IdDepartamento { get; set; }
        public string DesDistrito { get; set; }
        public string DesProvincia { get; set; }
        public string DesDepartamento { get; set; }
        public string Coordenadax { get; set; }
        public string Coordenaday { get; set; }
        public int FlagZoom { get; set; }
    }
}

#pragma warning restore 1591