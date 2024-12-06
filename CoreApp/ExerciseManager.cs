using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class ExerciseManager
    {
        public void Create(Exercise exercise)
        {

            var uCrud = new ExerciseCrudFactory();
            uCrud.Create(exercise);
        }
        public List<Exercise> RetrieveAll()
        {
            var uCrud = new ExerciseCrudFactory();
            return uCrud.RetrieveAll<Exercise>();

        }
        public Exercise RetrieveById(int id)
        {
            var uCrud = new ExerciseCrudFactory();
            return uCrud.RetrieveById<Exercise>(id);

        }

        public void Update(Exercise exercise)
        {
            var uCrud = new ExerciseCrudFactory();
            uCrud.Update(exercise);
        }

        public void Delete(Exercise exercise)
        {

            var uCrud = new ExerciseCrudFactory();
            uCrud.Delete(exercise);

        }

        
    }
}
