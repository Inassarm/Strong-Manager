using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class MeasurementManager
    {
        public void Create(Measurement measurement)
        {
            var uCrud = new MeasurementCrudFactory();
            uCrud.Create(measurement);
        }

        public List<Measurement> RetrieveAll()
        {
            var uCrud = new MeasurementCrudFactory();
            return uCrud.RetrieveAll<Measurement>();
        }

        public Measurement RetrieveById(int id)
        {
            var uCrud = new MeasurementCrudFactory();
            return uCrud.RetrieveById<Measurement>(id);
        }

        public Measurement RetrieveByAppointmentId(int id)
        {
            var uCrud = new MeasurementCrudFactory();
            return uCrud.RetrieveByAppointmentId<Measurement>(id);
        }

        public void Update(Measurement measurement)
        {
            var uCrud = new MeasurementCrudFactory();
            uCrud.Update(measurement);
        }

        public void Delete(Measurement measurement)
        {
            var uCrud = new MeasurementCrudFactory();
            uCrud.Delete(measurement);
        }
        public List<Measurement> RetrieveByUser(int fkIdUser)
        {
            var ugCrud = new MeasurementCrudFactory();
            return ugCrud.RetrieveByUser<Measurement>(fkIdUser);
        }
    }
}
