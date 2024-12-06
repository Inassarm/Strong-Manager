using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Exercise : BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
       
        public int IdEquipment { get; set; }


    }
}
