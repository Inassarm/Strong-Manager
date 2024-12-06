using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
    public class Groups : BaseDTO 
    {
        public string ClassName { get; set; }
        public string ClassDescription { get; set; }
        public int MaxCapacity { get; set; }
        public TimeSpan ClassTime { get; set; }
        public int ClassDuration { get; set; }
        public string Days { get; set; }

    }
}
