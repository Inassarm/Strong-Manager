using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTOs
{
	public class Activity : BaseDTO
	{
		public int? Sets { get; set; }
		public int? Reps { get; set; }
		public int? RestTime { get; set; }
		public double? Time { get; set; }
		public double? Weight { get; set; }
		public Exercise Exercise { get; set; }
		public int RoutineId { get; set; }

	}
}
