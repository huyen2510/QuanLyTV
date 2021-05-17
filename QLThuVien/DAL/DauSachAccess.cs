using DTO.Sach;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DauSachAccess:DatabaseAccess
    {
        public List<SachTheoTheLoai> DanhSachDauSachTheoTheLoai(string tenTheLoai)
        {
            List<SachTheoTheLoai> list = new List<SachTheoTheLoai>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "exec P_LayDanhSachTheoTheLoai @tenTheLoai";
            command.Parameters.Add("@tenTheLoai", SqlDbType.NChar).Value = tenTheLoai;
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                SachTheoTheLoai x = new SachTheoTheLoai();
                x.MaTheLoai = reader.GetInt32(0);
                x.TenTheLoai = reader.GetString(1);
                try
                {
                    x.MaDauSach = reader.GetString(2);
                    x.TenDauSach = reader.GetString(3);
                    x.TenTacGia = reader.GetString(4);
                    x.Tap = reader.GetInt32(5);
                    x.SoLuong = reader.GetInt32(6);
                }catch
                {
                    return list;
                }

                list.Add(x);

            }
            return list;
        }

    }
}
