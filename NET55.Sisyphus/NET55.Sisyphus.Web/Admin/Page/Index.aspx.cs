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
    public partial class Index : BaseCheckAdmin
    {
        public List<Users> userList = new List<Users>();
        public UserAddressBll uab = new UserAddressBll();
        public UserStatesBll usb = new UserStatesBll();
        public int pageIndex;
        public int pageSize = 6;
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsersBll ub=new UsersBll();

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
            int total = ub.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
            //集合
            DataSet ds = ub.GetListByPage("", "id", (pageIndex-1)*pageSize+1, pageSize*pageIndex);
            userList = ub.DataTableToList(ds.Tables[0]);
        }
    }
}