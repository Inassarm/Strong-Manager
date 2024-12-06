using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Measurement : BaseDTO
    {
        public int Height { get; set; }
        public float Weight { get; set; }
        public float FatPercentage { get; set; }

        public float MusclePercentage { get; set; }
        public int IdAppointment { get; set; }
    }
}
