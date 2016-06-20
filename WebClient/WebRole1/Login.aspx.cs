using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class Login : System.Web.UI.Page
    {
        LoginReference.LoginWebServiceSoapClient proxy;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            proxy = new LoginReference.LoginWebServiceSoapClient();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           

            try
            {
                string userName = txb1.Text;
                string password = txb2.Text;
                lblresult.Text = proxy.Login(userName,password);
                


            }
            catch (Exception err)
            {
                lblresult.Text = err.ToString();
            }

        }
    }
}