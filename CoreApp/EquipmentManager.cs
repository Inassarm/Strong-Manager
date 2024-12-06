using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class EquipmentManager
    {
        public void Create(Equipment equipment)
        {
            
            var uCrud = new EquipmentCrudFactory();
            uCrud.Create(equipment);
        }
        public List<Equipment> RetrieveAll()
        {
            var uCrud = new EquipmentCrudFactory();
            return uCrud.RetrieveAll<Equipment>();

        }
        public Equipment RetrieveById(int id)
        {
            var uCrud = new EquipmentCrudFactory();
            return uCrud.RetrieveById<Equipment>(id);

        }

        public void Update(Equipment equipment)
        {
            var uCrud = new EquipmentCrudFactory();
            uCrud.Update(equipment);
        }

        public void Delete(Equipment equipment)
        {

            var uCrud = new EquipmentCrudFactory();
            uCrud.Delete(equipment);

        }
    }
}
