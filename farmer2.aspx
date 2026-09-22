
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
    <img src="https://tse1.mm.bing.net/th/id/OIP.xNEA_tkVOzyM2BULOzaFfQHaFj" class="farmer-img mb-3"/>
    <h3 class="fw-bold text-success">Mr.Ramesh patil</h3>
    <p class="mb-1"><strong>Address:</strong> Chiplun, Kokan, Maharashtra</p>
    <p class="text-muted">Organic farmer with 20+ years experience in chemical-free farming.</p>
</div>



<div class="container my-5">
    <h4 class="fw-bold mb-4 text-success">Products by Farmer</h4>

    <div class="row g-4">

        <div class="col-md-6">
            <div class="card product-card shadow h-100">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="https://static.fanpage.it/wp-content/uploads/sites/22/2020/11/iStock-469858939.jpg" class="img-fluid rounded-start h-100">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"> Black Pepper</h5>
                            <p class="card-text small">Black pepper is a flowering vine in the family Piperaceae, cultivated for its fruit, which is usually dried and used as a spice and seasoning. </p>
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
                        <img src=" https://familyhealthadvocacy.com/wp-content/uploads/2017/02/Depositphotos_195613756_xl-2015-min.jpg " class="img-fluid rounded-start h-100">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title">Turmeric  </h5>
                            <p class="card-text small">Traditional red turmeric in nutrients and natural taste.</p>
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
                        <img src=" https://a-z-animals.com/media/2022/09/dry-cinnamon-sticks-on-kitchen-table-picture-id1389629809-1024x614.jpg" class="img-fluid rounded-start h-100">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"> Cinnamon </h5>
                            <p class="card-text small">Cinnamon is a spice obtained from the inner bark of several tree species from the genus Cinnamomum. Cinnamon is used mainly as an aromatic condiment and flavouring additive in a wide variety of cuisines, in particular sweet and savoury dishes such as biscuits, breakfast cereals, snack foods, bagels, teas, hot chocolate, and traditional foods.</p>
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
                        <img src="https://images.healthshots.com/healthshots/en/uploads/2024/01/09140736/black-seed-oil-1.jpg" class="img-fluid rounded-start h-100">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title">Sesame Oil </h5>
                            <p class="card-text small"></p>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script></body>
</html>
