using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Todolist
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
        // Read connection string safely from Web.config
            string connection = System.Configuration.ConfigurationManager.ConnectionStrings["todoappConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();
                string query = "SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // In real apps, hash this

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    
                    Session["UserID"] = result.ToString();

                    
                    Response.Redirect("managetask.aspx");
                }
                else
                {
                    label1.Text = "Invalid email or password.";
                    label1.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
