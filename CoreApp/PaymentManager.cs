using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.CRUD;
using DTOs;

namespace CoreApp
{
    public class PaymentManager
    {
        public string Status { get; set; }
        public int MembershipId { get; set; }
        public string Method { get; set; }
        public double Amount { get; set; }
        public double EnrollmentFee { get; set; }
        public byte[]? Document { get; set; }
        public int clientId { get; set; }

        public void Create(string Status, int membershipId, string Method, double Amount, double EnrollmentFee, byte[] Document, int clientId)
        {
            var pCrud = new PaymentCrudFactory();
            pCrud.Create(Status, membershipId, Method, Amount, EnrollmentFee, Document, clientId);
        }

        public List<Payment> RetrieveAll()
        {
            var pCrud = new PaymentCrudFactory();
            return pCrud.RetrieveAll<Payment>();
        }

        public List<Payment> RetrievebyPaymentMethod(string method)
        {
            var pCrud = new PaymentCrudFactory();
            return pCrud.RetrieveByPaymentMethod<Payment>(method);
        }

        public void Delete(Payment payment)
        {
            var pCrud = new PaymentCrudFactory();
            pCrud.Delete(payment);
        }

        public void Update(Payment payment)
        {
            var pCrud = new PaymentCrudFactory();
            pCrud.Update(payment);
        }

        public List<Payment> RetrievePaymentsByUserId(int userId)
        {
            var pCrud = new PaymentCrudFactory();
            return pCrud.RetrievePaymentsByUserId<Payment>(userId);
        }

        public Payment RetrieveLastPaymentByUserId(int userId)
        {
            var pCrud = new PaymentCrudFactory();
            return pCrud.RetrieveLastPaymentByUserId<Payment>(userId);
        }

        public List<Payment> RetrieveByStatus(string status)
        {
            var pCrud = new PaymentCrudFactory();
            return pCrud.RetrieveByStatus<Payment>(status);
        }
    }
}