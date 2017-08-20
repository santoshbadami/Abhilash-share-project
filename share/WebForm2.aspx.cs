using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace share
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConStr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadStores();
            }
        }
        protected void loadStores()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"Select * from sharetbl2", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gridView.DataSource = ds;
                gridView.DataBind();
                LoadTotals();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gridView.DataSource = ds;
                gridView.DataBind();
                int columncount = gridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }
        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            loadStores();
        }
        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = gridView.DataKeys[e.RowIndex].Values["id"].ToString();
            TextBox date = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtDate");
            TextBox debitcreditdetails = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtdebitcreditdetails");
            TextBox Pigmi = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtPigmi");
            TextBox df = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtDF");
            con.Open();
            SqlCommand cmd = new SqlCommand("update sharetbl2 set Date='" + date.Text + "', debitcreditdetails='" + debitcreditdetails.Text + "', Pigmi=" + Pigmi.Text + ", DF=" + df.Text + " where id=" + id, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.BackColor = Color.Blue;
            lblmsg.ForeColor = Color.White;
            lblmsg.Text = id + "        Updated successfully........    ";
            gridView.EditIndex = -1;
            loadStores();
        }
        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            loadStores();
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gridView.DataKeys[e.RowIndex].Values["id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from sharetbl2 where id=" + id, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                loadStores();
                lblmsg.BackColor = Color.Red;
                lblmsg.ForeColor = Color.White;
                lblmsg.Text = id + "      Deleted successfully.......    ";
            }
            LoadTotals();
        }
        protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
                Button lnkbtnresult = (Button)e.Row.FindControl("ButtonDelete");
                if (lnkbtnresult != null)
                {
                    lnkbtnresult.Attributes.Add("onclick", "javascript:return deleteConfirm('" + id + "')");
                }
            }
        }
        protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {

                TextBox inDate = (TextBox)gridView.HeaderRow.FindControl("inDate");
                TextBox indebitcreditdetails = (TextBox)gridView.HeaderRow.FindControl("indebitcreditdetails");
                TextBox inPigmi = (TextBox)gridView.HeaderRow.FindControl("inPigmi");
                TextBox inDF = (TextBox)gridView.HeaderRow.FindControl("inDF");

                con.Open();
                SqlCommand cmd =
                    new SqlCommand(
                        "insert into sharetbl2(Date,debitcreditdetails,Pigmi,DF) values('" + inDate.Text + "','" +
                        indebitcreditdetails.Text + "'," + inPigmi.Text + "," + inDF.Text + ")", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    loadStores();
                    lblmsg.BackColor = Color.Green;
                    lblmsg.ForeColor = Color.White;
                    lblmsg.Text = "      Added successfully......    ";
                }
                else
                {
                    lblmsg.BackColor = Color.Red;
                    lblmsg.ForeColor = Color.White;
                    lblmsg.Text = " Error while adding row.....";
                }
            }
            LoadTotals();
        }
        private void LoadTotals()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand(@"select sum(Pigmi) as pigmi,sum(DF)as DF FROM [share].[dbo].[sharetbl2]", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            Label lblPigmi = (Label)gridView.FooterRow.FindControl("lblpigmi");
            lblPigmi.Text = dt.Rows[0]["pigmi"].ToString();
            Label lbldf = (Label)gridView.FooterRow.FindControl("lbldf");
            lbldf.Text = dt.Rows[0]["DF"].ToString();
            
        }
    }
}