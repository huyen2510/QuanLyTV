using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ThongKeAccess : DatabaseAccess
    {
        public List<DTO.DauSachDuocMuonNhieu> DauSachMuonNhieu()
        {
            List<DauSachDuocMuonNhieu> list = new List<DauSachDuocMuonNhieu>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.F_SachDuocMuonNhieu()";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DauSachDuocMuonNhieu x = new DauSachDuocMuonNhieu();
                x.TenDauSach = reader.GetString(0);
                x.Tap = reader.GetInt32(1);
                x.SoLuotMuon = reader.GetInt32(1);

                list.Add(x);

            }
            reader.Close();
            return list;
        }
        public List<DauSachDuocMuonNhieu> SachConLai() 
        {
            List<DauSachDuocMuonNhieu> list = new List<DauSachDuocMuonNhieu>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.F_SoLuongSachConlai()";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DauSachDuocMuonNhieu x = new DauSachDuocMuonNhieu();
                x.TenDauSach = reader.GetString(0);
                x.Tap = reader.GetInt32(1);
                x.SoLuotMuon = reader.GetInt32(1);

                list.Add(x);

            }
            reader.Close();
            return list;
        }
        public List<TheLoaiYeuThich> TheLoaiYeuThich()
        {
            List<TheLoaiYeuThich> list = new List<TheLoaiYeuThich>();
            /*OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "exec P_TheLoaiYeuThich";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TheLoaiYeuThich x = new TheLoaiYeuThich();
                x.MaTheLoai = reader.GetInt32(0);
                x.TenTheLoai = reader.GetString(1);
                x.SoLuot = reader.GetInt32(2);

                list.Add(x);

            }
            reader.Close();*/
            return list;
        }
    } 
}
