using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace NET55.Sisyphus.Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            string path = Request.AppRelativeCurrentExecutionFilePath;
            Regex reg = new Regex(@"~/Home/Page/BookDetails_(\d+).aspx");
            Match ma = reg.Match(path);
            if (ma.Success) 
            {
                //改写url
                HttpContext.Current.RewritePath("/Home/Page/BookDetails.aspx?bookid="+ma.Groups[1].Value);
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}