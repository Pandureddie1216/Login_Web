using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace WebApplication20
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                BindClassDropdown();
            }
        }

        private void BindClassDropdown()
        {
            connection.Open();
            string query = "SELECT * FROM Class";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ClassDropdown.DataSource = reader;
            ClassDropdown.DataTextField = "ID";
            ClassDropdown.DataValueField = "Class";
            ClassDropdown.DataBind();
            ClassDropdown.Items.Insert(0, new ListItem("Select Class", ""));
            connection.Close();
        }

        private void LoadData()
        {
            connection.Open();
            string query = "SELECT * FROM Conductor";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridViewUsers.DataSource = dataTable;
            GridViewUsers.DataBind();
            connection.Close();
        }
        private void BindGridView()
        {
            try
            {


                connection.Open();
                    string query = "SELECT * FROM YourTableName"; // Replace with actual table name
                    SqlDataAdapter da = new SqlDataAdapter(query, connection);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["ImagePath"] != DBNull.Value)
                            {
                                string fullPath = row["ImagePath"].ToString();
                                string relativePath = fullPath.Substring(fullPath.IndexOf("ExtractedImages"));
                                row["ImagePath"] = relativePath;
                            }
                        }

                        GridViewUsers.DataSource = dt;
                        GridViewUsers.DataBind();
                    }
                    else
                    {
                        GridViewUsers.DataSource = null;
                        GridViewUsers.DataBind();
                    }
                }
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private void LoadData(string selectedClass)
        {
            try
            {
                string query = "SELECT * FROM Users WHERE class = @SelectedClass";


                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Add the selected class as a parameter to the command
                    cmd.Parameters.AddWithValue("@SelectedClass", selectedClass);

                    // Execute the query and fill the result into a DataTable
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    // Bind the data to the GridView
                    GridViewUsers.DataSource = dataTable;
                    GridViewUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur (e.g., connection issues)
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string selectedClass = ClassDropdown.SelectedValue;
            LoadData(selectedClass);
        }

        protected void DisplayAllData_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void GridViewUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    string columnValue = e.Row.Cells[i].Text;

                    // Check if the cell contains an image path
                    if (!string.IsNullOrEmpty(columnValue) && columnValue.Contains(@"\ExtractedImages\") && columnValue.EndsWith(".jpg"))
                    {
                        // Extract only the relative part of the path
                        string fileName = Path.GetFileName(columnValue);  // Extract "Sheet1_Image_1.jpg"
                        string relativePath = $"ExtractedImages/{fileName}"; // Convert to web URL

                        // Create an Image control dynamically
                        Image img = new Image();
                        img.ImageUrl = relativePath; // Use relative path
                        img.Width = Unit.Pixel(80);
                        img.Height = Unit.Pixel(80);

                        // Clear the text and add the image control
                        e.Row.Cells[i].Text = "";
                        e.Row.Cells[i].Controls.Add(img);
                    }
                }
            }
        }







    }
}
