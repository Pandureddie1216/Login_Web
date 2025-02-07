using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication20
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void RedirectToSignup(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx"); 
        }
        protected void LoginForm(object sender, EventArgs e)
        {
            string username = Usernam.Text;
            string password = Pass.Text;
            string Role = role.SelectedValue;
            SqlConnection connection = new SqlConnection("server=USERSOFTWARE;database=PRATICE;integrated security=true");
            connection.Open();
            String Query = " SELECT COUNT(*) FROM Users WHERE Email = @username AND Password = @password AND Role = @role";
            SqlCommand cmd = new SqlCommand(Query, connection);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("role", Role);
            int result = (int)cmd.ExecuteScalar();

            if (result > 0)
            {
                if (Role == "Admin")
                {

                    Response.Write("<script>alert('Login Successful Admin!');</script>");

                    Response.Redirect("WebForm5.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Login Successful User!');</script>");

                    Response.Redirect("WebForm4.aspx");
                }
            }
            else
            {

                Response.Write("<script>alert('Invalid login credentials. Please try again.');</script>");
            }
            

    }

        protected void LinkButtonSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");

        }
    }
}