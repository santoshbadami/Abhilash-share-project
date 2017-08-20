using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace share
{
    public class DAL
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConStr"].ToString());
        #region InsertSQL
        public double SQLQueryInsert(string sqlQuery, out string errMsg)
        {
            try
            {
             
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sqlQuery;
                    con.Open();
                    double recd = cmd.ExecuteNonQuery();
                    if (recd > 0)
                    {
                        errMsg = recd.ToString() + " row(s) affected!";
                        return recd;
                    }
                    else
                    {
                        errMsg = "Error: " + recd.ToString() + " row(s) affected!";
                        return recd;
                    }
                }
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
                return -1;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
    }
}