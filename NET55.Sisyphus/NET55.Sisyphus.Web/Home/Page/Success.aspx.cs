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
    public partial class Success : System.Web.UI.Page
    {
        public Orders od = new Orders();
        public UserAddressBll uab = new UserAddressBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId=Request["orderId"];
           od= new Maticsoft.BLL.OrdersBll().GetModel(orderId);
            new OrdersBll().UpdateState(orderId);
        }
    }
}