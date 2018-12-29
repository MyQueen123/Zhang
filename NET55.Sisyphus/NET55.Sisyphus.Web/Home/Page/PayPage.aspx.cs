using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.Page
{
    public partial class PayPage : System.Web.UI.Page
    {
        public CartBll cb = new CartBll();
        public BooksBll bbll = new BooksBll();
        public List<OrderBook> oblist = new List<OrderBook>();
        public List<UserAddress> uadList = new List<UserAddress>();
        public UserAddress beginAddress = new UserAddress();
        public string orderId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //得到订单id
           orderId = Request["orderId"];
            //查询订单详细表
            oblist= new OrderBookBll().GetModelList("OrderId='"+orderId+"'");
            //查询用户收货地址表
            uadList = new UserAddressBll().GetModelList("UserId="+new OrdersBll().GetModel(orderId).UserId);
            //最开始加载时显示的地址
            int firstId = Convert.ToInt32(Request["firstaddress"]);

            
           beginAddress= new UserAddressBll().GetModel(firstId);
        }
    }
}