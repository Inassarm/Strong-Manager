using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
	public class ActivityManager
	{
		private readonly ExerciseManager _exerciseManager;

		public ActivityManager(ExerciseManager exerciseManager)
		{
			_exerciseManager = exerciseManager;
		}
		public void Create(Activity activity)
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				aCrud.Create(activity);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public List<Activity> RetrieveAll()
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				var activityList = aCrud.RetrieveAll<Activity>();

				foreach (var activity in activityList)
				{
					var exercise = _exerciseManager.RetrieveById(activity.Exercise.Id);
					activity.Exercise = exercise;
				}

				return activityList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public Activity RetrieveById(int id)
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				var activity = aCrud.RetrieveById<Activity>(id);
				//var exercise = _exerciseManager.RetrieveById(activity.Exercise.Id);
				//activity.Exercise = exercise;

				return activity;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void Update(Activity activity)
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				aCrud.Update(activity);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void DeleteById(int activityId)
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				aCrud.DeleteById(activityId);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public List<Activity> RetrieveAllByRoutineId(int idRoutine)
		{
			try
			{
				var aCrud = new ActivityCrudFactory();
				var activityList = aCrud.RetrieveAllByRoutineId(idRoutine);
				foreach (var activity in activityList)
				{
					var exercise = _exerciseManager.RetrieveById(activity.Exercise.Id);
					activity.Exercise = exercise;
				}
				return activityList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	}
}