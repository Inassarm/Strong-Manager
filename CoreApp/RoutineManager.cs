using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
	public class RoutineManager
	{
		private readonly ActivityManager _activityManager;

		public RoutineManager(ActivityManager activityManager)
		{
			_activityManager = activityManager;
		}

		public void Create(Routine routine)
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				tpCrud.Create(routine);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public List<Routine> RetrieveAll()
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				var routineList = tpCrud.RetrieveAll<Routine>();

				foreach (var routine in routineList)
				{
					var activities = _activityManager.RetrieveAllByRoutineId(routine.Id);
					routine.Activities = activities;
				}
				return routineList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public Routine RetrieveById(int id)
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				var routine = tpCrud.RetrieveById<Routine>(id);
				var activities = _activityManager.RetrieveAllByRoutineId(routine.Id);
				routine.Activities = activities;

				return routine;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void Update(Routine routine)
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				tpCrud.Update(routine);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void DeleteById(int routineId)
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				tpCrud.DeleteById(routineId);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public List<Routine> RetrieveAllByTrainingPlanId(int idTrainingPlan)
		{
			try
			{
				var tpCrud = new RoutineCrudFactory();
				var routineList = tpCrud.RetrieveAllByTrainingPlanId(idTrainingPlan);

				foreach (var routine in routineList)
				{
					var activities = _activityManager.RetrieveAllByRoutineId(routine.Id);
					routine.Activities = activities;
				}

				return routineList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	}
}