using System;
using System.Data;
using System.Web.UI;
using MySql.Data.MySqlClient; 

namespace HOMEEE_PAGE
{
    public partial class adminorder : System.Web.UI.Page
    {
        
        string conntline = "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // admin order tapasane
            string role = Session["UserRole"] != null ? Session["UserRole"].ToString() : "NULL";
            Response.Write("<script>alert('adminorder वर पोहचलो! सेशन आहे: " + role + "');</script>");

           

            if (Session["UserRole"] == null)
            {
                

                Response.Redirect("LOGINPAGE.aspx");
            }
            else if (Session["UserRole"].ToString() != "Admin")
            {
                //  (User sathi
                Response.Write("<script>alert('Session ID: " + Session.SessionID + "');</script>");
                Response.Write("<h1 style='color:red;'>Access Denied! You are logged in as: " + Session["UserRole"].ToString() + "</h1>");
                Response.End();
            }
            else
            {
              
                if (!IsPostBack)
                {
                    LoadAllOrders();
                }
            }
        }
        private void LoadAllOrders()
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(conntline))
                {
                    conn.Open();
                  
                    string query = "SELECT OrderId, UserEmail, ProductDetails, TotalAmount, PaymentMethod, OrderStatus, OrderDate FROM orders ORDER BY OrderDate DESC";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);//kahi chukal tar samjel

                        if (dt.Rows.Count > 0)
                        {
                            gvAllOrders.DataSource = dt;
                            gvAllOrders.DataBind();
                            lblMessage.Text = "Success! Orders loaded.";
                            lblMessage.CssClass = "text-success fw-bold";
                        }
                        else
                        {
                            lblMessage.Text = "No orders found in database.";
                            lblMessage.CssClass = "text-warning fw-bold";
                        }
                    }
                }
            }
            catch (Exception ex)
            {//chuk screen var disel
                lblMessage.Text = "Database Error: " + ex.Message;
                lblMessage.CssClass = "text-danger p-2 border border-danger";
            }
        }
    }
}