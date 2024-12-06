using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class EmployeeManager
    {


        public void Create(Employee employee)
        {

            var eCrud = new EmployeeCrudFactory();
            //isEmployeeValid(employee);
            eCrud.Create(employee);

        }

        public List<Employee> RetrieveAll()
        {

            var eCrud = new EmployeeCrudFactory();
            var employeeList = eCrud.RetrieveAll<Employee>();




            return employeeList;

        }

        public Employee RetrieveById(int id)
        {

            var eCrud = new EmployeeCrudFactory();
            var employee = eCrud.RetrieveById<Employee>(id);

            return employee;

        }

        

        public Employee RetrieveByEmployeeId(int id)
        {

            var eCrud = new EmployeeCrudFactory();
            var employee = eCrud.RetrieveByEmployeeId<Employee>(id);

            return employee;

        }

        public void Update(Employee employee)
        {

            var eCrud = new EmployeeCrudFactory();
            eCrud.Update(employee);

        }

        public void Delete(Employee employee)
        {
            var eCrud = new EmployeeCrudFactory();
            eCrud.Delete(employee);
        }


    }
}
