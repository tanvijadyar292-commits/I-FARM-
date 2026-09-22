<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpayment.aspx.cs" Inherits="HOMEEE_PAGE.adminpayment" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Payments | Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="container mt-5">
            <h2 class="text-success mb-4">Farmer Payment Records</h2>
            
            <div class="card shadow">
                <div class="card-body">
                    <asp:GridView ID="gvPayments" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-striped">
                        <Columns>
                            <asp:BoundField DataField="FarmerName" HeaderText="Farmer Name" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" />
                            <asp:BoundField DataField="PaymentDate" HeaderText="Date" />
                            
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='<%# Eval("Status").ToString() == "Paid" ? "badge bg-success" : "badge bg-danger" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnUpdateStatus" runat="server" Text="Mark Paid" 
                                        CommandArgument='<%# Eval("RecordID") %>' 
                                        OnClick="btnUpdateStatus_Click" 
                                        CssClass="btn btn-sm btn-outline-primary" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>