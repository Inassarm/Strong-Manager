using DataAccess.CRUD;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreApp
{
    public class CouponManager
    {
        public void Create(Coupon coupon)
        {
            var uCrud = new CouponCrudFactory();
            uCrud.Create(coupon);
        }

        public List<Coupon> RetrieveAll()
        {
            var uCrud = new CouponCrudFactory();
            return uCrud.RetrieveAll<Coupon>();
        }

        public Coupon RetrieveById(int id)
        {
            var uCrud = new CouponCrudFactory();
            return uCrud.RetrieveById<Coupon>(id);
        }

        public void Update(Coupon coupon)
        {
            var uCrud = new CouponCrudFactory();
            uCrud.Update(coupon);
        }

        public void Delete(int couponid)
        {
            var uCrud = new CouponCrudFactory();
            uCrud.Delete2(couponid);
        }

        public Coupon checkCoupon(string code) {

            var uCrud = new CouponCrudFactory();
            return uCrud.checkCoupon(code);
        }
    }
}

