
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Farmer Profile | Kokan Organic Market</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body { background:#f1f8f4; }
.farmer-header {
    background:#ffffff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}
.farmer-img {
    width:150px;
    height:150px;
    object-fit:cover;
    border-radius:50%;
    border:4px solid #198754;
}
.product-card img {
    height:180px;
    object-fit:cover;
}
.product-card {
    border-radius:15px;
}
.price {
    color:#198754;
    font-size:18px;
    font-weight:600;
}
</style>
</head>
<body>
  <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container">
<a class="navbar-brand fw-bold" href="HOME PAGE.aspx">
    <img src="image/logo.png" alt="Logo" height="65" class="rounded-circle me-2"/>
   
</a>


    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav me-auto">
      <li class="nav-item"><a class="nav-link" href="HOME PAGE.aspx">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="productlist.aspx">Product List</a></li>
        <li class="nav-item"><a class="nav-link" href="Product farmer page UI.aspx">Farmers</a></li>
        <li class="nav-item"><a class="nav-link" href="ABOUTUS.aspx">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="CONTACT US UI.aspx">Contact Us</a></li>
      </ul>

      

   

<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="login.html" role="button" aria-expanded="false">Login</a>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="LOGINPAGE.aspx">LOGIN</a></li>
      <li><a class="dropdown-item" href="Registerpage.aspx">Register</a></li>
   
    </ul>
</li>
        
        <li class="nav-item ms-lg-4">
    <a class="nav-link position-relative" href="YOUR CARD.aspx">
        🛒 Cart
        <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="display:none;">
            0
        </span>
    </a>
</li>

   
    </div>
  </div>
</nav>

<div class="container my-5">

<!-- Farmer Profile -->
<div class="farmer-header text-center mb-5">
    <img src="https://img.freepik.com/premium-psd/happy-indian-farmer-showing-his-farm-produce-agri-wallpaper_510370-1688.jpg?w=996" class="farmer-img mb-3"/>
    <h3 class="fw-bold text-success">Mr.Suresh More</h3>
    <p class="mb-1"><strong>Address:</strong> Rajapur, Kokan, Maharashtra</p>
    <p class="text-muted">Organic farmer with 10+ years experience in chemical-free farming.</p>
</div>



<div class="container my-5">
    <h4 class="fw-bold mb-4 text-success">Products by Farmer</h4>

    <div class="row g-4">

        <div class="col-md-6">
            <div class="card product-card shadow h-100">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src=" https://i.pinimg.com/originals/57/3c/15/573c15cb087955ad905b99e11805589f.jpg " class="img-fluid rounded-start h-100">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"> Red Amaranth </h5>
                            <p class="card-text small">Red Amaranth is a unique and ancient superfood used for centuries to nourish, heal, and provide sustenance. It’s a highly nutritious grain packed with protein, fiber, vitamins, minerals, and essential fatty acids. Red Amaranth is versatile enough to be enjoyed in various dishes, from salads to soups. It’s also a great source of antioxidants, which can help protect your cells from the damage caused by free radicals.</p>
                            <div class="d-flex align-items-center mb-2">
                                <label class="me-2 small text-muted">Stock:</label>
                                <input type="text" class="form-control form-control-sm w-50" value="100 kg" readonly/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card product-card shadow h-100">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="https://bombayseeds.com/cdn/shop/files/DrumSticks.jpg?v=1696851783" class="img-fluid rounded-start h-100"/>
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title">Drumstick </h5>
                            <p class="card-text small">Every part of the drumstick might contain essential properties for human health; hence, it may be one of the crucial nutritional herbs. For many years, the drumstick has been used as a traditional medicine.</p>
                            <div class="d-flex align-items-center mb-2">
                                <label class="me-2 small text-muted">Stock:</label>
                                <input type="text" class="form-control form-control-sm w-50" value="500 kg" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card product-card shadow h-100">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="https://www.keralanaturals.com/wp-content/uploads/Elephant-foot-yarm.png" class="img-fluid rounded-start h-100"/>
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title">Elephant Foot Yam   </h5>
                            <p class="card-text small">Elephant foot yam, also referred to as Suran or Jimikand, is a highly versatile root vegetable commonly found in both culinary and medicinal practices. Recognized for its coarse, bark-like skin and tender, edible interior, this tuber is a staple in many Indian dishes. While it offers several health benefits, it is important to consume this vegetable mindfully.</p>
                            <div class="d-flex align-items-center mb-2">
                                <label class="me-2 small text-muted">Stock:</label>
                                <input type="text" class="form-control form-control-sm w-50" value="100 Doz" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card product-card shadow h-100">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src=" https://parade.com/.image/t_share/MTkzMjgyODUzNDk5MzE1Nzc5/sweet-potatoes.jpg" class="img-fluid rounded-start h-100"/>
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Potato </h5>
                            <p class="card-text small">Sweet potatoes are a root vegetable rich in antioxidants that protect your cells from damage, and contain fiber, vitamins, and minerals, including vitamins A and C, potassium, and zinc. These nutrients provide several health benefits.</p>
                            <div class="d-flex align-items-center mb-2">
                                <label class="me-2 small text-muted">Stock:</label>
                                <input type="text" class="form-control form-control-sm w-50" value="50 kg" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> </div> 



</div>
</div>

<footer class="bg-success text-white text-center py-3 mt-5">
© 2025 Kokan Organic Market
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
