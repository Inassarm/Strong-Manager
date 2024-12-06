using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Coupon : BaseDTO
    {
        public String Code { get; set; }
        public int Value { get; set; }
        public DateTime ExpirationDate { get; set; }
        public int Uses { get; set; }
 

    }
}
