using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Admin.Page
{
    public partial class OrderManager : BaseCheckAdmin
    {
        public List<Orders> orderList = new List<Orders>();
        public UserAddressBll uab = new UserAddressBll();
        public UsersBll ub = new UsersBll();
        public int pageIndex;
        public int pageSize = 6;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            OrdersBll ob = new OrdersBll();

            string index = Request["index"];
            if (string.IsNullOrEmpty(index))
            {
                pageIndex = 1;
            }
            else
            {
                pageIndex = Convert.ToInt32(index);
            }
            //总页数
            int total = ob.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
            //集合
            DataSet ds = ob.GetListByPage("", "", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
            orderList = ob.DataTableToList(ds.Tables[0]);
        }
    }
}