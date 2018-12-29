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
    public partial class SearchManager : BaseCheckAdmin
    {
       
        public int PageCount;
        public int PageIndex;
        public int PageSize = 6;
         
        public List<SearchDetails> SearchDetailsList = new List<SearchDetails>();

        protected void Page_Load(object sender, EventArgs e)
        {
            SearchDetailsBll sdb = new SearchDetailsBll();
            

            //获取当前页
            string index = Request["index"];

            if (string.IsNullOrEmpty(index))
            {
                PageIndex = 1;
            }
            else
            {
                PageIndex = Convert.ToInt32(index);
            }

            //获取总页数
            int total = sdb.GetRecordCount("");
            PageCount = Convert.ToInt32(Math.Ceiling((double)total / PageSize));

            DataSet ds = sdb.GetListByPage("", "", (PageIndex - 1) * PageSize + 1, PageIndex * PageSize);
            SearchDetailsList = sdb.DataTableToList(ds.Tables[0]);

           
        }
    }
}