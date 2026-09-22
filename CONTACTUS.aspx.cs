using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace HOMEEE_PAGE
{
    public partial class CONTACTUS : System.Web.UI.Page
    {
        // Connection String - तुझा पोर्ट 3308 आणि पासवर्ड mysql02 इथे सेट आहे
        string connectionlinnk = "server=localhost;port=3308;database=ifarm;user=root;password=mysql02;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // लॉगिन स्टेटस चेक करण्यासाठी (Placeholder logic)
            if (Session["UserName"] != null)
            {
                phAnonymous.Visible = false;
                phLoggedIn.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // १. व्हॅलिडेशन: महत्त्वाची फील्ड्स रिकामी नाहीत ना हे तपासणे
            if (string.IsNullOrEmpty(txtFirstName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtMessage.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('कृपया सर्व आवश्यक माहिती भरा!');", true);
                return;
            }

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionlinnk))
                {
                    conn.Open();

                    // २. SQL INSERT क्वेरी - तुझ्या 'describe contactus' नुसार कॉलमची नावे सेट केली आहेत
                    // SubmittedAt साठी NOW() वापरले आहे जेणेकरून वेळेची अचूक नोंद होईल
                    string query = "INSERT INTO contactus (FirstName, LastName, Email, Phone, Message, SubmittedAt) VALUES (@fName, @lName, @email, @phone, @msg, NOW())";

                    using (MySqlCommand commande = new MySqlCommand(query, conn))
                    {
                        commande.Parameters.AddWithValue("@fName", txtFirstName.Text.Trim());
                        commande.Parameters.AddWithValue("@lName", txtLastName.Text.Trim());
                        commande.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        commande.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                        commande.Parameters.AddWithValue("@msg", txtMessage.Text.Trim());

                        int result = commande.ExecuteNonQuery();

                        if (result > 0)
                        {
                            // ३. यश मिळताच अलर्ट मेसेज दाखवणे
                            string fullName = txtFirstName.Text.Trim() + " " + txtLastName.Text.Trim();
                            string successScript = $"alert('Thank you {fullName}!youe message successfully send.');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", successScript, true);

                            // ४. फॉर्म क्लिअर करा
                            ClearForm();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // एरर आल्यास त्याचा मेसेज दाखवा (Replace वापरला आहे जेणेकरून JavaScript अलर्ट ब्रेक होणार नाही)
                string errorMsg = ex.Message.Replace("'", "");
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('डेटाबेस एरर: {errorMsg}');", true);
            }
        }

        // फॉर्ममधील सर्व टेक्स्टबॉक्सेस रिकामे करण्यासाठी फंक्शन
        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtMessage.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("HOMEPAGE.aspx");
        }
    }
}