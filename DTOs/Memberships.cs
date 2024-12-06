using System;

namespace DTOs
{
    public class Membership : BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public Double Price { get; set; }
        public int GroupsLimit { get; set; }
    }
}
