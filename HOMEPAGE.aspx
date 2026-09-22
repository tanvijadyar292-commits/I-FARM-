<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HOMEPAGE.aspx.cs" Inherits="HOMEEE_PAGE.HOMEPAGE" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="UTF-8" />

    <title>Organic Store</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>

        body { font-family: 'Segoe UI', sans-serif; overflow-x: hidden; }

        .hero-slide { height: 100vh; background-size: cover; background-position: center; }

        .hero-overlay { background: rgba(0,0,0,0.55); height: 100%; display: flex; align-items: center; color: #fff; }

        .section-title { font-weight: 700; color: #2f6f4e; }

        footer { background: #2f6f4e; color: #fff; }

        

        

        .navbar-nav .nav-link { font-weight: 500; }

        .profile-icon { width: 40px; height: 40px; border: 2px solid white; font-size: 1.1rem; }

    </style>

</head>

<body>

<form id="form1" runat="server">



 <nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm sticky-top">

     <div class="container">
    <a class="navbar-brand fw-bold" href="HOMEPAGE.aspx">
       <img src="image/logo.png" alt="Logo" height="65" class="rounded-circle me-2" />
     </a>



        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">

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





           <div class="d-flex align-items-center justify-content-center">

                <a class="btn btn-warning text-dark px-3 py-1 position-relative me-3" href="ADDCARDUI.aspx">

                    <i class="bi bi-cart"></i> Cart

                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">

                        <%= (Session["Cart"] != null) ? ((System.Data.DataTable)Session["Cart"]).Rows.Count : 0 %>

                    </span>

                </a>



                <asp:PlaceHolder ID="PlaceHolder1" runat="server">

                    <div class="dropdown">

                        <a class="nav-link dropdown-toggle btn btn-outline-light px-3 py-1" data-bs-toggle="dropdown" href="#" role="button">Account</a>

                        <ul class="dropdown-menu dropdown-menu-end shadow">

                            <li><a class="dropdown-item" href="LOGINPAGE.aspx">Login</a></li>

                            <li><a class="dropdown-item" href="Registerpage.aspx">Register</a></li>

                        </ul>

                    </div>

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


            </div>

        </div>

    </div>

</nav>



<section>

  <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

    <div class="carousel-inner">

      <div class="carousel-item active hero-slide" style="background-image:url('https://images.unsplash.com/photo-1542838132-92c53300491e');">

        <div class="hero-overlay text-center">

          <div class="container">

            <h1 class="display-5 fw-bold">100% Pure & Natural Organic Products</h1>

            <p class="lead">Healthy food directly from trusted farmers</p>

            <a href="productlist.aspx" class="btn btn-success btn-lg me-2">Shop Now</a>

          

          </div>

        </div>

      </div>

      <div class="carousel-item hero-slide" style="background-image:url('https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c3BpY2VzfGVufDB8fDB8fHww');">

        <div class="hero-overlay text-center">

          <div class="container">

            <h1 class="display-5 fw-bold">Fresh Fruits & Vegetables</h1>

            <p class="lead">Farm fresh, chemical free</p>

            <a href="productlist.aspx" class="btn btn-success btn-lg">Shop Fresh</a>

          </div>

        </div>

      </div>

      <div class="carousel-item hero-slide" style="background-image:url('https://images.unsplash.com/photo-1738778017304-361eb5e9aa24?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDI3fHx8ZW58MHx8fHx8');">

        <div class="hero-overlay text-center">

          <div class="container">

            <h1 class="display-5 fw-bold">Healthy Food, Healthy Life</h1>

            <p class="lead">Eat clean, live green 🌱</p>

            <a href="productlist.aspx" class="btn btn-success btn-lg">Start Shopping</a>

          </div>

        </div>

      </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>

    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>

  </div>

</section>



<section class="py-5 bg-light">

  <div class="container text-center">

    <h2 class="section-title mb-4">Kokan Organic Categories</h2>

    <div class="row g-4">

        <div class="col-6 col-md-3"><div class="p-4 bg-white shadow-sm rounded border-bottom border-success border-3">Kokum</div></div>

        <div class="col-6 col-md-3"><div class="p-4 bg-white shadow-sm rounded border-bottom border-success border-3">Mango (Hapus)</div></div>

        <div class="col-6 col-md-3"><div class="p-4 bg-white shadow-sm rounded border-bottom border-success border-3">Cashew (Kaju)</div></div>

        <div class="col-6 col-md-3"><div class="p-4 bg-white shadow-sm rounded border-bottom border-success border-3">Rice & Spices</div></div>

    </div>

  </div>

</section>



<section class="py-5">

  <div class="container">

    <h2 class="section-title text-center mb-4">Popular Products</h2>

    <div class="row g-3">

      <div class="col-md-3">

        <div class="card text-center h-100 shadow-sm border-0">

          <img src="https://images.unsplash.com/photo-1587049352851-8d4e89133924" class="card-img-top" alt="Honey" />

          <div class="card-body"><h5>Organic Honey</h5><p class="text-success fw-bold">₹450 </p><button class="btn btn-success btn-sm w-100"></button></div>

        </div>

      </div>

      <div class="col-md-3">

        <div class="card text-center h-100 shadow-sm border-0">

          <img src="https://images.unsplash.com/photo-1606951444141-e5533feb55be?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="card-img-top" alt="Turmeric" />

          <div class="card-body"><h5>Turmeric Powder</h5><p class="text-success fw-bold">₹250  1 kg

                                                         </p><button class="btn btn-success btn-sm w-100"></button></div>

        </div>

      </div>

      <div class="col-md-3">

        <div class="card text-center h-100 shadow-sm border-0">

          <img src="https://images.unsplash.com/photo-1635562985686-4f8bb9c0d3bf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmljZXxlbnwwfHwwfHx8MA%3D%3D" class="card-img-top" alt="Rice" />

          <div class="card-body"><h5>Organic Rice</h5><p class="text-success fw-bold">₹120 1 kg</p><button class="btn btn-success btn-sm w-100"></button></div>

        </div>

      </div>

      <div class="col-md-3">

        <div class="card text-center h-100 shadow-sm border-0">

          <img src="https://images.unsplash.com/photo-1617854307432-13950e24ba07?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWFuZ28lMjBwaWNrbGV8ZW58MHx8MHx8fDA%3D" class="card-img-top" alt="Pulses" />

          <div class="card-body"><h5>Lemon Pickel</h5><p class="text-success fw-bold">₹260 1 kg</p><button class="btn btn-success btn-sm w-100"></button></div>

        </div>

      </div>

    </div>

  </div>

</section>



<section class="py-5 bg-light text-center">

  <div class="container">

    <h2 class="section-title mb-4">Why Choose Us?</h2>

    <div class="row g-4 justify-content-center">

      <div class="col-md-2"><i class="bi bi-leaf fs-2 text-success"></i><p>100% Organic</p></div>

      <div class="col-md-2"><i class="bi bi-truck fs-2 text-success"></i><p>Fast Delivery</p></div>

      <div class="col-md-2"><i class="bi bi-shield-check fs-2 text-success"></i><p>No Chemicals</p></div>

      <div class="col-md-2"><i class="bi bi-recycle fs-2 text-success"></i><p>Eco Packaging</p></div>

    </div>

  </div>

</section>



<div class="container my-5">

    <div class="p-4 bg-success text-white shadow rounded">

        <h2 class="fw-bold text-center">Importance of Kokan Farmers</h2>

        <p class="mt-3 fs-5">Farmers of the Kokan region play a vital role in producing some of India's purest and most nutritious organic foods.</p>

        <ul class="fs-5">

          <li>✔ Protect natural farming and local traditions.</li>

            <li>✔ Grow fully organic and chemical-free crops.</li> 

            <li>✔Support rural families and local economy.</li>

            <li>✔ Supply high-quality natural food across India.</li>

            <li>✔ Sustain biodiversity and eco-friendly farming.</li>

          </ul>

        <p class="mt-3 fs-5">

            Supporting Kokan farmers means supporting nature, purity, and the future of organic farming.

        </p>

        

    </div>

</div>



<section class="py-5 bg-success text-white text-center">

  <div class="container">

    <h3>Get Organic Tips & Offers</h3>

    <div class="row justify-content-center mt-3">

      <div class="col-md-4 mb-2"><input type="email" class="form-control" placeholder="Enter your email" /></div>

      <div class="col-md-2"><button class="btn btn-dark w-100">Subscribe</button></div>

    </div>

  </div>

</section>



<footer class="py-4">

  <div class="container text-center">

    <p>© 2026 OrganicStore | All Rights Reserved</p>

    <div class="fs-4">

        <i class="bi bi-facebook mx-2"></i>

        <i class="bi bi-instagram mx-2"></i>

        <i class="bi bi-whatsapp mx-2"></i>

    </div>

  </div>

</footer>



</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html> 