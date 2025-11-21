using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Todolist
{
    public partial class register : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            {
                label1.Visible = false;

                if (Request.QueryString["msg"] == "registered")
                {
                    label1.ForeColor = System.Drawing.Color.Green;
                    label1.Text = "User registered successfully! Please login.";
                    label1.Visible = true;
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            {
                string name = txtName.Text;      
                string email = txtEmail.Text;    
                string password = txtPassword.Text;

                string connStr = @"Data Source=DESKTOP-VQ61BUK\SQLEXPRESS;Initial Catalog=todoapp;Integrated Security=True";

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string insertQuery = "INSERT INTO Users (Name, Email, Password) VALUES (@Name, @Email, @Password)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        cmd.ExecuteNonQuery();

                        label1.ForeColor = System.Drawing.Color.Green;
                        label1.Text = "User registered successfully!";

                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtPassword.Text = "";

                        Response.Redirect("login.aspx?msg=registered");
                    }
                }
            }
        }
    }
}
