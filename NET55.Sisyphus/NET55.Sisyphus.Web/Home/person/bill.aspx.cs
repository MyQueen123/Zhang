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
    public partial class bill : System.Web.UI.Page
    {
        public List<OrderBook> orderbookList = new List<OrderBook>();
        public decimal allbill = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Users u = (Users)Session["user"];
            //订单
            List<Orders> orderList= new OrdersBll().GetModelList("state=1 or state=2");
            foreach (var item in orderList)
            {
               orderbookList.AddRange(new OrderBookBll().GetModelList("OrderId='"+item.OrderId+"'"));
            }

            foreach (var ite in orderbookList)
            {
                allbill += (ite.Quantity * ite.UnitPrice);
            }
        }
    }
}