<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication20.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Online Exam System</title>
    <!-- Bootstrap CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            height: 100vh;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .login-form {
            background-color: Background;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

            .login-form h3 {
                text-align: center;
                margin-bottom: 30px;
                font-weight: bold;
                color: #4CAF50;
            }

        .form-control {
            border-radius: 30px;
            padding: 10px 20px;
        }

        .btn-login {
            background-color: #4CAF50;
            color: #fff;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            width: 100%;
            margin-top: 20px;
        }

            .btn-login:hover {
                background-color: #45a049;
            }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

            .form-footer a {
                color: #4CAF50;
                text-decoration: none;
            }

                .form-footer a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-form">
            <h3>Online Exam System</h3>
            <form id="loginForm" runat="server">
                <div class="form-group">
                    <label for="Role">Role</label>
                    <asp:DropDownList ID="role" class="form-control" runat="server">
                        <asp:ListItem Text="Select Role" Value="" />
                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="User" Value="User" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="Usernam">Username</label>
                    <asp:TextBox ID="Usernam" class="form-control" runat="server" required placeholder="Enter Username"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="Pass">Password</label>
                    <asp:TextBox ID="Pass" class="form-control" runat="server" TextMode="Password" required placeholder="Enter Password"></asp:TextBox>
                </div>



                <button type="submit" class="btn-login" runat="server" onserverclick="LoginForm">Login</button>

                <div class="form-footer">
                    <%-- <p>Don't have an account? <a href="WebForm1.aspx">Sign up here</a></p>--%>
                    <p>
                        Don't have an account? 
    <asp:LinkButton ID="LinkButtonSignUp" runat="server" OnClick="LinkButtonSignUp_Click"
        >Sign up here</asp:LinkButton>
                    </p>

                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive elements) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
