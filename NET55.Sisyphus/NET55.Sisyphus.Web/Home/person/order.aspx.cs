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
    public partial class order : System.Web.UI.Page
    {
        //所有订单
        public List<Orders> allorders = new List<Orders>();
        //未付款订单
        public List<Orders> nopayorders = new List<Orders>();
        //已付款订单
        public List<Orders> payorders = new List<Orders>();
        //订单详细信息
        public OrderBookBll obb = new OrderBookBll();
        //图书信息
        public BooksBll bbll = new BooksBll();
        //书籍类型
        public CategoriesBll cbll = new CategoriesBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            OrdersBll ob=new OrdersBll();
            Users u=(Users)Session["user"];
            allorders = ob.GetModelList("UserId=" + u.Id + " and state=0 or state=1");
            nopayorders = ob.GetModelList("UserId=" +u.Id + " and state=0");
            payorders = ob.GetModelList("UserId=" + u.Id + " and state=1");
        }
    }
}