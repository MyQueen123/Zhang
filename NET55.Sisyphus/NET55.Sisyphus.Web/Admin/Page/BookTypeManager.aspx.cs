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
    public partial class BookTypeManager :BaseCheckAdmin
    {
        public List<Categories> typeList = new List<Categories>();
        public int pageIndex;
        public int pageSize = 6;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriesBll cb = new CategoriesBll();

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
            int total = cb.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
            //集合
            DataSet ds = cb.GetListByPage("","",(pageIndex-1)*pageSize+1,pageIndex*pageSize);
            typeList = cb.DataTableToList(ds.Tables[0]);
        }
    }
}