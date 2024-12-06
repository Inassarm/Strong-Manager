using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class NewClientDiscountManager
    {
        public void Create(NewClientDiscount newClientDiscount)
        {

            var uCrud = new NewClientDiscountCrudFactory();
            uCrud.Create(newClientDiscount);
        }
        public List<NewClientDiscount> RetrieveAll()
        {
            var uCrud = new NewClientDiscountCrudFactory();
            return uCrud.RetrieveAll<NewClientDiscount>();

        }
        public NewClientDiscount RetrieveById(int id)
        {
            var uCrud = new NewClientDiscountCrudFactory();
            return uCrud.RetrieveById<NewClientDiscount>(id);

        }

        public void Update(NewClientDiscount newClientDiscount)
        {
            var uCrud = new NewClientDiscountCrudFactory();
            uCrud.Update(newClientDiscount);
        }

        public void Delete(NewClientDiscount newClientDiscount)
        {

            var uCrud = new NewClientDiscountCrudFactory();
            uCrud.Delete(newClientDiscount);

        }
    }
}
