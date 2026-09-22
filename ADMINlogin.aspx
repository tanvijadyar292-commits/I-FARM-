<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="HOMEEE_PAGE.ADMINlogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Admin Access | i-Farm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            /* Background image farm chi asel tar khup chan disel */
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('image/farm_bg.jpg'); 
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .admin-login-card {
            background: rgba(255, 255, 255, 0.15); /* Glass effect */
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            color: white;
        }
        .logo-box {
            width: 90px;
            height: 90px;
            background: white;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 20px;
        }
        .login-btn {
            background: #ffc107; /* Gold color for Admin */
            color: #052c24;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            padding: 12px;
            width: 100%;
            transition: 0.3s;
            font-size: 1.1rem;
        }
        .login-btn:hover {
            background: #e0a800;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.3);
        }
        .back-link {
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            font-size: 0.9rem;
        }
        .back-link:hover {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-login-card text-center">
            <div class="logo-box">
                <img src="image/logo.png" alt="i-Farm Logo" width="70" />
            </div>
            
            <h2 class="fw-bold mb-1">Admin Portal</h2>
            <p class="mb-4 text-white-50">Authorized Personnel Only</p>

            <div class="text-start">
                <label class="form-label ps-1">Admin Identifier</label>
                <asp:TextBox ID="txtAdminID" runat="server" CssClass="form-control" placeholder="Enter Admin ID"></asp:TextBox>
                
                <label class="form-label ps-1">Security Password</label>
                <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            </div>

            <asp:Label ID="lblMsg" runat="server" CssClass="text-warning d-block mb-3 small" Text=""></asp:Label>

    <asp:Button ID="btnAdminLogin" runat="server" 
    Text="Verify & Enter" 
    OnClick="btnAdminLogin_Click" 
    CssClass="btn login-btn text-center d-flex align-items-center justify-content-center" />

            <div class="mt-4">
                <a href="LOGINPAGE.aspx" class="back-link">← Return to User Login</a>
            </div>
        </div>
    </form>
</body>
</html>