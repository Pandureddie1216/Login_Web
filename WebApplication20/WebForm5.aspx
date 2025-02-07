<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication20.WebForm5" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin_Page</title>
    <!-- Add Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Body and Page Layout */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container-center {
            max-width: 1200px;
            margin: 50px auto;
        }

        /* Form Styling */
        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
        }

            .form-container h1 {
                color: #28a745; /* Green Theme */
                font-size: 2rem;
                text-align: center;
            }

        .form-group label {
            font-weight: bold;
        }

        /* Grid Styling */
        .grid-view-container {
            margin-top: 20px;
        }

        .grid-view-header {
            background-color: #28a745; /* Green Theme */
            color: white;
            text-align: center;
            padding: 10px 0;
            border-radius: 8px 8px 0 0;
        }

        .grid-view-table {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

            .grid-view-table th, .grid-view-table td {
                padding: 12px 15px;
                text-align: left;
            }

            .grid-view-table th {
                background-color: #343a40;
                color: white;
            }

            .grid-view-table td {
                background-color: #f8f9fa;
            }

            .grid-view-table tr:hover {
                background-color: #e9ecef;
            }

            .grid-view-table img {
                width: 80px;
                height: 80px;
                border-radius: 50%;
            }

        .table-responsive {
            overflow-x: auto;
        }

        /* Buttons and Interactions */
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

            .btn-container .btn {
                margin-right: 15px;
            }

        /* Media Query for Small Screens */
        @media (max-width: 768px) {
            .grid-view-table th, .grid-view-table td {
                font-size: 12px;
                padding: 8px;
            }

            .grid-view-table img {
                width: 60px;
                height: 60px;
            }
            /* Grid Container */
            .grid-view-container {
                margin-top: 20px;
                padding: 15px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
            }

            /* Scrollable Table */
            .table-responsive {
                overflow-x: auto;
                max-height: 500px;
                border: 1px solid #dee2e6;
            }

            /* Table Styling */
            .table {
                width: 100%;
                white-space: nowrap; /* Prevents text from breaking */
            }

                .table th, .table td {
                    padding: 12px;
                    text-align: left;
                }

            .table-hover tbody tr:hover {
                background-color: #f1f1f1;
            }

            .table-responsive {
                overflow-x: auto;
                max-height: 500px; /* Optional: Limit height for better UI */
            }                                                                       
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container container-center">
            <!-- Sign Up Form Container -->
            <div class="form-container">
                <h1><b>Grid View Example - Sign Up</b></h1>

                <!-- Class Dropdown -->
                <div class="form-group">
                    <label for="ClassDropdown">Class</label>
                    <asp:DropDownList ID="ClassDropdown" runat="server" class="form-control">
                        <asp:ListItem Text="Select Class" Value="" />
                    </asp:DropDownList>
                </div>

                <!-- Submit Button -->
                <div class="btn-container">
                    <button type="button" class="btn btn-success" runat="server" onserverclick="SubmitButton_Click">Submit</button>
                    <button type="button" class="btn btn-secondary" runat="server" onserverclick="DisplayAllData_Click">Display All Data</button>
                </div>
            </div>

            <!-- Grid View Container -->
            <div class="grid-view-container">
                <div class="grid-view-header">
                    <h4>Users Information</h4>
                </div>

                <div class="table-responsive" style="overflow-x: auto; max-height: 500px;">
                    <asp:GridView ID="GridViewUsers" runat="server" CssClass="table table-bordered table-hover text-nowrap"
                        AutoGenerateColumns="True" OnRowDataBound="GridViewUsers_RowDataBound"
                        HeaderStyle-CssClass="table-dark text-center" RowStyle-CssClass="text-center">
                    </asp:GridView>
                </div>
            </div>


        </div>
    </form>

    <!-- Add Bootstrap 5 JS (Optional but good for interactions like buttons, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
