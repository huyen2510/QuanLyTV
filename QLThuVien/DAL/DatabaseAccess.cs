using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DatabaseAccess
    {
        public DatabaseAccess() { }
        public string strConn = @"Data Source=LAPTOP-BKHNHYN;Initial Catalog=QuanLyTV;Integrated Security=True";
        protected SqlConnection conn = null;
        public void OpenConnection()
        {
            try
            {
                if (conn == null)
                {
                    conn = new SqlConnection(strConn);
                }
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
            }
            catch
            {
                
            }
        }

        public void CloseConnection()
        {
            if (conn != null && conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        
    }
}
