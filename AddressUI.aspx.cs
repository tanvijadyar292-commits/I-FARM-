using Microsoft.EntityFrameworkCore.Storage;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace HOMEEE_PAGE
{
    public partial class AddressUI : System.Web.UI.Page
    {
       //database la connect karnyasathi
        string connectline= "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LOGINPAGE.aspx");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            string loggedInUser = Session["UserEmail"].ToString();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectline))
                {
                    string sql = "INSERT INTO useraddress (UserEmail, FirstName, LastName, Email, Phone, City, State, ZipCode, FullAddress) " +
                                 "VALUES (@userEmail, @fn, @ln, @em, @ph, @ct, @st, @pc, @ad)";

                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@userEmail", loggedInUser);
                        cmd.Parameters.AddWithValue("@fn", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@ln", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@em", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@ph", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@ct", txtCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@st", txtState.Text.Trim());
                        cmd.Parameters.AddWithValue("@pc", txtZip.Text.Trim());
                        cmd.Parameters.AddWithValue("@ad", txtAddress.Text.Trim());

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                         //card made product asel tar process karane
                            if (Session["Cart"] != null)
                            {
                                DataTable dt = (DataTable)Session["Cart"];
                                double total = 0;
                                string productNames = "";

                                foreach (DataRow row in dt.Rows)
                                {
                                  //sarv amount ky ahe te check karane
                                    total += Convert.ToDouble(row["price"]) * Convert.ToInt32(row["qty"]);

                                   //product ch nav milavane
                                    if (dt.Columns.Contains("ProductName"))
                                        productNames += row["ProductName"].ToString() + ", ";
                                    else if (dt.Columns.Contains("name"))
                                        productNames += row["name"].ToString() + ", ";
                                    else if (dt.Columns.Contains("pname"))
                                        productNames += row["pname"].ToString() + ", ";
                                }

                                Session["TotalAmount"] = total;
                               
                                Session["ProductName"] = productNames.TrimEnd(',', ' ');
                            }

                         // addresss lihilela databse la pathavne
                            Session["UserAddress"] = txtAddress.Text.Trim() + ", " + txtCity.Text.Trim() + ", " + txtZip.Text.Trim();

                          // address saev jhalyavar success sms yene
                            string script = "alert('Address saved successfully!'); window.location='paymentway.aspx';";
                            ClientScript.RegisterStartupScript(this.GetType(), "Success", script, true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message.Replace("'", "\"").Replace("\n", " ");
                ClientScript.RegisterStartupScript(this.GetType(), "Error", $"alert('Database Error: {errorMsg}');", true);
            }
        }
    }
}