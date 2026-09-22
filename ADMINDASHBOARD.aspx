<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADMINDASHBOARD.aspx.cs" Inherits="HOMEEE_PAGE.ADMINDASHBOARD" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>i-Farm Pro Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css" rel="stylesheet">
    
    <style>
        body { background: #f8f9fa; }
        .sidebar { height: 100vh; width: 250px; position: fixed; background: #052c24; color: white; padding: 20px; z-index: 1000; }
        .main { margin-left: 260px; padding: 20px; }
        .nav-tabs .nav-link { color: #052c24; font-weight: bold; }
        .nav-tabs .nav-link.active { background-color: #052c24; color: white; }
        .card-stats { border-radius: 15px; border: 2px solid transparent; box-shadow: 0 4px 10px rgba(0,0,0,0.1); background: white; margin-bottom: 20px; height: 110px; transition: 0.3s; }
        .card-stats:hover { transform: translateY(-5px); border-color: #052c24; }
        .card-link { text-decoration: none; color: inherit; display: block; }
        .inventory-scroll { max-height: 400px; overflow-y: auto; }
        .chart-container { background: white; border-radius: 15px; padding: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); margin-bottom: 30px; }
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

        <div class="sidebar">
            <h2 class="fw-bold">i-Farm Admin</h2>
            <hr />
            <p>Welcome, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label></p>
            
         
             <a href="adminsetting.aspx" class="text-white text-decoration-none d-block mb-3">
     <i class="bi bi-list-check"></i> Setting
 </a>
           <div class="logout-section">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click" OnClientClick="return confirm('Are you sure for logout?');">
        <i class="fa fa-sign-out"></i> Logout
    </asp:LinkButton>
</div>
        </div>
        
        <div class="main">
            <div class="row mb-4">
                <div class="col-md-2"><a href="#" onclick="openTab('orders')" class="card-link"><div class="card card-stats p-3"><h6>Sales</h6><h5 class="text-success"> <asp:Label ID="lblTotalSales" runat="server" Text="0"></asp:Label></h5></div></a></div>
                <div class="col-md-2"><a href="#" onclick="openTab('orders')" class="card-link"><div class="card card-stats p-3"><h6>Pending</h6><h5 class="text-warning"><asp:Label ID="lblPendingOrders" runat="server" Text="0"></asp:Label></h5></div></a></div>
                <div class="col-md-2"><a href="#" onclick="openTab('monthlyReport')" class="card-link"><div class="card card-stats p-3"><h6>Monthly</h6><h5 class="text-primary"> <asp:Label ID="lblMonthlySales" runat="server" Text="0"></asp:Label></h5></div></a></div>
                <div class="col-md-2"><a href="#" onclick="openTab('customers')" class="card-link"><div class="card card-stats p-3"><h6>Customers</h6><h5 class="text-info"><asp:Label ID="lblTotalCustomers" runat="server" Text="0"></asp:Label></h5></div></a></div>
                <div class="col-md-2"><a href="" onclick="openTab('farmers')" class="card-link"><div class="card card-stats p-3"><h6>Unpaid</h6><h5 class="text-danger"> <asp:Label ID="lblPayable" runat="server" Text="0"></asp:Label></h5></div></a></div>
                <div class="col-md-2"><div class="card card-stats p-3"><h6>Top Product</h6><h6 class="text-secondary"><asp:Label ID="lblTopProduct" runat="server" Text="N/A"></asp:Label></h6></div></div>
            </div>
            <div class="row mb-4">
    <div class="col-md-4">
        <div class="card text-center shadow" style="border-radius: 15px;">
            <div class="card-body">
                <i class="bi bi-wallet2 text-success" style="font-size: 3rem;"></i>
                <h5 class="card-title mt-3">Manage Payments</h5>
                <p class="card-text text-muted">View and update farmer payment status.</p>
                <a href="adminpayment.aspx" class="btn btn-success w-100">Go to Payments</a>
            </div>
        </div>
    </div>
</div>
            <div class="chart-container">
                <h5 class="mb-3"><i class="bi bi-graph-up"></i> Sales Performance Overview</h5>
                <canvas id="salesChart" style="max-height: 250px;"></canvas>
            </div>

            <ul class="nav nav-tabs" id="adminTab" role="tablist">
                <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#orders">Manage Orders</a></li>
                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#customers">Customers</a></li>
                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#manageProducts">Inventory</a></li>
                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#farmers">Farmer Payments</a></li>
                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#enquiries">User Enquiries</a></li>
                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#monthlyReport">Sales Report</a></li>
            </ul>

            <div class="tab-content border p-4 bg-white shadow-sm rounded-bottom">
                
                <div class="tab-pane fade show active" id="orders">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <div class="input-group input-group-sm">
                                <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                                <input type="text" id="orderSearch" class="form-control" placeholder="Search orders..." onkeyup="filterTable('gvAdminOrders', this.value)">
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="gvAdminOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvAdminOrders_RowCommand" EmptyDataText="No Pending Orders Found.">
                        <Columns>
                            <asp:BoundField DataField="OrderId" HeaderText="ID" />
                            <asp:BoundField DataField="UserEmail" HeaderText="Customer" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="₹{0}" />
                            <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button runat="server" CommandName="MarkDelivered" CommandArgument='<%# Eval("OrderId") %>' Text="Delivered" CssClass="btn btn-sm btn-success" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <div class="tab-pane fade" id="customers">
                    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email_ID" HeaderText="Email" />
                            <asp:BoundField DataField="Phone_No" HeaderText="Phone" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="tab-pane fade" id="manageProducts">
                    <div class="row">
                        <div class="col-md-4 border-end">
                            <h4 class="mb-3">Add New Product</h4>
                            <div class="card p-3 shadow-sm">
                                <div class="mb-3"><label class="form-label">Product Name</label><asp:TextBox ID="txtProdName" runat="server" CssClass="form-control"></asp:TextBox></div>
                                <div class="mb-3"><label class="form-label">Price (₹)</label><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox></div>
                                <div class="mb-3">
                                    <label class="form-label">Stock Quantity</label>
                                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" placeholder="50"></asp:TextBox>
                                </div>
                                <div class="mb-3"><label class="form-label">Product Image</label><asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" /></div>
                                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="btn btn-success w-100" />
                            </div>
                        </div>
                        <div class="col-md-8">
                            <h4 class="mb-3 ms-2">Current Inventory</h4>
                            <div class="inventory-scroll px-2">
                                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="productID" 
                                    CssClass="table table-striped table-hover border" 
                                    OnRowCommand="gvProducts_RowCommand"
                                    OnRowEditing="gvProducts_RowEditing" 
                                    OnRowUpdating="gvProducts_RowUpdating" 
                                    OnRowCancelingEdit="gvProducts_RowCancelingEdit">
                                    <Columns>
                                        <asp:BoundField DataField="productID" HeaderText="ID" ReadOnly="True" ItemStyle-Width="50px" />
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate><%# Eval("productName") %></ItemTemplate>
                                            <EditItemTemplate><asp:TextBox ID="txtEditName" runat="server" Text='<%# Bind("productName") %>' CssClass="form-control form-control-sm"></asp:TextBox></EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>₹<%# Eval("Price") %></ItemTemplate>
                                            <EditItemTemplate><asp:TextBox ID="txtEditPrice" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control form-control-sm"></asp:TextBox></EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Stock">
                                            <ItemTemplate><span class='<%# Convert.ToInt32(Eval("stock_quantity")) < 10 ? "badge bg-danger" : "badge bg-success" %>'><%# Eval("stock_quantity") %></span></ItemTemplate>
                                            <EditItemTemplate><asp:TextBox ID="txtEditQty" runat="server" Text='<%# Bind("stock_quantity") %>' CssClass="form-control form-control-sm" TextMode="Number"></asp:TextBox></EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-primary" />
                                                <asp:Button ID="btnDelete" runat="server" CommandName="DeleteProduct" CommandArgument='<%# Eval("productID") %>' Text="Delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure?');" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success" />
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-secondary" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#052c24" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="farmers">
                    <asp:GridView ID="gvFarmerPayments" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvFarmerPayments_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="order_id" HeaderText="Order ID" />
                            <asp:BoundField DataField="UserEmail" HeaderText="Farmer Email" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="₹{0}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='<%# Eval("FarmerPaymentStatus").ToString() == "Paid" ? "badge bg-success" : "badge bg-danger" %>'>
                                        <%# Eval("FarmerPaymentStatus") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnPay" runat="server" CommandName="PayFarmer" CommandArgument='<%# Eval("order_id") %>' Text="Confirm Payment" CssClass="btn btn-sm btn-outline-primary" Visible='<%# Eval("FarmerPaymentStatus").ToString() == "Pending" %>' OnClientClick="return confirm('तुम्ही या शेतकऱ्याला पैसे दिले आहेत का?');" />
                                    <span runat="server" visible='<%# Eval("FarmerPaymentStatus").ToString() == "Paid" %>'><i class="bi bi-check-circle-fill text-success"></i> Done</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="tab-pane fade" id="enquiries">
                    <h4 class="mb-3">User Contact Enquiries</h4>
                    <asp:GridView ID="gvEnquiries" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered shadow-sm">
                        <Columns>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Message" HeaderText="Message" />
                            <asp:BoundField DataField="SubmittedAt" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
                        </Columns>
                        <HeaderStyle BackColor="#052c24" ForeColor="White" />
                    </asp:GridView>
                </div>

            <div class="tab-pane fade" id="monthlyReport">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Sales Performance Report</h4>
        <div class="d-flex gap-2">
            <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                <asp:ListItem Text="Monthly Report" Value="Monthly"></asp:ListItem>
                <asp:ListItem Text="Yearly Report" Value="Yearly"></asp:ListItem>
                <asp:ListItem Text="Daily Report" Value="Daily"></asp:ListItem>
                <asp:ListItem Text="5-Day Interval Report" Value="5Day"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" CssClass="btn btn-outline-success btn-sm" OnClick="btnExportExcel_Click" />
        </div>
    </div>
    
    <asp:GridView ID="gvMonthlySales" runat="server" AutoGenerateColumns="true" CssClass="table table-bordered table-hover">
        <HeaderStyle BackColor="#052c24" ForeColor="White" />
    </asp:GridView>
</div>

            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        function openTab(tabId) {
            var triggerEl = document.querySelector('a[href="#' + tabId + '"]');
            if (triggerEl) {
                var tab = new bootstrap.Tab(triggerEl);
                tab.show();
            }
        }

        function filterTable(tableId, query) {
            const rows = document.querySelectorAll(`#${tableId} tr:not(:first-child)`);
            query = query.toLowerCase();
            rows.forEach(row => {
                row.style.display = row.innerText.toLowerCase().includes(query) ? '' : 'none';
            });
        }

        const ctx = document.getElementById('salesChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Monthly Sales (₹)',
                    data: [1200, 1900, 3000, 2500, 2000, 3160],
                    borderColor: '#052c24',
                    backgroundColor: 'rgba(5, 44, 36, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    </script>
</body>
</html>