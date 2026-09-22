<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABOUTUS.aspx.cs" Inherits="HOMEEE_PAGE.ABOUTUS" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us | i-Farm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        .custom-card-container {
            max-width: 800px;
            margin: 0 auto;   
        }

        .about-card {
            background: #ffffff;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08); 
            border: 1px solid #eee;
        }

        .section-title {
            color: #0a5c4d;
            font-weight: bold;
            margin-bottom: 15px;
        }

       
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease; 
            border: none;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02); 
            box-shadow: 0 10px 30px rgba(0,0,0,0.15) !important; 
            cursor: pointer;
        }

        .card-img-top, .card-img-bottom {
            transition: opacity 0.3s ease;
        }

        .card:hover .card-img-top, .card:hover .card-img-bottom {
            opacity: 0.9; 
        }
      

        .card-wrapper {
            width: 70%;          
            margin: 20px auto;   
            background: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
                                    <a href="LOGOUT.aspx" class="btn btn-sm btn-outline-light">Logout</a>
                                     
                               
                            </li>
                        </asp:PlaceHolder>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container my-5 text-center">
            <h1>About Us</h1>
        </div>

        <div class="container my-4">
            <div class="row align-items-center">
                <div class="col-md-6 mb-3">
                    <div class="card shadow-sm">
                        <img src="https://thumbs.dreamstime.com/b/witness-beauty-dedication-agricultural-labor-breathtaking-panoramic-view-farmer-meticulously-applies-373633840.jpg" class="card-img-top" alt="About Us Image" />
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="card p-4 shadow-sm">
                        <h3>Our Story</h3>
                        <p>
                           "i-Farm is more than just an e-commerce platform; it is a Social Business Model born out of a deep respect for the soil and the soul of our rural communities. We recognize the digital barriers faced by many traditional farmers today and act as their professional bridge to the modern global market.
                        </p>
                        <p>
                           Specifically, the Farmers of the Kokan region play a vital role in producing some of India's purest and most nutritious organic foods. The combination of Kokan’s fertile soil, heavy rainfall, and the farmers' unwavering dedication to traditional methods makes their products truly special. However, due to a lack of technical expertise, these gems often don't reach the right tables.
                        </p>
                        <p>
                            At i-Farm, while we handle the complexities of online commerce, we preserve the Farmer’s Legacy by highlighting their identity on every product. We believe that supporting Kokan farmers means supporting nature, purity, and the future of organic farming. Our ultimate vision is to integrate Voice-AI, ensuring that technology becomes an accessible and inclusive tool for every farmer—allowing them to share their harvest with the world simply by speaking."
                        </p>
                    </div>
                </div>
            </div>
        </div>


        <div class="container my-5">
            <div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
                
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1421789665209-c9b2a435e3dc?w=600&auto=format&fit=crop&q=60" class="card-img-top" alt="Mission"/>
                        <div class="card-body">
                            <h5 class="card-title text-success fw-bold">Our Mission</h5>
                            <p class="card-text">
                                <b>Bridging the Digital Divide:</b> Our primary goal is to close the gap between rural farmers and modern e-commerce technology.<br /><br />
                                <b>Empowering Farmers:</b> We ensure immediate financial stability for farmers by procuring products directly from them.<br /><br />
                                <b>Eliminating Middlemen:</b> By adopting a Direct-to-Consumer (D2C) approach, we prevent the exploitation of farmers by traditional intermediaries.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-success fw-bold">Operational Excellence (The i-Farm Model)</h5>
                            <p class="card-text">
                                <b>Assisted E-commerce:</b> For farmers who are not tech-savvy, the Admin acts as a digital representative, managing product listings and online sales on their behalf.<br /><br />
                                <b>Preserving Identity:</b> Even though the Admin facilitates the sale, the Farmer's Identity remains central. Every product features the name and location of the farmer who grew it.<br /><br />
                                <b>Traceability:</b> We believe that "Identity Matters." Customers can trace their food back to the specific farm, fostering trust and transparency.
                            </p>
                        </div>
                        <img src="https://images.unsplash.com/photo-1694011772133-dc4b3ff3f24f?w=600&auto=format&fit=crop&q=60" class="card-img-bottom" alt="Model"/>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="https://media.istockphoto.com/id/1160316337/photo/tea-plantations.webp?a=1&b=1&s=612x612&w=0&k=20&c=2CFWErG9QDqVOTYgy_KHOk8lpr6s1_lZVELRt8yxgy8=" class="card-img-top" alt="Why Choose Us"/>
                        <div class="card-body">
                            <h5 class="card-title text-success fw-bold">Why Choose i-Farm?</h5>
                            <p class="card-text">
                                <b>Dedicated Farmer Profiles:</b> Every farmer has a unique profile page showcasing their entire range of organic produce.<br /><br />
                                <b>Quality & Trust:</b> All products undergo a rigorous quality check by the Admin before being listed for sale.<br /><br />
                                <b>Supporting Local Economy:</b> Every purchase on our platform directly contributes to the growth and sustainability of the rural farming community.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-success fw-bold">Future Roadmap</h5>
                            <p class="card-text">
                                <b>Phase 1 (Current):</b> Providing manual Admin support to help non-tech-savvy farmers enter the digital market.<br /><br />
                                <b>Phase 2 (Growth):</b> Launching digital literacy programs to train farmers to manage their own online storefronts independently.<br /><br />
                                <b>Phase 3 (Innovation):</b> Voice-Activated AI: Implementing AI technology that allows farmers to register and list products using simple voice commands in their native language.
                            </p>
                        </div>
                        <img src="https://media.istockphoto.com/id/1289147385/photo/thoughtful-senior-man-at-park.webp?a=1&b=1&s=612x612&w=0&k=20&c=UpOsveUBgykuK92mSQjTpmoa9qKiODRnkQoHyeZodA0=" class="card-img-bottom" alt="Future AI">
                    </div>
                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>