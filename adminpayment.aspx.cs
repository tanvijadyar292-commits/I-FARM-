using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace HOMEEE_PAGE
{
    public partial class adminpayment : System.Web.UI.Page
    {
        string conndataline = "Server=127.0.0.1;Port=3308;Database=ifarm;Uid=root;Pwd=mysql02;AllowPublicKeyRetrieval=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentData();
            }
        }

       // base madun payment kadhane
        private void LoadPaymentData()
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(conndataline))
                {
                    string query = "SELECT RecordID, FarmerName, Amount, PaymentDate, Status FROM farmerpaymentrecord ORDER BY PaymentDate DESC";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvPayments.DataSource = dt;
                    gvPayments.DataBind();
                }
            }
            catch (Exception ex)
            {
              //chuk asel tar dakhvel
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        protected void AddPayment(string farmerName, decimal amount, string status)
        {
            using (MySqlConnection conn = new MySqlConnection(conndataline))
            {
                string query = "INSERT INTO farmerpaymentrecord (FarmerName, Amount, Status) VALUES (@name, @amount, @status)";
                MySqlCommand cmd = new MySqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@name", farmerName);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@status", status);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
      //paymet keli tar buuton paid karane
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string recordId = btn.CommandArgument; //id record milavanyasathi

            try
            {
                using (MySqlConnection conn = new MySqlConnection(conndataline))
                {
                    string query = "UPDATE farmerpaymentrecord SET Status = 'Paid' WHERE RecordID = @id";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", recordId);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                  //upadet karun parat load karnyasathi
                    LoadPaymentData();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Update Failed: " + ex.Message + "');</script>");
            }
        }
    }
}