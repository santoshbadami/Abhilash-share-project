using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using share;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
namespace share
{
    public partial class _Default : Page
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
            SqlCommand cmd = new SqlCommand(@"Select * from sharetbl", con);
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
            TextBox Pigmi = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtPigmi");
            TextBox Expences1 = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtExpences1");
            TextBox df = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtDF");
            TextBox Expences2 = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtExpences2");
            TextBox Remarks = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtRemarks");
            con.Open();
            SqlCommand cmd = new SqlCommand("update sharetbl set Date='" + date.Text + "', Remarks='" + Remarks.Text + "', Pigmi=" + Pigmi.Text + ", DF=" + df.Text + ", Expences1=" + Expences1.Text + ", Expences2=" + Expences2.Text + " where id=" + id, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.BackColor = Color.Blue;
            lblmsg.ForeColor = Color.White;
            lblmsg.Text = id + "        Updated successfully........    ";
            gridView.EditIndex = -1;
            loadStores();
            LoadTotals();
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
            SqlCommand cmd = new SqlCommand("delete from sharetbl where id=" + id, con);
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
                TextBox inPigmi = (TextBox)gridView.HeaderRow.FindControl("inPigmi");
                TextBox inExpences1 = (TextBox)gridView.HeaderRow.FindControl("inExpences1");
                TextBox inDF = (TextBox)gridView.HeaderRow.FindControl("inDF");
                TextBox inExpences2 = (TextBox)gridView.HeaderRow.FindControl("inExpences2");
                TextBox inRemarks = (TextBox)gridView.HeaderRow.FindControl("inRemarks");
                con.Open();
                SqlCommand cmd =
                    new SqlCommand(
                        "insert into sharetbl(Date,Pigmi,Expences1,DF,Expences2,Remarks) values('" + inDate.Text + "'," +
                        inPigmi.Text + "," + inExpences1.Text + "," + inDF.Text + ","+inExpences2.Text+",'"+inRemarks.Text+"')", con);
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
                LoadTotals();
            }
        }

        private void LoadTotals()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand(@"select sum(Pigmi) as pigmi,sum(Expences1)as Expences1,sum(DF)as DF,sum(Expences2)as Expences2 
  FROM [share].[dbo].[sharetbl]", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            Label lblPigmi = (Label)gridView.FooterRow.FindControl("lblpigmi");
            lblPigmi.Text = dt.Rows[0]["pigmi"].ToString();
            Label lblexpences1 = (Label)gridView.FooterRow.FindControl("lblexpences1");
            lblexpences1.Text = dt.Rows[0]["Expences1"].ToString();
            Label lbldf = (Label)gridView.FooterRow.FindControl("lbldf");
            lbldf.Text = dt.Rows[0]["DF"].ToString();
            Label lblExpences2 = (Label)gridView.FooterRow.FindControl("lblExpences2");
            lblExpences2.Text = dt.Rows[0]["Expences2"].ToString();
    
        }
    }
}