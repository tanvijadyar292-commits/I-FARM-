<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressUI.aspx.cs" Inherits="HOMEEE_PAGE.AddressUI" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Checkout - Shipping Address</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: url('download (1).jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            min-height: 100vh;
            padding: 30px 0;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.3);
            z-index: -1;
        }
        .container-custom {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HOME PAGE.aspx">
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
                  
                </asp:PlaceHolder>
            </ul>
        </div>
    </div>
</nav>
    <div class="container container-custom">
        <h4 class="mb-4">Shipping Address</h4>
        <form id="form1" runat="server">
            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">First Name*</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" required="required"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name*</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Email*</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="email@example.com" required="required"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone*</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+91 0000000000" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-4">
                    <label class="form-label">City*</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">State*</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Zip Code*</label>
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Full Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" required="required"></asp:TextBox>
            </div>

            <div class="mt-4">
                             <asp:Button ID="btnCheckout" runat="server" 
    Text="BUY" 
    CssClass="btn btn-dark w-100 mt-4 py-2 fw-bold" 
    OnClick="btnCheckout_Click" />
            </div>
        </form>
    </div>
</body>
</html>