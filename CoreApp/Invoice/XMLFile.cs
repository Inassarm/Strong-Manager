using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using DTOs;

namespace CoreApp.Reciept
{
    public class XMLFile
    {
        private readonly MemoryStream _memoryStream;

        public XMLFile()
        {
            _memoryStream = new MemoryStream();
        }

        public byte[] GenerateXml(Payment payment)
        {
            using (var writer = XmlWriter.Create(_memoryStream, new XmlWriterSettings { Encoding = System.Text.Encoding.UTF8, Indent = true }))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("Invoice");

                // Client Information
                writer.WriteStartElement("Client");
                writer.WriteElementString("ClientName", $"{payment.Client.Name} {payment.Client.LastName} {payment.Client.LastName2}");
                writer.WriteElementString("ClientEmail", payment.Client.Email);
                writer.WriteElementString("ClientPhoneNumber", payment.Client.PhoneNumber.ToString());
                writer.WriteEndElement();

                // Payment Information
                writer.WriteStartElement("Payment");
                writer.WriteElementString("CreationDate", payment.CreationDate.ToString("yyyy-MM-dd"));
                writer.WriteElementString("Status", payment.Status);
                writer.WriteElementString("Method", payment.Method);
                writer.WriteElementString("Amount", payment.Amount.ToString("C"));
                writer.WriteElementString("EnrollmentFee", payment.EnrollmentFee.ToString("C"));
                writer.WriteEndElement();

                // Membership Information
                writer.WriteStartElement("Membership");
                writer.WriteElementString("Name", payment.Membership.Name);
                writer.WriteElementString("Description", payment.Membership.Description);
                writer.WriteElementString("Price", payment.Membership.Price.ToString("C"));
                writer.WriteEndElement();

                writer.WriteEndElement();
                writer.WriteEndDocument();
            }

            // Return the byte array
            return _memoryStream.ToArray();
        }

    }
}
