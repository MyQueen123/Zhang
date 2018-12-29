using Maticsoft.BLL;
using Maticsoft.Model;
using NET55.Sisyphus.Web.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Admin.Page
{
    public partial class AdvertisingManager : BaseCheckAdmin
    {
        public List<Ad> AdList = new List<Ad>();
        public int pageIndex;
        public int pageSize = 3;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            AdBll awbb = new AdBll();
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
            int total = awbb.GetRecordCount("IsDelete=0");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
            //集合
            DataSet ds = awbb.GetListByPage(" IsDelete=0", "", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
            AdList = awbb.DataTableToList(ds.Tables[0]);
        }
    }
}