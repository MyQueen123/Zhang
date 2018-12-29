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
    public partial class OrderDetails : System.Web.UI.Page
    {
        public List<OrderBook> orderbookList = new List<OrderBook>();
        public BooksBll bbll = new BooksBll();
        public int pageIndex;
        public int pageSize = 6;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderBookBll obbll = new OrderBookBll();
            string orderId=Request["OrderId"];

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
            int total = obbll.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
            //集合
            DataSet ds = obbll.GetListByPage("OrderId='" + orderId + "'", "Id", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
            orderbookList = obbll.DataTableToList(ds.Tables[0]);
        }
    }
}