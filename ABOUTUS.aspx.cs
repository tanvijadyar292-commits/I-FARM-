using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOMEEE_PAGE
{
    public partial class ABOUTUS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserSession();
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();


            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);


                Response.Redirect("HOMEPAGE.aspx");
            }
        }



    }
}