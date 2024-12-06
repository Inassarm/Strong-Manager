using DataAccess.CRUD;
using DTOs;
using Newtonsoft.Json;
using System.Reflection.Metadata;

public class Program_2
{

    static void Main(string[] args)
    {

        while (true)
        {

            Console.WriteLine("Seleccione una opción:");
            Console.WriteLine("0. Create Product");
            Console.WriteLine("1. Retrieve By Product Name");
            Console.WriteLine("2. Retrieve By Product Category");
            Console.WriteLine("3. Update Product");
            Console.WriteLine("4. Ingrese otra opción");
            Console.WriteLine("5. SALIR");

            int num = int.Parse(Console.ReadLine());

            switch (num)
            {
                case 0:
                    CreateProduct();
                    break;
                case 1:
                    RetrieveByName();
                    break;
                case 2:
                    RetrieveByCategory();
                    break;
                case 3:
                    UpdateProduct();
                    break;
                case 4:
                    Console.WriteLine("Ingrese otra opción");
                    break;
                case 5:
                    Console.WriteLine("Haz salido del sistema");
                    return;
            }


            static void RetrieveByCategory()
            {

                Console.WriteLine("Enter Product Category To search");
                var uCode = Console.ReadLine();
                var uCrud = new ProductCrudFactory();
                var lst = uCrud.RetrieveByCategory(uCode);
                if (lst == null)
                {
                    Console.WriteLine("CATEGORY NOT FOUND");
                }
                else
                {
                    Console.WriteLine(JsonConvert.SerializeObject(lst));
                }
            }

            static void RetrieveByName()
            {

                Console.WriteLine("Enter Product Name To search");
                var uCode = Console.ReadLine();
                var uCrud = new ProductCrudFactory();
                var lst = uCrud.RetrieveByName(uCode);
                if (lst == null)
                {
                    Console.WriteLine("PRODUCT NAME NOT FOUND");
                }
                else
                {
                    Console.WriteLine(JsonConvert.SerializeObject(lst));
                }
            }

            static void CreateProduct()
            {

                {
                    Console.WriteLine("Creating Product ---TEST--");
                    Console.WriteLine("ENTER PRODUCT NAME");
                    var name = Console.ReadLine();
                    Console.WriteLine("ENTER PRODUCT DESCRIPTION");
                    var description = Console.ReadLine();
                    Console.WriteLine("ENTER PRODUCT CATEGORY");
                    var category = Console.ReadLine();
                    Console.WriteLine("ENTER PRODUCT PRICE");
                    var price = Console.ReadLine();


                    var newProduct = new Product()
                    {
                        Name = name,
                        Description = description,
                        Category = category,
                        Price = int.Parse(price),

                    };
                    try
                    {
                        var ucrud = new ProductCrudFactory();
                        ucrud.Create(newProduct);
                        Console.WriteLine("*product created*");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                    Console.ReadLine();
                }


            }

            static void UpdateProduct()
            {

                {
                    Console.WriteLine("Updating Product ---TEST--");
                    Console.WriteLine("ENTER PRODUCT NAME YOU WANNA CHANGE");
                    var name = Console.ReadLine();

                    Console.WriteLine("ENTER NEW PRODUCT DESCRIPTION");
                    var description = Console.ReadLine();
                    Console.WriteLine("ENTER NEW PRODUCT CATEGORY");
                    var category = Console.ReadLine();
                    Console.WriteLine("ENTER NEW PRODUCT PRICE");
                    var price = Console.ReadLine();


                    var newProduct = new Product()
                    {
                        Name = name,
                        Description = description,
                        Category = category,
                        Price = int.Parse(price),

                    };
                    try
                    {
                        var ucrud = new ProductCrudFactory();
                        ucrud.Update(newProduct);
                        Console.WriteLine("*product created*");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                    Console.ReadLine();
                }


            }
        }
    }
}

