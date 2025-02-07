<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication.RegisterForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Exam System - Sign Up</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f0f2f5;
            height: 150vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: #4CAF50;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }

        .btn-signup {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 30px;
            width: 100%;
            margin-top: 20px;
        }

        .btn-signup:hover {
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

        .form-group input, .form-group select, .form-group .form-control {
            border-radius: 30px;
        }

        .error {
            color: red;
            font-size: 12px;
        }

        .show-password {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Sign Up - Online Exam System</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="ID">ID</label>
                <input type="text" id="ID" class="form-control" runat="server" required="required" />
                <asp:Label ID="IDError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" id="Name" class="form-control" runat="server" required="required" />
                <asp:Label ID="NameError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" id="Email" class="form-control" runat="server" required="required" />
                <asp:Label ID="EmailError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="FatherName">Father's Name</label>
                <input type="text" id="FatherName" class="form-control" runat="server" required="required" />
                <asp:Label ID="FatherNameError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <asp:DropDownList ID="role" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="Role_SelectedIndexChanged">
                    <asp:ListItem Text="Select Role" Value="" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                    <asp:ListItem Text="User" Value="User" />
                </asp:DropDownList>
                <asp:Label ID="RoleError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="ClassDropdown">Class</label>
                <asp:DropDownList ID="ClassDropdown" runat="server" AutoPostBack="True" class="form-control">
                    <asp:ListItem Text="Select Class" Value="" />
                </asp:DropDownList>
                <asp:Label ID="ClassError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div>
                    <label for="Male" class="mr-3">
                        <input type="radio" id="Male" name="Gender" value="Male" runat="server" /> Male
                    </label>
                    <label for="Female">
                        <input type="radio" id="Female" name="Gender" value="Female" runat="server" /> Female
                    </label>
                </div>
                <asp:Label ID="GenderError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" id="Password" class="form-control" runat="server" required="required" />
                <asp:Label ID="PasswordError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
            </div>

            <div class="form-group">
                <label for="ConfirmPassword">Confirm Password</label>
                <input type="password" id="ConfirmPassword" class="form-control" runat="server" required="required" />
                <asp:Label ID="ConfirmPasswordError" runat="server" CssClass="error"></asp:Label> <!-- Error Label -->
                <div>
                    <span id="PasswordMatchMessage" style="color:red; font-size:12px;"></span>
                </div>
            </div>

            <div class="form-group">
                <label for="ImageUpload">Upload Image</label>
                <asp:FileUpload ID="ImageUpload" runat="server" class="form-control" required="required" />
                 <asp:Label ID="ImageUploadError" runat="server" CssClass="error"></asp:Label>
            </div>

         <button type="submit" class="btn-signup" runat="server" onserverclick="Unnamed_ServerClick">Sign Up</button>

            <div class="form-footer">
                <p>Already have an account? <a href="WebForm3.aspx">Login here</a></p>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    <script>
        const passwordField = document.getElementById('Password');
        const confirmPasswordField = document.getElementById('ConfirmPassword');
        const passwordMatchMessage = document.getElementById('PasswordMatchMessage');

        confirmPasswordField.addEventListener('input', function () {
            if (passwordField.value !== confirmPasswordField.value) {
                passwordMatchMessage.textContent = "Passwords do not match!";
                passwordMatchMessage.style.color = "red";
            } else {
                passwordMatchMessage.textContent = "Passwords match!";
                passwordMatchMessage.style.color = "green";
            }
        });
    </script>
</body>
</html>
