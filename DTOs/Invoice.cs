using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Invoice : BaseDTO
    {
        public byte[] PdfDocument { get; set; }
        public byte[] XmlDocument { get; set; }
        public Payment payment { get; set; }

    }
}
