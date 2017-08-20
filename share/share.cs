using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace share
{
    public class share
    {
        public DateTime date { get; set; }
        public decimal pigmi { get; set; }
        public decimal expences1 { get; set; }
        public decimal df { get; set; }
        public decimal expences2 { get; set; }
        public string remarks { get; set; }

        public string SaveData(share objshare)
        {
            string error=string.Empty;
            DAL objdal = new DAL();
            string sqlstr = @"insert into sharetbl(Date,Pigmi,Expences1,DF,Expences2,Remarks) values('"+objshare.date+"',"+objshare.pigmi+","+objshare.expences1+","+objshare.df+","+objshare.expences2+",'"+objshare.remarks+"')";
            double d =objdal.SQLQueryInsert(sqlstr, out error);
            if (d > 0)
                return "Successfully Saved";
            else
                return "Failed to Save";
        }
    }
}