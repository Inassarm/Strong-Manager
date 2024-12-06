using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CoreApp.Services.Email;
using DataAccess.CRUD;
using DataAccess.DAOs;
using DTOs;
using GymAppWebApp_front.Services.Email;

namespace CoreApp
{
    public class AuthenticationManager
    {
        public int userId { get; set; }
        public string? email { get; set; }
		public string? password { get; set; }

        public void SendTokenRecovery(string email, string token)
        {
            var uCrud = new UserCrudFactory();
            var existingEmail = uCrud.RetrieveByEmail(email);

            if (existingEmail != null)
            {
                //Llamada a funcion de correo
                EmailController mail = new EmailController();
                mail.emailPasswordRecovery(email,token);

            }
            else {
                throw new Exception("Ingrese un correo valido");
            }
        }

        public void sendConfirmationEmail(string email, string token)
        {
            //Llamada a funcion de correo
            if (email != null)
            {
                //Llamada a funcion de correo
                EmailController mail = new EmailController();
                mail.sendConfirmationEmail(email, token);

            }
            else
            {
                throw new Exception("Ingrese un correo valido");
            }
        }

        public User AuthenticationLogIn(string email, string password)
        {
            
            var crud = new AuthenticationCrudFactory();

            return crud.AuthenticationLogIn(email, password);

            
        }

        public void UpdateUserPassword(int id, string password)
        {

            var crud = new AuthenticationCrudFactory();

            crud.updateUserPassword(id, password);

        }








        }
}
