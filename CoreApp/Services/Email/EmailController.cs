using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using CoreApp.Reciept;
using DataAccess.CRUD;
using DTOs;
using GymAppWebApp_front.Services.Email;

namespace CoreApp.Services.Email
{
    public class EmailController
    {

        public void emailPasswordRecovery(string email, string token) {

            var mailArgs = new MailArguments
            {
                MailFrom = "Gym-App-Project2@outlook.com",
                Password = "GymApp2024",
                Name = "Strong Manager",
                MailTo = email,
                Subject = "Recuperación de Contraseña - Token de Verificación",
                Message = $@"
                <div style='font-family: Arial, sans-serif; color: #333;'>
                    <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                        <h2 style='color: #dd4142; margin: 1rem; padding: 1rem;'>Recuperación de Contraseña</h2>
                    </div>
                    <p>Hola usuario,</p>
                    <p>Hemos recibido una solicitud para restablecer la contraseña de su cuenta. A continuación, encontrará su código de verificación:</p>
                    <div style='font-size: 20px; font-weight: bold; margin: 20px 0; color: #dd4142;'>{token}</div>
                    <p>Ingrese este código en la aplicación para continuar con el proceso de restablecimiento de su contraseña.</p>
                    <p style='margin-top: 20px;'>Si no solicitó un restablecimiento de contraseña, por favor ignore este correo electrónico.</p>
                    <p>Atentamente,<br/>El equipo de Strong Manager</p>
                    <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                        <img src='/CoreApp/Services/Email/Img-logo/gym_logo.png' style='max-width: 150px;'>
                    </div>
                </div>
                ",
                Port = 587,
                SmtpHost = "smtp.office365.com"
                //Bcc = "<--BCC email id's separated by semicolon (;)-->"
            };

            List<Attachment> lstAttachments = new List<Attachment>{};

            //Dictionary<string, string> dictHeaders = new Dictionary<string, string>
            //{
            //{ "<--Key of the header-->", "<--Values of the header-->" }
            //};


            Mail.SendEMail(mailArgs, lstAttachments, true);
        }

        public void sendConfirmationEmail(string email, string token)
        {

            var mailArgs = new MailArguments
            {
                MailFrom = "Gym-App-Project2@outlook.com",
                Password = "GymApp2024",
                Name = "Strong Manager",
                MailTo = email,
                Subject = "Confirmación de Correo Electrónico",
                Message =$@"
                    <div style='font-family: Arial, sans-serif; color: #333;'>
                        <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                            <h2 style='color: #dd4142; margin: 1rem; padding: 1rem;'>Confirmación de Correo Electrónico</h2>
                        </div>
                        <p>Hola usuario,</p>
                        <p>Gracias por registrarse en nuestra aplicación. A continuación, encontrará su código de verificación para confirmar su dirección de correo electrónico:</p>
                        <div style='font-size: 20px; font-weight: bold; margin: 20px 0; color: #f44336;'>{token}</div>
                        <p>Ingrese este código en la aplicación para completar el proceso de verificación de su correo electrónico.</p>
                        <p style='margin-top: 20px;'>Si no solicitó esta verificación, por favor ignore este correo electrónico.</p>
                        <p>Atentamente,<br/>El equipo de Strong Manager</p>
                        <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                            <img src='/CoreApp/Services/Email/Img-logo/gym_logo.png' style='max-width: 150px;'>
                        </div>
                    </div>
                ",
                Port = 587,
                SmtpHost = "smtp.office365.com",
                //Bcc = "<--BCC email id's separated by semicolon (;)-->"
            };

            List<Attachment> lstAttachments = new List<Attachment> { };

            //Dictionary<string, string> dictHeaders = new Dictionary<string, string>
            //{
            //{ "<--Key of the header-->", "<--Values of the header-->" }
            //};


            Mail.SendEMail(mailArgs, lstAttachments, true);
        }

        public void sendInvoiceEmail(string email, byte[] pdfFile,byte[] xmlFile)
        {

            var mailArgs = new MailArguments
            {
                MailFrom = "Gym-App-Project2@outlook.com",
                Password = "GymApp2024",
                Name = "Strong Manager",
                MailTo = email,
                Subject = "Facturación de Membresía",
                Message = @"
                    <div style='font-family: Arial, sans-serif; color: #333;'>
                        <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                            <h2 style='color: #dd4142; margin: 1rem; padding: 1rem;'>Facturación de Membresía</h2>
                        </div>
                        <p>Hola,</p>
                        <p>Gracias por tu reciente transacción con nosotros. A continuación, encontrarás los documentos relacionados con tu membresía:</p>
                        <ul>
                            <li><strong>Factura PDF:</strong> Un documento PDF con los detalles de tu transacción.</li>
                            <li><strong>Factura XML:</strong> Un archivo XML con la información de la transacción.</li>
                        </ul>
                        <p>Si tienes alguna pregunta o necesitas asistencia adicional, no dudes en contactarnos.</p>
                        <p style='margin-top: 20px;'>Atentamente,<br/>El equipo de Strong Manager</p>
                        <div style='text-align: center; margin-bottom: 20px; background-color: #000000;'>
                            <img src='~/CoreApp/Services/Email/Img-logo/gym_logo.png' style='max-width: 150px;'>
                        </div>
                    </div>",
                Port = 587,
                SmtpHost = "smtp.office365.com",
                //Bcc = "<--BCC email id's separated by semicolon (;)-->"
            };

            var pdfAttachment = new Attachment(new MemoryStream(pdfFile), "Invoice.pdf", "application/pdf");
            var xmlAttachment = new Attachment(new MemoryStream(xmlFile), "Invoice.xml", "application/xml");

            List<Attachment> attachments = new List<Attachment> { pdfAttachment, xmlAttachment };

            //Dictionary<string, string> dictHeaders = new Dictionary<string, string>
            //{
            //{ "<--Key of the header-->", "<--Values of the header-->" }
            //};


            Mail.SendEMail(mailArgs, attachments, true);

        }

    }
}
