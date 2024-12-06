using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using iTextSharp.text.pdf;
using System.Threading.Tasks;
using iTextSharp.text;
using DTOs;

namespace CoreApp.Reciept
{
    public class PDFFile
    {
        private readonly MemoryStream _memoryStream;

        public PDFFile()
        {
            _memoryStream = new MemoryStream();
        }

        public byte[] GeneratePdf(Payment payment)
        {
            var document = new iTextSharp.text.Document(PageSize.A4);
            PdfWriter.GetInstance(document, _memoryStream);
            document.Open();

            // Add title
            var titleFont = FontFactory.GetFont("Arial", 16, Font.BOLD);
            document.Add(new Paragraph("Invoice", titleFont));
            document.Add(new Paragraph(" "));

            // Add user details
            var normalFont = FontFactory.GetFont("Arial", 12);
            document.Add(new Paragraph($"Client Name: {payment.Client.Name} {payment.Client.LastName} {payment.Client.LastName2}", normalFont));
            document.Add(new Paragraph($"Client email: {payment.Client.Email}", normalFont));
            document.Add(new Paragraph($"Client Phone Number: {payment.Client.PhoneNumber}", normalFont));
            document.Add(new Paragraph(" "));

            // Add payment details
            document.Add(new Paragraph($"Date: {payment.CreationDate:yyyy-MM-dd}", normalFont));
            document.Add(new Paragraph($"Status: {payment.Status}", normalFont));
            document.Add(new Paragraph($"Method: {payment.Method}", normalFont));
            document.Add(new Paragraph($"Amount: {payment.Amount:C}", normalFont));
            document.Add(new Paragraph($"Enrollment Fee: {payment.EnrollmentFee:C}", normalFont));
            document.Add(new Paragraph(" "));

            // Add membership details
            document.Add(new Paragraph("Membership Details:", titleFont));
            document.Add(new Paragraph($"Name: {payment.Membership.Name}", normalFont));
            document.Add(new Paragraph($"Description: {payment.Membership.Description}", normalFont));
            document.Add(new Paragraph($"Price: {payment.Membership.Price:C}", normalFont));

            // Close the document
            document.Close();

            // Return the byte array
            return _memoryStream.ToArray();
        }
    }

}
