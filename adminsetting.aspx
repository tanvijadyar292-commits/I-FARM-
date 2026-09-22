<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminsetting.aspx.cs" Inherits="HOMEEE_PAGE.adminsetting" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Settings | iFarm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card { border-radius: 10px; margin-bottom: 20px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .card-header { border-radius: 10px 10px 0 0 !important; font-weight: bold; }
        .scroll-box { max-height: 150px; overflow-y: scroll; }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HOMEPAGE.aspx">
            <img src="image/logo.png" alt="Logo" height="65" class="rounded-circle me-2" />
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="HOMEPAGE.aspx">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="productlist.aspx">Product List</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductfarmerpageUI.aspx">Farmers</a></li>
                <li class="nav-item"><a class="nav-link" href="ABOUTUS.aspx">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="CONTACTUS.aspx">Contact Us</a></li>
            </ul>

            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-lg-3">
                    <a class="nav-link btn btn-warning text-dark px-3 position-relative" href="ADDCARDUI.aspx">
                        🛒 Cart
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            <%= (Session["Cart"] != null) ? ((System.Data.DataTable)Session["Cart"]).Rows.Count : 0 %>
                        </span>
                    </a>
                </li>

                <asp:PlaceHolder ID="phAnonymous" runat="server">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle btn btn-outline-light px-3 ms-lg-2" data-bs-toggle="dropdown" href="#" role="button">Account</a>
                        <ul class="dropdown-menu dropdown-menu-end shadow">
                            <li><a class="dropdown-item" href="LOGINPAGE.aspx">Login</a></li>
                            <li><a class="dropdown-item" href="Registerpage.aspx">Register</a></li>
                        </ul>
                    </li>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="phLoggedIn" runat="server" Visible="false">
                    <li class="nav-item">
                        <a class="nav-link d-flex align-items-center ms-lg-3 text-decoration-none" href="userdashboard.aspx">
                            <div class="rounded-circle bg-white text-success d-flex align-items-center justify-content-center shadow-sm fw-bold" 
                                 style="width: 40px; height: 40px; border: 2px solid white;" 
                                 title="Go to Dashboard">
                                <%= Session["UserName"] != null ? Session["UserName"].ToString().Substring(0,1).ToUpper() : "U" %>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <a href="LOGOUT.aspx" class="btn btn-sm btn-outline-light">Logout</a>
                    </li>
                </asp:PlaceHolder>

            </ul>
        </div>
    </div>
</nav>
        <div class="container mt-4">
     

                    <div class="card">
                        <div class="card-header bg-danger text-white">Change Password</div>
                        <div class="card-body">
                            <asp:TextBox ID="txtOldPass" runat="server" class="form-control mb-2" TextMode="Password" placeholder="Old Password"></asp:TextBox>
                            <asp:TextBox ID="txtNewPass" runat="server" class="form-control mb-2" TextMode="Password" placeholder="New Password"></asp:TextBox>
                            <asp:Button ID="btnChangePass" runat="server" Text="Update Password" class="btn btn-danger w-100" OnClick="btnChangePass_Click" />
                        </div>
                    </div>

                 

           

            

                    <div class="card">
                        <div class="card-header bg-secondary text-white">Recent Activity Logs</div>
                        <div class="card-body scroll-box">
                            <asp:GridView ID="gvLogs" runat="server" class="table table-striped table-sm" AutoGenerateColumns="true"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center mb-5"><asp:Label ID="lblMsg" runat="server" class="fw-bold fs-5"></asp:Label></div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>