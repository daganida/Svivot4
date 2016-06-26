using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WebRole2
{
    /// <summary>
    /// Summary description for LoginWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LoginWebService : System.Web.Services.WebService
    {



        [WebMethod]
        public string Login(string username, string password)
        {
            DataGridView dgv = new DataGridView();
            try{
                string conn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                //The query to use
                string query = "select * from dbo.Users";
                SqlConnection connection = new SqlConnection(conn);
                //Create a Data Adapter
                SqlDataAdapter dadapter = new SqlDataAdapter(query, connection);
                //Create the dataset
                DataSet ds = new DataSet();
                //Open the connection
                connection.Open();
                //Fill the Data Adapter
                dadapter.Fill(ds, "Users");
                connection.Close();
                //Bind the datagridview with the data set
                foreach (DataRow dw in ds.Tables[0].Rows)
                {
                    if (dw[1].Equals(username) && dw[2].Equals(password))
                    {
                        return "User Exist!";
                    }
                }
                return "User Name Or Password does not match!";
               

            }catch(Exception err) {
                return err.Message;
            }
            
        }
        
                [WebMethod]

        public string GetMovies(string substring)
        {
                    
            try
            {

                string ans = "";

                string conn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                //The query to use
                string query = "select * from dbo.Movies";
                SqlConnection connection = new SqlConnection(conn);
                //Create a Data Adapters
                SqlDataAdapter dadapter = new SqlDataAdapter(query, connection);
                //Create the dataset
                DataSet ds = new DataSet();
                //Open the connection
                connection.Open();
                //Fill the Data Adapter
                dadapter.Fill(ds, "Movies");
                connection.Close();
                //Bind the datagridview with the data set
                foreach (DataRow dw in ds.Tables[0].Rows)
                {
                    if (dw[1].ToString().ToLower().Contains(substring))
                    {
                        ans += "{" + dw[0] + "^" + dw[1] + "^" + dw[2] + "^" + dw[3] + "^" + dw[4] + "^" + dw[5] + "^" + dw[6] + "^+" + dw[7] + "^" + dw[8] + "}";
                    }
                }
                return ans;
            }
            catch (Exception err)
            {
                return err.Message.ToString();
            }

        }
    

        

    }
}
