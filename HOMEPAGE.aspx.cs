using System;
using System.Web;
using System.Web.UI;

namespace HOMEEE_PAGE
{
    public partial class HOMEPAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Session expire jhalyavar page refresh kara kiwa login var pathva
            Response.Redirect("LOGINPAGE.aspx");
        }
    }
}