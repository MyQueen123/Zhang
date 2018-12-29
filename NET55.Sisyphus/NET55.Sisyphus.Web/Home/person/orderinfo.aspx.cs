using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.person
{
    public partial class orderinfo : System.Web.UI.Page
    {
        public Users u = new Users();
        public Orders o = new Orders();
        public UserAddress ua = new UserAddress();
        public OrderBookBll obb = new OrderBookBll();
        public BooksBll bbll = new BooksBll();
        public string days = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Request["orderId"];

            int dizhiId= Convert.ToInt32(new OrdersBll().GetModel(orderId).PostAddress);
            ua = new UserAddressBll().GetModel(dizhiId);
            u = (Users)Session["user"];
            o = new OrdersBll().GetModel(orderId);

            switch (DateTime.Now.DayOfWeek) {
                case DayOfWeek.Monday:
                     days = "周一";
                    break;
                case DayOfWeek.Tuesday:
                    days = "周二";
                    break;
                case DayOfWeek.Wednesday:
                    days = "周三";
                    break;
                case DayOfWeek.Thursday:
                    days = "周四";
                    break;
                case DayOfWeek.Friday:
                    days = "周五";
                    break;
                case DayOfWeek.Saturday:
                    days = "周六";
                    break;
                case DayOfWeek.Sunday:
                    days = "周日";
                    break;
            }
        }
    }
}