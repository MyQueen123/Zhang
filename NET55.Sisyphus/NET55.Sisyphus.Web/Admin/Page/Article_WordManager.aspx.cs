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
    public partial class Article_WordManager : BaseCheckAdmin
    {
        public List<Articel_Words> wordList = new List<Articel_Words>();
        public int pageIndex;
        public int pageSize = 6;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            Articel_WordsBll awbb = new Articel_WordsBll();
            string index = Request["index"];
            if (string.IsNullOrEmpty(index))
            {
                pageIndex = 1;
            }
            else {
                pageIndex = Convert.ToInt32(index);
            }
            //总页数
            int total = awbb.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total/pageSize));
            //集合
            DataSet ds = awbb.GetListByPage("", "", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
            wordList = awbb.DataTableToList(ds.Tables[0]);
        }
    }
}