using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    //Clase de negocio donde se aplican validaciones, de forma y de fondo
    public class ProductManager
    {
        public void Create(Product product)
        {
            if (IsPriceValid(product.Price) == false)
            {
                throw new Exception("Price is invalid");
            }
            if (IsDescriptionValid(product.Description) == false)
            {

                {
                    throw new Exception("Description invalid. ");


                }
            }
            var uCrud = new ProductCrudFactory();
            uCrud.Create(product);
        }
        public List<Product> RetrieveAll()
        {
            var uCrud = new ProductCrudFactory();
            return uCrud.RetrieveAll<Product>();

        }

        private bool IsPriceValid(double price)
        {
            const double MinPrice = 0;
            const double MaxPrice = 1500000;
            return price >= MinPrice && price <= MaxPrice;
        }
        public Product RetrieveById(int id)
        {
            var uCrud = new ProductCrudFactory();
            return uCrud.RetrieveById<Product>(id);

        }

        private bool IsDescriptionValid(string description)
        {
            if (description == null)
            {
                return false;
            }
            return description.Length >= 10;
        }

        public void Update(Product product)
        {
            var uCrud = new ProductCrudFactory();
            uCrud.Update(product);
        }

        public void Delete(Product product)
        {
           
            var uCrud = new ProductCrudFactory();
            uCrud.Delete(product);

        }
    }
}
