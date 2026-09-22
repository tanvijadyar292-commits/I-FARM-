using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace HOMEEE_PAGE
{
    public partial class ADDCARDUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               //nav bar disnyasathi

                CheckUserSession();
                LoadCartDetails();
            }
        }

        private void CheckUserSession()
        {
            if (Session["UserEmail"] != null)
            {
                phAnonymous.Visible = false;
                phLoggedIn.Visible = true;
            }
            else
            {
                phAnonymous.Visible = true;
                phLoggedIn.Visible = false;
            }
        }

        private void LoadCartDetails()
        {
            if (Session["Cart"] != null)
            {
                DataTable dt = (DataTable)Session["Cart"];
                if (dt.Rows.Count > 0)
                {
                    rptCart.DataSource = dt;
                    rptCart.DataBind();

                    double grandTotal = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        grandTotal += (Convert.ToDouble(row["price"]) * Convert.ToInt32(row["qty"]));
                    }

                    lblTotal.Text = grandTotal.ToString("N2");
                    pnlEmptyCart.Visible = false;
                    btnCheckout.Enabled = true; //checout tevach hoil jeva card made product asel
                }
                else { ShowEmptyMessage(); }
            }
            else { ShowEmptyMessage(); }
        }

        private void ShowEmptyMessage()
        {
            rptCart.Visible = false;
            pnlEmptyCart.Visible = true;
            lblTotal.Text = "0.00";
            btnCheckout.Enabled = false; //card khali asel tar button unvisible asel
        }

      //button checkout ch
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("AddressUI.aspx");
            }
            else
            {
                // Ithe aapan sangtoye ki Login nantar parat 'ADDCARDUI.aspx' var ye
                Response.Redirect("Registerpage.aspx?returnUrl=ADDCARDUI.aspx");
            }
        }


     //logout button
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("HOMEPAGE.aspx");
        }
    }
}