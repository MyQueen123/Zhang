using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.Page
{
    public partial class SearchDetails : System.Web.UI.Page
    {
        BooksBll bbl = new BooksBll();
        public List<Books> ramdomBooks = new List<Books>();
        public string searchWord = "";
        public List<Books> searchList = new List<Books>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //随机显示3条数据
            DataSet ds1 = bbl.GetBooksByRandom(3);
            ramdomBooks = bbl.DataTableToList(ds1.Tables[0]);

            if (Request["zi"] != null) 
            {
                searchWord = Request["zi"];

                Maticsoft.Model.SearchDetails sd=new Maticsoft.Model.SearchDetails(){
                    KeyWords=searchWord,
                    SearchDateTime=DateTime.Now
                };
                new SearchDetailsBll().Add(sd);
            }
            DataSet ds = new BooksBll().searchResult(searchWord);
            searchList = new BooksBll().DataTableToList(ds.Tables[0]);

        }
    }
}