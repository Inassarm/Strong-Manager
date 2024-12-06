using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class InactiveDiscount : BaseDTO
    {
        public int Value { get; set; }
        public int Months {get; set; }
    }
}
