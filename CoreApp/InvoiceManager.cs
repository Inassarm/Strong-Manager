using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.CRUD;
using DTOs;

namespace CoreApp
{
    public class InvoiceManager
    {
        public void storeInvoices(int paymentId, byte[] pdfDocument, byte[] xmlDocument)
        {
            var iCrud = new InvoiceCrudFactory();
            iCrud.storeInvoices(paymentId,pdfDocument,xmlDocument);
        }

    }
}
