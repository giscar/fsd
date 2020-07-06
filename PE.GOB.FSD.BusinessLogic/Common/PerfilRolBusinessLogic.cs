using PE.GOB.FSD.Entity.Common;
using PE.GOB.FSD.DataAccess.Common;

namespace PE.GOB.FSD.BusinessLogic.Common
{
    public class PerfilRolBusinessLogic
    {
        private readonly PerfilRolDataAccess _perfilRolDataAccess;

        public PerfilRolBusinessLogic()
        {
            _perfilRolDataAccess = new PerfilRolDataAccess();
        
        }
        public void guardarPerfilRol(PerfilRol _perfilRol)
        {
            _perfilRolDataAccess.guardarPerfilRol(_perfilRol);
        }

    }
}
