using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Client: User // Hereda de user
    {
        public int IdClient { get; set; }
        public string Status {  get; set; }
        public DateTime PaymentDate { get; set; }
        
    }
}
