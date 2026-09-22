<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CONTACTUS.aspx.cs" Inherits="HOMEEE_PAGE.CONTACTUS" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us | Organic Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .contact-bg {
            background-image: url('https://img.freepik.com/premium-photo/pesticidespraying-tractor_410516-14598.jpg');
            background-size: cover; 
            background-position: center; 
            min-height: 100vh; 
            padding: 80px 0; 
            position: relative;
        }
        .contact-bg::before { 
            content: ""; 
            position: absolute; 
            inset: 0; 
            background: rgba(0,0,0,0.6); 
        }
        .contact-content { 
            position: relative; 
            z-index: 1; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                            <li class="nav-item">
                                <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-sm btn-outline-light ms-2" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                            </li>
                        </asp:PlaceHolder>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="contact-bg d-flex align-items-center justify-content-center">
            <div class="container contact-content text-center">
                <h1 class="display-4 fw-bold text-uppercase text-white mb-5">Contact Us</h1>

                <div class="row g-4 justify-content-center text-start">
                    <div class="col-md-5">
                        <div class="card shadow h-100">
                            <div class="card-header bg-primary text-white text-center">
                                <h4>Send a Message</h4>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter Email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Phone</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Phone"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Message</label>
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="How can we help?"></asp:TextBox>
                                </div>

                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success w-100 fw-bold" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="card shadow h-100">
                            <div class="card-header bg-primary text-white text-center">
                                <h4>Contact Information</h4>
                            </div>
                            <div class="card-body d-flex flex-column align-items-center justify-content-center py-5">
                                <div class="mb-4 text-center">
                                    <h3 class="fw-bold">📞 +91 98765 43210</h3>
                                </div>
                                <div class="text-center">
                                    <h3 class="fw-bold">📧 info@example.com</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>