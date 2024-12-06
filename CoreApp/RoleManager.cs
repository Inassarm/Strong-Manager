using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class RoleManager
    {
        public void Create(Role role)
        {
            var rCrud = new RoleCrudFactory();
            rCrud.Create(role);
        }

        public List<Role> RetrieveAll()
        {
            var rCrud = new RoleCrudFactory();
            return rCrud.RetrieveAll<Role>();
        }

        public Role RetrieveById(int id)
        {
            var rCrud = new RoleCrudFactory();
            return rCrud.RetrieveById<Role>(id);
        }

        public void Update(Role role)
        {
            var rCrud = new RoleCrudFactory();
            rCrud.Update(role);
        }

        public void Delete(Role role)
        {
            var rCrud = new RoleCrudFactory();
            rCrud.Delete(role);
        }
    }
}