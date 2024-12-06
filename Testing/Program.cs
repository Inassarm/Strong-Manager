using DataAccess.CRUD;
using DTOs;
using Newtonsoft.Json;
using System.Numerics;
using System.Reflection.Metadata;

public class Program
{
    static void Main(string[] args)
    {
        while (true) {
        Console.WriteLine("Seleccione una opción:");
        Console.WriteLine("0. Create User");
        Console.WriteLine("1. Retrieve All Users");
        Console.WriteLine("2. Retrieve By UserCode");
        Console.WriteLine("3. RetrieveByNameOrLastName");
        Console.WriteLine("4. Update User");
        Console.WriteLine("5. Delete User");
        Console.WriteLine("6. Ingrese otra opción");
        Console.WriteLine("7. SALIR");

        int num = int.Parse(Console.ReadLine());

        switch (num)
        {
            case 0:
                CreateUser();
                break;
            case 1:
                RetrieveAllUsers();
                break;
            case 2:
                RetrieveByUserCode();
                break;
            case 3:
                RetrieveByNameOrLastName();
                break;
            case 4:
                UpdateUser();
                break;
            case 5:
                DeleteUser();
                break;
            case 6:
                Console.WriteLine("Ingrese otra opción");
                break;
            case 7:
                Console.WriteLine("Haz salido del sistema");
                    return;
                

        }



        static void RetrieveAllUsers()
        {
            Console.WriteLine("Retrieve all users");

            var uCrud = new UserCrudFactory();

            var lst = uCrud.RetrieveAll<User>();
            foreach (User user in lst)
            {
                Console.WriteLine(JsonConvert.SerializeObject(user));

            }
        }

        static void CreateUser()
        {
            Console.WriteLine("Creating User ---TEST--");
            Console.WriteLine("ENTER USER CODE");
            var userCode = Console.ReadLine();
            Console.WriteLine("ENTER USER NAME");
            var userName = Console.ReadLine();
            Console.WriteLine("ENTER USER LastName");
            var userLastName = Console.ReadLine();
            Console.WriteLine("ENTER USER EMAil");
            var userEmail = Console.ReadLine();

            Console.WriteLine("ENTER USER PHONE NUMBER");
            var userPhoneNumber = Console.ReadLine();


            Console.WriteLine("ENTER USER BIRTHDATE DD-MM-YYYY");
            var userBirthDate = Console.ReadLine();
            Console.WriteLine("ENTER USER PASSWORD");
            var userPassword = Console.ReadLine();

            var newUser = new User()
            {
                UserCode = userCode,
                Password = userPassword,
                Name = userName,
                LastName = userLastName,
                Email = userEmail,
                PhoneNumber = int.Parse(userPhoneNumber),
                BirthDate = DateTime.Parse(userBirthDate),

            };
            try
            {
                var ucrud = new UserCrudFactory();
                ucrud.Create(newUser);
                Console.WriteLine("*user created*");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            Console.ReadLine();
        }
        static void RetrieveByUserCode()
        {

            Console.WriteLine("Enter User Code To search");
            var uCode = Console.ReadLine();
            var uCrud = new UserCrudFactory();
            var lst = uCrud.RetrieveByUserCode(uCode);
            if (lst == null)
            {
                Console.WriteLine("USER NOT FOUND");
            }
            else
            {
                Console.WriteLine(JsonConvert.SerializeObject(lst));
            }
        }

        static void RetrieveByNameOrLastName()
        {
            Console.WriteLine("Enter Name or Last Name To search");
            var uCode = Console.ReadLine();
            var uCrud = new UserCrudFactory();
            var lst = uCrud.RetrieveByNameOrLastName(uCode);
            if (lst == null)
            {
                Console.WriteLine("USER NOT FOUND");
            }
            else
            {
                Console.WriteLine(JsonConvert.SerializeObject(lst));
            }
        }

        static void UpdateUser()
        {
            Console.WriteLine("Updating User ---TEST--");

            Console.WriteLine("ENTER USER CODE YOU WANNA CHANGE");
            var userCode = Console.ReadLine();
            Console.WriteLine("ENTER NEW USER NAME ");
            var userName = Console.ReadLine();
            Console.WriteLine("ENTER NEW USER LastName");
            var userLastName = Console.ReadLine();
            Console.WriteLine("ENTER NEW USER EMAil");
            var userEmail = Console.ReadLine();

            Console.WriteLine("ENTER NEW USER PHONE NUMBER");
            var userPhoneNumber = Console.ReadLine();

            Console.WriteLine("ENTER NEW USER BIRTHDATE DD-MM-YYYY");
            var userBirthDate = Console.ReadLine();
            Console.WriteLine("ENTER NEW USER PASSWORD");
            var userPassword = Console.ReadLine();

            var newUser = new User()
            {
                UserCode = userCode,
                Password = userPassword,
                Name = userName,
                LastName = userLastName,
                Email = userEmail,
                PhoneNumber = int.Parse(userPhoneNumber),
                BirthDate = DateTime.Parse(userBirthDate),

            };
            try
            {
                var ucrud = new UserCrudFactory();
                ucrud.Update(newUser);
                Console.WriteLine("*user updated*");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            Console.ReadLine();
        }

            static void DeleteUser()
            {
                Console.WriteLine("Deleting User ---TEST--");

                Console.WriteLine("ENTER USER ID YOU WANNA Erase");
                var id = int.Parse(Console.ReadLine());
                

                var newUser = new User()
                {
                    Id = id,     

                };
                try
                {
                    var ucrud = new UserCrudFactory();
                    ucrud.Delete(newUser);
                    Console.WriteLine("*user erased*");
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


