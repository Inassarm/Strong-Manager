using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class GroupsManager
    {
        private readonly UserManager _userManager;

        public GroupsManager() { }

        public GroupsManager(UserManager userManager)
        {
            _userManager = userManager;
        }

        public void Create(Groups group)
        {
            var gCrud = new GroupsCrudFactory();
            gCrud.Create(group);
        }

        public List<Groups> RetrieveAll()
        {
            var gCrud = new GroupsCrudFactory();
            var groupsList = gCrud.RetrieveAll<Groups>();
            return groupsList;
        }

        public Groups RetrieveById(int id)
        {
            var gCrud = new GroupsCrudFactory();
            var group = gCrud.RetrieveById<Groups>(id);
            return group;
        }

        public void Update(Groups group)
        {
            var gCrud = new GroupsCrudFactory();
            gCrud.Update(group);
        }
        public void Delete(Groups group)
        {

            var gCrud = new GroupsCrudFactory();
            gCrud.Delete(group);

        }

    }
}