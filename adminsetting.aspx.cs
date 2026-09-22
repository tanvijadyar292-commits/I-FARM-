using System;
using MySql.Data.MySqlClient;

namespace HOMEEE_PAGE
{
    public partial class adminsetting : System.Web.UI.Page
    {
        string connStr = "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // आता आपण फक्त 'AdminID' तपासात आहोत कारण लॉगिन पेजवर तेच सेट केले आहे
            if (Session["AdminID"] == null)
            {
                // जर ID नसेल, तरच लॉगिनला पाठवा
                Response.Redirect("ADMINlogin.aspx"); // इथे तुमच्या लॉगिन पेजचे नाव लिहा
            }
        }

       
        
       
        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    conn.Open();
                    // ईमेलऐवजी AdminID वापरा
                    string checkQuery = "SELECT COUNT(*) FROM admins WHERE Email = @email AND Password = @oldPass";
                    using (MySqlCommand cmdCheck = new MySqlCommand(checkQuery, conn))
                    {
                        // इथे Session["AdminID"] वापरा
                        cmdCheck.Parameters.AddWithValue("@email", Session["AdminID"].ToString());
                        cmdCheck.Parameters.AddWithValue("@oldPass", txtOldPass.Text);

                        int count = Convert.ToInt32(cmdCheck.ExecuteScalar());

                        if (count > 0)
                        {
                            string updateQuery = "UPDATE admins SET Password = @newPass WHERE Email = @email";
                            MySqlCommand cmdUpdate = new MySqlCommand(updateQuery, conn);
                            cmdUpdate.Parameters.AddWithValue("@newPass", txtNewPass.Text);
                            cmdUpdate.Parameters.AddWithValue("@email", Session["AdminID"].ToString());
                            cmdUpdate.ExecuteNonQuery();

                            lblMsg.Text = "Password Updated Successfully!";
                            lblMsg.ForeColor = System.Drawing.Color.Green;
                            txtOldPass.Text = ""; txtNewPass.Text = "";
                        }
                        else
                        {
                            lblMsg.Text = "Invalid Old Password!";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }

    }
}