using DTO.TheLoai;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class TheLoaiAccess:DatabaseAccess
    {
     
        public TheLoaiAccess() { }
        public List<TheLoai> LayDanhSachTheLoai()
        {
            List<TheLoai> list = new List<TheLoai>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from TheLoai";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TheLoai temp = new TheLoai();
                temp.MaTheLoai = reader.GetInt32(0);
                temp.TenTheLoai = reader.GetString(1);
                list.Add(temp);
            }
            reader.Close();
            return list;
        }
    }
}
