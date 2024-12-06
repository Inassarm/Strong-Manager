using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Appointment : BaseDTO
    {

        public string Status { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan Hour { get; set; }

        public User? Trainer { get; set; }
        public User? Client { get; set; }



    }
}
