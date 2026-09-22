using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMEEE_PAGE
{
    public partial class ADMINDASHBOARD : System.Web.UI.Page
    {
        string connline = "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null) { Response.Redirect("AdminLogin.aspx"); return; }

            if (!IsPostBack)
            {
               // CreateStockTrigger(); //call karne
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            if (Session["UserName"] != null)
                lblAdminName.Text = Session["UserName"].ToString();
            else if (Session["AdminName"] != null)
                lblAdminName.Text = Session["AdminName"].ToString();
            else
                lblAdminName.Text = "Admin";

            LoadStats();
            LoadOrders();
            LoadFarmerPayments();
            LoadManageProducts();
            LoadCustomers();
            LoadSalesReport();
            LoadEnquiries();
        }

        private void LoadEnquiries()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT EnquiryID, FirstName, LastName, Email, Phone, Message, SubmittedAt FROM contactus ORDER BY SubmittedAt DESC";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (gvEnquiries != null)
                    {
                        gvEnquiries.DataSource = dt;
                        gvEnquiries.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Enquiry Load Error: " + ex.Message.Replace("'", "") + "');</script>");
                }
            }
        }

        private void LoadStats()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                try
                {
                    conn.Open();
                    string qSales = "SELECT IFNULL(SUM(TotalAmount), 0) FROM orders WHERE OrderStatus = 'Success'";
                    lblTotalSales.Text = "₹ " + new MySqlCommand(qSales, conn).ExecuteScalar().ToString();

                    string qPending = "SELECT COUNT(*) FROM orders WHERE OrderStatus = 'Pending'";
                    lblPendingOrders.Text = new MySqlCommand(qPending, conn).ExecuteScalar().ToString();

                    string qMonthly = "SELECT IFNULL(SUM(TotalAmount), 0) FROM orders WHERE OrderStatus = 'Success' AND MONTH(OrderDate) = MONTH(CURRENT_DATE()) AND YEAR(OrderDate) = YEAR(CURRENT_DATE())";
                    lblMonthlySales.Text = "₹ " + new MySqlCommand(qMonthly, conn).ExecuteScalar().ToString();

                    lblTotalCustomers.Text = new MySqlCommand("SELECT COUNT(*) FROM register", conn).ExecuteScalar().ToString();

                    object resTop = new MySqlCommand("SELECT ProductName FROM orders GROUP BY ProductName ORDER BY COUNT(*) DESC LIMIT 1", conn).ExecuteScalar();
                    lblTopProduct.Text = resTop != null ? resTop.ToString() : "No Sales Yet";

                    string qPayable = "SELECT IFNULL(SUM(TotalAmount), 0) FROM orders WHERE OrderStatus = 'Pending'";
                    lblPayable.Text = "₹ " + new MySqlCommand(qPayable, conn).ExecuteScalar().ToString();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Stats Error: " + ex.Message.Replace("'", "") + "');</script>");
                }
            }
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SalesReport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gvMonthlySales.RenderControl(hw);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control) { }

        protected void ddlReportType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSalesReport();
        }

        private void LoadSalesReport()
        {
            string reportType = ddlReportType.SelectedValue;
            string query = "";

            switch (reportType)
            {
                case "Yearly":
                    query = "SELECT YEAR(OrderDate) as Year, SUM(TotalAmount) as YearlyTotal FROM orders GROUP BY YEAR(OrderDate) ORDER BY Year DESC";
                    break;
                case "Daily":
                    query = "SELECT DATE(OrderDate) as Date, SUM(TotalAmount) as DailyTotal FROM orders GROUP BY DATE(OrderDate) ORDER BY Date DESC";
                    break;
                case "5Day":
                    query = @"SELECT CONCAT(DATE_FORMAT(OrderDate, '%Y-%m-'), (FLOOR((DAY(OrderDate)-1)/5)*5)+1) as StartDate, SUM(TotalAmount) as TotalSales FROM orders GROUP BY StartDate ORDER BY StartDate DESC";
                    break;
                default:
                    query = "SELECT MONTHNAME(OrderDate) as Month, YEAR(OrderDate) as Year, SUM(TotalAmount) as MonthlyTotal FROM orders GROUP BY Month, Year ORDER BY Year DESC";
                    break;
            }
            DataTable dt = FetchDataFromDatabase(query);
            gvMonthlySales.DataSource = dt;
            gvMonthlySales.DataBind();
        }

        private DataTable FetchDataFromDatabase(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connline))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            conn.Open();
                            sda.Fill(dt);
                            conn.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Report Database Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
            return dt;
        }

        private void LoadOrders()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                try
                {
                    string query = "SELECT OrderId, UserEmail, TotalAmount, OrderStatus FROM orders ORDER BY OrderDate DESC";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvAdminOrders.DataSource = dt;
                    gvAdminOrders.DataBind();
                }
                catch (Exception ex) { Response.Write("<script>alert('Orders Load Error: " + ex.Message + "');</script>"); }
            }
        }

        private void LoadManageProducts()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                string query = "SELECT productID, productName, Price, stock_quantity FROM productlist";
                MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            LoadManageProducts();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            LoadManageProducts();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prodId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvProducts.Rows[e.RowIndex];
            string newName = ((TextBox)row.FindControl("txtEditName")).Text;
            string newPrice = ((TextBox)row.FindControl("txtEditPrice")).Text;
            string newQty = ((TextBox)row.FindControl("txtEditQty")).Text;

            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                try
                {
                    conn.Open();
                    string query = "UPDATE productlist SET productName = @name, Price = @price, stock_quantity = @qty WHERE productID = @id";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@name", newName);
                    cmd.Parameters.AddWithValue("@price", newPrice);
                    cmd.Parameters.AddWithValue("@qty", newQty);
                    cmd.Parameters.AddWithValue("@id", prodId);
                    cmd.ExecuteNonQuery();
                    gvProducts.EditIndex = -1;
                    LoadManageProducts();
                }
                catch (Exception ex) { Response.Write("<script>alert('Update Error: " + ex.Message.Replace("'", "") + "');</script>"); }
            }
        }

        private void LoadFarmerPayments()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                string query = "SELECT order_id, UserEmail, TotalAmount, FarmerPaymentStatus FROM userorder WHERE FarmerPaymentStatus = 'Pending'";
                MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvFarmerPayments.DataSource = dt;
                gvFarmerPayments.DataBind();
            }
        }

        private void LoadCustomers()
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                string query = "SELECT id, Name, Email_ID, Phone_No FROM register";
                MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCustomers.DataSource = dt;
                gvCustomers.DataBind();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string folderPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
                    fileUpload.SaveAs(folderPath + fileName);

                    using (MySqlConnection conn = new MySqlConnection(connline))
                    {
                        conn.Open();
                        string query = "INSERT INTO productlist (productName, Price, productImage, stock_quantity) VALUES (@name, @price, @img, @qty)";
                        MySqlCommand cmd = new MySqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@name", txtProdName.Text);
                        cmd.Parameters.AddWithValue("@price", txtPrice.Text);
                        cmd.Parameters.AddWithValue("@img", "Images/" + fileName);
                        cmd.Parameters.AddWithValue("@qty", txtQty.Text);
                        cmd.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Product Added Successfully!');</script>");
                    txtProdName.Text = ""; txtPrice.Text = ""; txtQty.Text = "";
                    LoadManageProducts();
                }
                catch (Exception ex) { Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>"); }
            }
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                string prodId = e.CommandArgument.ToString();
                using (MySqlConnection conn = new MySqlConnection(connline))
                {
                    try
                    {
                        conn.Open();
                        MySqlCommand cmd = new MySqlCommand("DELETE FROM productlist WHERE productID = @pid", conn);
                        cmd.Parameters.AddWithValue("@pid", prodId);
                        cmd.ExecuteNonQuery();
                        LoadManageProducts();
                    }
                    catch (Exception ex) { Response.Write("<script>alert('Error deleting product: " + ex.Message + "');</script>"); }
                }
            }
        }

        protected void gvFarmerPayments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PayFarmer")
            {
                string orderId = e.CommandArgument.ToString();
                using (MySqlConnection conn = new MySqlConnection(connline))
                {
                    conn.Open();
                    string query = "UPDATE userorder SET FarmerPaymentStatus = 'Paid' WHERE order_id = @id";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", orderId);
                    cmd.ExecuteNonQuery();
                    LoadFarmerPayments();
                    LoadStats();
                }
            }
        }

        protected void gvAdminOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MarkDelivered")
            {
                //code akadach chalnyasathi
                if (Session["IsProcessing"] == null || (bool)Session["IsProcessing"] == false)
                {
                    Session["IsProcessing"] = true;//orderla suruvat

                    int orderId = Convert.ToInt32(e.CommandArgument);
                    UpdateOrderStatus(orderId, "Success");

                    Session["IsProcessing"] = false; //order purn
                }
            }
        }



        
        private void UpdateInventory(string productName)
        {
            using (MySqlConnection conn = new MySqlConnection(connline))
            {
                try
                {
                    conn.Open();
                    string sql = "UPDATE productlist SET stock_quantity = stock_quantity + 1 WHERE TRIM(productName) = TRIM(@name)";
                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", productName);
                        int rows = cmd.ExecuteNonQuery();
                        if (rows == 0) { Response.Write("<script>alert('Warning: Product " + productName + " not found in Inventory!');</script>"); }
                    }
                }
                catch (Exception ex) { Response.Write("<script>alert('Update Error: " + ex.Message.Replace("'", "") + "');</script>"); }
            }
        }

        private void UpdateOrderStatus(int orderId, string status)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connline))
                {
                    conn.Open();
                    using (MySqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            // 1. ऑर्डरची माहिती मिळवा (नाव आणि क्वांटिटी)
                            string selectInfo = "SELECT ProductName, Quantity, OrderStatus FROM orders WHERE OrderId = @id FOR UPDATE";
                            MySqlCommand cmdInfo = new MySqlCommand(selectInfo, conn, trans);
                            cmdInfo.Parameters.AddWithValue("@id", orderId);

                            string pName = "";
                            int qty = 0;
                            string currentStatus = "";

                            using (MySqlDataReader dr = cmdInfo.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    pName = dr["ProductName"].ToString();
                                    qty = Convert.ToInt32(dr["Quantity"]);
                                    currentStatus = dr["OrderStatus"].ToString();
                                }
                            }

                            // 2. जर स्टेटस 'Pending' असेल तरच अपडेट करा
                            if (currentStatus == "Pending")
                            {
                                // अ) ऑर्डर स्टेटस अपडेट करा
                                string updateOrder = "UPDATE orders SET OrderStatus = @status WHERE OrderId = @id";
                                MySqlCommand cmdOrder = new MySqlCommand(updateOrder, conn, trans);
                                cmdOrder.Parameters.AddWithValue("@status", status);
                                cmdOrder.Parameters.AddWithValue("@id", orderId);
                                cmdOrder.ExecuteNonQuery();

                                // ब) स्टॉक वजा करण्याऐवजी प्लस (+) करा (विक्री मोजण्यासाठी)
                                // येथे आपण LOWER आणि TRIM वापरले आहे जेणेकरून नावातील स्पेलिंग मिस्टेक टाळता येतील
                                string updateStockSql = "UPDATE productlist SET stock_quantity = stock_quantity + @qty WHERE LOWER(TRIM(productName)) = LOWER(TRIM(@pname))";
                                MySqlCommand cmdStock = new MySqlCommand(updateStockSql, conn, trans);
                                cmdStock.Parameters.AddWithValue("@qty", qty);
                                cmdStock.Parameters.AddWithValue("@pname", pName);

                                cmdStock.ExecuteNonQuery();

                                trans.Commit();
                            }
                        }
                        catch
                        {
                            trans.Rollback();
                            throw;
                        }
                    }
                }
                LoadDashboardData();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void GetTopProduct()
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connline))
                {
                    conn.Open();
                    string sql = "SELECT ProductName, COUNT(ProductName) AS Occurrences FROM orders GROUP BY ProductName ORDER BY Occurrences DESC LIMIT 1";
                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        object result = cmd.ExecuteScalar();
                        if (result != null) lblTopProduct.Text = result.ToString();
                        else lblTopProduct.Text = "No Sales Yet";
                    }
                }
            }
            catch (Exception) { lblTopProduct.Text = "Error"; }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // १. सर्व सेशन्स क्लिअर करा
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            // २. ब्राउझरची कॅशे क्लिअर करण्यासाठी (जेणेकरून बॅक बटण दाबल्यावर पुन्हा डॅशबोर्ड दिसणार नाही)
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            // ३. लॉगिन पेजवर पाठवा
            Response.Redirect("AdminLogin.aspx");
        }
    }
}