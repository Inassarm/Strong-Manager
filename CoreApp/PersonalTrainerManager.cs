using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class PersonalTrainerManager
    {

        //private readonly EmployeeManager _employeeManager;
        //private readonly ClientManager _clientManager;
        private readonly UserManager _userManager;

        public PersonalTrainerManager() { }

        public PersonalTrainerManager(UserManager userManager)
        {
            _userManager = userManager;
        }

        public void Create(PersonalTrainer personalTrainer)
        {

            var aCrud = new PersonalTrainerCrudFactory();
            //isAppointmentValid(appointment);
            aCrud.Create(personalTrainer);

        }

        public List<PersonalTrainer> RetrieveAll()
        {

            var aCrud = new PersonalTrainerCrudFactory();
            var personalTrainerList = aCrud.RetrieveAll<PersonalTrainer>();

            return personalTrainerList;

        }

        public PersonalTrainer RetrieveById(int id)
        {

            var aCrud = new PersonalTrainerCrudFactory();
            var personalTrainer = aCrud.RetrieveById<PersonalTrainer>(id);

            return personalTrainer;

        }

        public void Update(PersonalTrainer personalTrainer)
        {

            var aCrud = new PersonalTrainerCrudFactory();
            aCrud.Update(personalTrainer);

        }

        public void DeleteById(PersonalTrainer personalTrainer)
        {
            var aCrud = new PersonalTrainerCrudFactory();
            aCrud.Delete(personalTrainer);
        }

        public List<PersonalTrainer> RetrieveByUserId(int fkIdUser)
        {
            var ugCrud = new PersonalTrainerCrudFactory();
            return ugCrud.RetrieveByUserId<PersonalTrainer>(fkIdUser);
        }

        #region Validaciones


        //public static void isAppointmentValid(Appointment appointment)
        //{

        //    if (!IsValidDay(appointment))
        //    {
        //        throw new Exception("Appointment is not valid");
        //    }


        //}


        //Para corregir en caso de que el día no tenga tilde

        //public static string FixAccent(string day)
        //{
        //    if (string.IsNullOrWhiteSpace(day))
        //    {
        //        return day;
        //    }

        //    // Diccionario para corregir días de la semana sin tildes
        //    Dictionary<string, string> corrections = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        //{
        //    { "miercoles", "miércoles" },
        //    { "sabado", "sábado" },
        //    // Puedes añadir más correcciones si es necesario
        //};

        //    // Validar si el día necesita corrección
        //    if (corrections.ContainsKey(day))
        //    {
        //        return corrections[day];
        //    }

        //    return day;
        //}


        //Para validar la hora de la semana

        //public static bool IsHourValid(Appointment appointment)
        //{
        //    DateTime hour = appointment.Hour;
        //    // Definir el rango de horas válidas
        //    DateTime inicio = DateTime.Today.AddHours(6); // 6:00 AM
        //    DateTime fin = DateTime.Today.AddHours(19);  // 7:00 PM

        //    // Validar si la hora está dentro del rango
        //    return hour.TimeOfDay >= inicio.TimeOfDay && hour.TimeOfDay <= fin.TimeOfDay;
        //}

        ////Para validar  el día de la semana
        //public static bool IsValidDay(Appointment appointment)
        //{
        //    var day = FixAccent(appointment.Day);

        //    //valido primero que no sea nulo
        //    if (string.IsNullOrWhiteSpace(day))
        //    {
        //        return false;
        //    }
        //    //string para comparar que pertenezca a un día de la semana
        //    string[] daysWeek = new string[]
        //        {
        //            "lunes", "martes", "miércoles", "jueves", "viernes", "sábado", "domingo"
        //        };


        //    // Validar si el día está en la lista de días de la semana
        //    foreach (string currentDay in daysWeek)
        //    {
        //        if (day.Equals(currentDay, StringComparison.OrdinalIgnoreCase))
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        #endregion



    }
}
