using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.Login;
namespace DAL
{
    public class LoginAccess : DatabaseAccess
    {
        public bool DangNhap(Login login)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC Login @TenDangNhap,@MatKhau";
            command.Connection = conn;
            command.Parameters.Add("@TenDangNhap", SqlDbType.NVarChar).Value = login.TenDangNhap;
            command.Parameters.Add("@MatKhau", SqlDbType.NVarChar).Value =login.MatKhau;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
    }
}
