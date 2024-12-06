using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace CoreApp
{
    // Clase de negocio donde se aplican validaciones, de forma y de fondo
    public class MembershipManager
    {
        public void Create(Membership membership)
        {
            var mCrud = new MembershipCrudFactory();
            if (IsNameValid(membership.Name) == false)
            {
                throw new Exception("Membership name is invalid");
            }
            else if (IsPriceValid(membership.Price) == false)
            {
                throw new Exception("Membership price is invalid");
            }
            else
            {
                mCrud.Create(membership);
            }
        }

        public List<Membership> RetrieveAll()
        {
            var mCrud = new MembershipCrudFactory();
            return mCrud.RetrieveAll<Membership>();
        }

        public Membership RetrieveById(int id)
        {
            var mCrud = new MembershipCrudFactory();
            return mCrud.RetrieveById<Membership>(id);
        }

        public void Update(Membership membership)
        {
            var mCrud = new MembershipCrudFactory();
            mCrud.Update(membership);
        }

        public void Delete(Membership membership)
        {
            var mCrud = new MembershipCrudFactory();
            mCrud.Delete(membership);
        }

        #region Validaciones

        private bool IsNameValid(string name)
        {
            return !string.IsNullOrEmpty(name);
        }

        private bool IsPriceValid(Double price)
        {
            return price > 0;
        }

        #endregion
    }
}
