<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADDCARDUI.aspx.cs" Inherits="HOMEEE_PAGE.ADDCARDUI" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Your Cart | FarmerMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        .qty-badge { background: #212529; color: white; padding: 4px 12px; border-radius: 5px; margin: 0 5px; font-weight: bold; }
        .cart-img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; }
        .navbar-brand img { transition: 0.3s; }
        .navbar-brand img:hover { transform: scale(1.1); }
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
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card p-4 shadow-sm border-0">
                        <div class="d-flex justify-content-between mb-4 border-bottom pb-2">
                            <h4 class="fw-bold text-success">🛒 Your Shopping Cart</h4>
                            <a href="productlist.aspx" class="btn btn-sm btn-outline-secondary">Back to Store</a>
                        </div>

                        <asp:Repeater ID="rptCart" runat="server">
                            <ItemTemplate>
                                <div class="d-flex align-items-center mb-3 p-2 border-bottom">
                                    <img src='<%# Eval("img") %>' class="cart-img shadow-sm" />
                                    <div class="flex-grow-1 ms-3">
                                        <div class="fw-bold"><%# Eval("name") %></div>
                                        <small class="text-muted">Price: ₹<%# Eval("price") %></small>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <span class="text-muted me-2 d-none d-sm-inline">Qty:</span>
                                        <span class="qty-badge"><%# Eval("qty") %></span>
                                    </div>
                                    <div class="ms-3 fw-bold text-end" style="width: 100px;">
                                        ₹<%# (Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("qty"))).ToString("N2") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" class="text-center py-5">
                            <i class="bi bi-cart-x display-1 text-muted"></i>
                            <h5 class="text-muted mt-3">Your cart is empty!</h5>
                            <a href="productlist.aspx" class="btn btn-success mt-3">Start Shopping</a>
                        </asp:Panel>

                        <div class="mt-4">
                            <div class="d-flex justify-content-between fw-bold fs-5 mb-3">
                                <span>Grand Total</span>
                                <span class="text-success text-end">
                                    ₹ <asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label>
                                </span>
                            </div>
                            
  <asp:Button ID="btnCheckout" runat="server"  
    Text="Continue"  
    CssClass="btn btn-dark w-100 py-3 fw-bold shadow"  
    PostBackUrl="AddressUI.aspx" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>