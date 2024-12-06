using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Employee: User // Hereda de Usuario y Usuario a su vez de Base DTO
    {
        public int IdEmployee { get; set; }
        public DateTime HiringDate { get; set; }
        

    }
}
