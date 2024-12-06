using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class InactiveDiscountManager
    {
        public void Create(InactiveDiscount inactiveDiscount)
        {

            var uCrud = new InactiveDiscountCrudFactory();
            uCrud.Create(inactiveDiscount);
        }
        public List<InactiveDiscount> RetrieveAll()
        {
            var uCrud = new InactiveDiscountCrudFactory();
            return uCrud.RetrieveAll<InactiveDiscount>();

        }
        public InactiveDiscount RetrieveById(int id)
        {
            var uCrud = new InactiveDiscountCrudFactory();
            return uCrud.RetrieveById<InactiveDiscount>(id);

        }

        public void Update(InactiveDiscount inactiveDiscount)
        {
            var uCrud = new InactiveDiscountCrudFactory();
            uCrud.Update(inactiveDiscount);
        }

        public void Delete(InactiveDiscount inactiveDiscount)
        {

            var uCrud = new InactiveDiscountCrudFactory();
            uCrud.Delete(inactiveDiscount);

        }
    }
}
