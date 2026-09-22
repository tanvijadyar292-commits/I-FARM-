using System;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Data;

namespace HOMEEE_PAGE
{
    public partial class ADMINlogin : System.Web.UI.Page
    {
        // तुमचा Port 3308 आणि Database ifarm बरोबर सेट केला आहे
        string connStr = "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // जर अ‍ॅडमिन आधीच लॉगिन असेल तर थेट डॅशबोर्डवर पाठवा
                if (Session["AdminID"] != null)
                {
                    Response.Redirect("ADMINDASHBOARD.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            // Frontend मधील ID तपासा: txtAdminID आणि txtAdminPassword
            string inputID = txtAdminID.Text.Trim();
            string inputPass = txtAdminPassword.Text.Trim();

            if (string.IsNullOrEmpty(inputID) || string.IsNullOrEmpty(inputPass))
            {
                lblMsg.Text = "Please enter both ID and Password.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    // टेबलचे नाव 'adminlogin' आणि कॉलमचे नाव 'AdminID' व 'AdminPassword' वापरले आहे
                    string sql = "SELECT AdminName FROM adminlogin WHERE AdminID = @id AND AdminPassword = @pass";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", inputID);
                    cmd.Parameters.AddWithValue("@pass", inputPass);

                    conn.Open();
                    object result = cmd.ExecuteScalar(); // हे फंक्शन AdminName रिटर्न करेल

                    if (result != null)
                    {
                        // १. Session Set करणे (डॅशबोर्डवर वापरण्यासाठी)
                        Session["AdminLoggedIn"] = "true";
                        Session["AdminID"] = inputID;
                        Session["AdminName"] = result.ToString();

                        // २. डॅशबोर्ड पेजवर रिडायरेक्ट करणे
                        Response.Redirect("ADMINDASHBOARD.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        // जर रेकॉर्ड सापडले नाही तर
                        lblMsg.Text = "Invalid Admin Credentials!";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                // डेटाबेस एरर किंवा इतर तांत्रिक अडचण
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}