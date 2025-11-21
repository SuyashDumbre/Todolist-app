using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Todolist
{
    public partial class Managetask : System.Web.UI.Page
    {
        string connStr = @"Data Source=DESKTOP-VQ61BUK\SQLEXPRESS;Initial Catalog=todoapp;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["CurrentFilter"] = "All";
                ShowTasks();
            }
        }

        void ShowTasks()
        {
            string filter = ViewState["CurrentFilter"] as string ?? "All";
            BindTasks(filter);
        }

        void BindTasks(string filter)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Tasks WHERE UserID = @UserID";

                if (filter == "Completed")
                {
                    query += " AND IsCompleted = 1";
                }
                else if (filter == "Pending")
                {
                    query += " AND IsCompleted = 0";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTasks.DataSource = dt;
                gvTasks.DataBind();

                lblTaskCount.Text = "Total Tasks: " + dt.Rows.Count;

                SetFilterButtons(filter);
            }
        }

        void SetFilterButtons(string active)
        {
            if (btnShowAll != null && btnShowCompleted != null && btnShowPending != null)
            {
                btnShowAll.CssClass = "btn-filter";
                btnShowCompleted.CssClass = "btn-filter";
                btnShowPending.CssClass = "btn-filter";

                if (active == "All")
                    btnShowAll.CssClass += " btn-filter-active";
                else if (active == "Completed")
                    btnShowCompleted.CssClass += " btn-filter-active";
                else if (active == "Pending")
                    btnShowPending.CssClass += " btn-filter-active";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string priority = ddlPriority.SelectedValue ?? "Medium";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Tasks (Title, Description, Priority, IsCompleted, CreatedDate, UserID) " +
                    "VALUES (@Title, @Description, @Priority, 0, @CreatedDate, @UserID)", con);

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Priority", priority);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Task added!";
            txtTitle.Text = "";
            txtDescription.Text = "";
            ddlPriority.SelectedValue = "Medium";

            ShowTasks();
        }

        protected void gvTasks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTasks.EditIndex = e.NewEditIndex;
            ShowTasks();

            // Set selected value in ddlPriorityEdit
            GridViewRow row = gvTasks.Rows[e.NewEditIndex];
            Label lblPriority = row.FindControl("lblPriority") as Label;
            DropDownList ddlPriorityEdit = row.FindControl("ddlPriorityEdit") as DropDownList;

            if (lblPriority != null && ddlPriorityEdit != null)
            {
                ListItem li = ddlPriorityEdit.Items.FindByValue(lblPriority.Text);
                if (li != null)
                {
                    ddlPriorityEdit.ClearSelection();
                    li.Selected = true;
                }
            }
        }

        protected void gvTasks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTasks.EditIndex = -1;
            ShowTasks();
        }

        protected void gvTasks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int taskId = Convert.ToInt32(gvTasks.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvTasks.Rows[e.RowIndex];

            // ✅ Title = cell[2], Description = cell[3] after adding Sr No + hidden TaskID
            string title = ((TextBox)row.Cells[2].Controls[0]).Text;
            string description = ((TextBox)row.Cells[3].Controls[0]).Text;

            CheckBox chk = row.FindControl("chkComplete") as CheckBox;
            bool isCompleted = chk != null && chk.Checked;

            DropDownList ddlPriorityEdit = row.FindControl("ddlPriorityEdit") as DropDownList;
            string priority = ddlPriorityEdit != null ? ddlPriorityEdit.SelectedValue : "Medium";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Tasks SET Title = @Title, Description = @Description, Priority = @Priority, IsCompleted = @IsCompleted " +
                    "WHERE TaskID = @TaskID AND UserID = @UserID", con);

                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Priority", priority);
                cmd.Parameters.AddWithValue("@IsCompleted", isCompleted);
                cmd.Parameters.AddWithValue("@TaskID", taskId);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvTasks.EditIndex = -1;
            lblMessage.Text = "Task updated!";
            ShowTasks();
        }

        protected void gvTasks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int taskId = Convert.ToInt32(gvTasks.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Tasks WHERE TaskID = @TaskID AND UserID = @UserID", con);

                cmd.Parameters.AddWithValue("@TaskID", taskId);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Task deleted!";
            ShowTasks();
        }

        protected void gvTasks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Completed row style
                bool isCompleted = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsCompleted"));
                if (isCompleted)
                {
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                    e.Row.Font.Strikeout = true;
                }

                // ✅ Priority badge styling
                Label lblPriority = e.Row.FindControl("lblPriority") as Label;
                if (lblPriority != null)
                {
                    string priority = lblPriority.Text;

                    if (priority == "High")
                        lblPriority.CssClass += " priority-high";
                    else if (priority == "Medium")
                        lblPriority.CssClass += " priority-medium";
                    else if (priority == "Low")
                        lblPriority.CssClass += " priority-low";
                }
            }
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "All";
            ShowTasks();
        }

        protected void btnShowCompleted_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "Completed";
            ShowTasks();
        }

        protected void btnShowPending_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "Pending";
            ShowTasks();
        }
    }
}
