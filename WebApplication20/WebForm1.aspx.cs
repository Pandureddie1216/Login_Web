using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace WebApplication
{
    public partial class RegisterForm : Page
    {
        SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindClassDropdown();
                ToggleClassDropdown();


            }
        }
        private void submit_click(object sender, EventArgs e)
        {
            SubmitForm();
        }
           
      
        protected void Role_SelectedIndexChanged(object sender, EventArgs e)
        {
            ToggleClassDropdown();
        }

       
        private void ToggleClassDropdown()
        {
            if (role.SelectedValue == "Admin")
            {
                ClassDropdown.Enabled = false;
                ClassDropdown.SelectedValue = null;

            }
            if(role.SelectedValue == "User")
            {
                ClassDropdown.Enabled = true;   
            }
        }
        private void BindClassDropdown()
        {
            SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true");
            connection.Open();
            String query = "select *from CLass";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ClassDropdown.DataSource = reader;
            ClassDropdown.DataTextField = "ID";
            ClassDropdown.DataValueField = "Class";
            ClassDropdown.DataBind();
            ClassDropdown.Items.Insert(0, new ListItem("Select Class", ""));
        }

        protected void SubmitForm()
        {
            string Userid = ID.Value;
            string name = Name.Value;
            string email = Email.Value;
            string fatherName = FatherName.Value;
            string Role = role.SelectedValue;
            string className = (Role == "Admin") ? null : ClassDropdown.SelectedValue;
            string gender = string.Empty;

            // Get selected gender
            if (Male.Checked)
                gender = "Male";
            else if (Female.Checked)
                gender = "Female";

            string password = Password.Value;
            string confirmPassword = ConfirmPassword.Value;

            if (password != confirmPassword)
            {
                // Password and Confirm Password do not match
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            // Ensure the "Uploads" directory exists
            string uploadDirectory = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(uploadDirectory))
            {
                Directory.CreateDirectory(uploadDirectory);
            }

            // Handle file upload (Save the file path in the database)
            string filePath = string.Empty;
            if (ImageUpload.HasFile)
            {
                string fileName = ImageUpload.FileName;
                filePath = "~/Uploads/" + fileName;
                string fullPath = Server.MapPath(filePath);
                ImageUpload.SaveAs(fullPath);
            }

            bool isValid = true;

            if (string.IsNullOrEmpty(ID.Value))
            {
                IDError.Text = "ID is required.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(Name.Value))
            {
                NameError.Text = "Name is required.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(Email.Value))
            {
                EmailError.Text = "Email is required.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(FatherName.Value))
            {
                FatherNameError.Text = "Father's Name is required.";
                isValid = false;
            }

            if (role.SelectedValue == "")
            {
                RoleError.Text = "Role is required.";
                isValid = false;
            }

            if (role.SelectedValue == "User" && ClassDropdown.SelectedValue == "" )
            {
                ClassError.Text = "Class is required.";
                isValid = false;
            }

            if (!Male.Checked && !Female.Checked)
            {
                GenderError.Text = "Gender is required.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(Password.Value))
            {
                PasswordError.Text = "Password is required.";
                isValid = false;
            }

            if (Password.Value != ConfirmPassword.Value)
            {
                ConfirmPasswordError.Text = "Passwords do not match.";
                isValid = false;
            }
            if (!ImageUpload.HasFile)
            {
                // Display error message if no file is uploaded
                ImageUploadError.Text = "Image is required.";
                isValid = false;
            }




            if (isValid)
            {

                SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true");
                {
                    try
                    {
                        connection.Open();
                        string query = "INSERT INTO Users VALUES (@ID, @Name, @Email, @FatherName, @Role, @Class, @Gender, @Password, @ImagePath)";

                        using (SqlCommand cmd = new SqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@ID", Userid);
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@FatherName", fatherName);
                            cmd.Parameters.AddWithValue("@Role", Role);
                            cmd.Parameters.AddWithValue("@Class", className ?? (object)DBNull.Value);
                            cmd.Parameters.AddWithValue("@Gender", gender);
                            cmd.Parameters.AddWithValue("@Password", password);
                            cmd.Parameters.AddWithValue("@ImagePath", filePath);

                            cmd.ExecuteNonQuery();

                        }

                        Response.Write("<script>alert('Registration successful!');</script>");
                        Response.Redirect("WebForm3.aspx");
                    }
                    catch (Exception ex)
                    {

                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }

            }
        }
       

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            SubmitForm();
        }
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }
        public bool IsEmailExists(string email)
        {
            
            string query = "SELECT COUNT(1) FROM Users WHERE Email = @Email";

           
            using (SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true"))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                  
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    
                    return count > 0;
                }
            }
        }

       
    }
}
