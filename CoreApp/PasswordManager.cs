using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{

    public class PasswordManager
    {
        public void Create(Password password)
        {
            Console.WriteLine("2");
            var pCrud = new PasswordCrudFactory();
            pCrud.Create(password);
        }

        public List<Password> RetrieveAll()
        {
            var pCrud = new PasswordCrudFactory();
            return pCrud.RetrieveAll<Password>();
        }

        public Password RetrieveById(int id)
        {
            var pCrud = new PasswordCrudFactory();
            return pCrud.RetrieveById<Password>(id);
        }

        public void Update(Password password)
        {
            var pCrud = new PasswordCrudFactory();
            pCrud.Update(password);
        }

        public void Delete(Password password)
        {
            var pCrud = new PasswordCrudFactory();
            pCrud.Delete(password);
        }

        private bool IsPasswordEncryptedValid(string passwordEncrypted)
        {
            if (string.IsNullOrEmpty(passwordEncrypted))
            {
                return false;
            }
            // Agregar otras validaciones necesarias para la contraseña encriptada
            return true;
        }


        public List<Password> RetrieveByFKIdUser(int fkIdUser)
        {
            var pCrud = new PasswordCrudFactory();
            return pCrud.RetrieveByFKIdUser(fkIdUser);
        }
    }
}
