using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class ClientManager
    {


        public void Create(Client client)
        {

            var cCrud = new ClientCrudFactory();
            //isClientValid(client);
            cCrud.Create(client);

        }

        public List<Client> RetrieveAll()
        {

            var cCrud = new ClientCrudFactory();
            var clientList = cCrud.RetrieveAll<Client>();




            return clientList;

        }

        public Client RetrieveById(int id)
        {

            var cCrud = new ClientCrudFactory();
            var client = cCrud.RetrieveById<Client>(id);

            return client;

        }



        public Client RetrieveByClientId(int id)
        {

            var cCrud = new ClientCrudFactory();
            var client = cCrud.RetrieveByClientId<Client>(id);

            return client;

        }

        public void Update(Client client)
        {

            var cCrud = new ClientCrudFactory();
            cCrud.Update(client);

        }

        public void Delete(Client client)
        {
            var cCrud = new ClientCrudFactory();
            cCrud.Delete(client);
        }
    }
}
