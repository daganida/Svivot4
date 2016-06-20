using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class MovieList : System.Web.UI.Page
    {
        LoginReference.LoginWebServiceSoapClient proxy;

        protected void Page_Load(object sender, EventArgs e)
        {
            
          
            try
            {
                proxy = new LoginReference.LoginWebServiceSoapClient();



            }
            catch (Exception err)
            {
                
            }


        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            //amount,date,descriptipm,director,imdb
            DataTable dt= new DataTable();
            TableRow columns = new TableRow();
            dt.Columns.Add("Id");
            dt.Columns.Add("Title");
            dt.Columns.Add("Length");
            dt.Columns.Add("Price");
            dt.Columns.Add("Mmount");
            dt.Columns.Add("Date");
            dt.Columns.Add("Description");
            dt.Columns.Add("Director");
            dt.Columns.Add("IMDB Score");
            
            for (int i = 0; i < 9; i++)
            {
                TableCell tc = new TableCell();
              
                tc.Text = dt.Columns[i].ToString();
                columns.Cells.Add(tc);

            }
            tbl1.Rows.Add(columns);
   
            char [] seperator = {'}','{'};
             string movies = proxy.GetMovies(txb1.Text);
            

             string[] firstStep = movies.Split(seperator);
             List<string> list = firstStep.ToList();
             list.RemoveAll(String.IsNullOrEmpty);
             for (int i=0 ; i < list.Count ;i++)
             {
                     dt.Rows.Add(list[i]);
                 
             }
             foreach (string row in list)
             {
                 string[] rowParts = row.Split('^');
                 TableRow tr = new TableRow();
                 for (int i = 0; i < dt.Columns.Count;i++ )
                 {
                     TableCell tCell = new TableCell();
                     tCell.Text = rowParts[i];
                     tr.Cells.Add(tCell);                     
                 }
                 tbl1.Rows.Add(tr);
                 
           
             }
             
             //GenerateTable(dt);
            //first we add columns
          

            


             
             

            

            

        }
        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string tab = "\t";

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("<html>");
            sb.AppendLine(tab + "<body>");
            sb.AppendLine(tab + tab + "<table>");

            // headers.
            sb.Append(tab + tab + tab + "<tr>");

            foreach (DataColumn dc in dt.Columns)
            {
                sb.AppendFormat("<td>{0}</td>", dc.ColumnName);
            }

            sb.AppendLine("</tr>");

            // data rows
            foreach (DataRow dr in dt.Rows)
            {
                sb.Append(tab + tab + tab + "<tr>");

                foreach (DataColumn dc in dt.Columns)
                {
                    string cellValue = dr[dc] != null ? dr[dc].ToString() : "";
                    sb.AppendFormat("<td>{0}</td>", cellValue);
                }

                sb.AppendLine("</tr>");
            }

            sb.AppendLine(tab + tab + "</table>");
            sb.AppendLine(tab + "</body>");
            sb.AppendLine("</html>");
            return sb.ToString();
        }
        private void GenerateTable(DataTable dt)
        {


            Table table = new Table();

            TableRow row = null;



            //Add the Headers

            row = new TableRow();

            for (int j = 0; j < dt.Columns.Count; j++)
            {

                TableHeaderCell headerCell = new TableHeaderCell();

                headerCell.Text = dt.Columns[j].ColumnName;

                row.Cells.Add(headerCell);

            }

            table.Rows.Add(row);



            //Add the Column values

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                row = new TableRow();

                for (int j = 0; j < dt.Columns.Count; j++)
                {

                    TableCell cell = new TableCell();

                    cell.Text = dt.Rows[i][j].ToString();

                    row.Cells.Add(cell);

                }

                // Add the TableRow to the Table

                table.Rows.Add(row);

            }

            // Add the the Table in the Form

            form1.Controls.Add(table);

        }
    }
}