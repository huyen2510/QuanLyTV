using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.MuonTra;
namespace DAL
{
    public class MuonTraAccess : DatabaseAccess
    {
        public List<GiaoDienMuonTra> HienThiGiaoDienMuonTra()
        {
            List<GiaoDienMuonTra> LS = new List<GiaoDienMuonTra>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from HienThiGiaoDienMuonTra";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                GiaoDienMuonTra temp = new GiaoDienMuonTra();
                temp.MaMuonTra = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    temp.MaSach = reader.GetString(1);
                }
                else
                {
                    temp.MaSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    temp.MaDocGia = reader.GetInt32(2);
                }
                else
                {
                    temp.MaDocGia = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    temp.TenDocGia = reader.GetString(3);
                }
                else
                {
                    temp.TenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    int datra = reader.GetInt32(4);
                    if (datra == 0) temp.TinhTrang = "Chưa trả";
                    else
                    {
                        temp.TinhTrang = "Đã trả";
                    }
                }
                else
                {
                    temp.TinhTrang = "Chưa có thông tin";
                }
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
        public ChiTietMuonTra LayThongTinMuonTra(int MaMuonTra)
        {
            ChiTietMuonTra kq = new ChiTietMuonTra();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ThongTinChiTietMuonTra(@mamuontra)";
            command.Connection = conn;
            command.Parameters.Add("@mamuontra", SqlDbType.Int).Value = MaMuonTra;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                kq.MaMuonTra = reader.GetInt32(0);
                kq.MaSach = reader.GetString(1);
                kq.TenSach = reader.GetString(2);
                kq.Tap = reader.GetInt32(3);
                kq.LanTB = reader.GetInt32(4);
                kq.NgayMuon = reader.GetDateTime(5);
                kq.HanMuon = reader.GetDateTime(6);
                int datra = reader.GetInt32(7);
                if (!reader.IsDBNull(9))
                {
                    datra = reader.GetInt32(7);
                    kq.NgayQuaHan = reader.GetInt32(9);
                    if (kq.NgayQuaHan < 0)
                    {
                        kq.NgayQuaHan = 0;
                    }
                    if (datra == 0)
                    {
                        kq.TinhTrang = "Chưa trả";

                    }
                    else
                    {
                        kq.TinhTrang = "Đã trả";
                    }

                }
                else
                {
                    kq.TinhTrang = "Chưa trả";
                    kq.NgayQuaHan = 0;
                }
                kq.MaNV = reader.GetInt32(8);
                kq.MaDocGia = reader.GetInt32(10);
                kq.TenDocGia = reader.GetString(11);
                kq.DonVi = reader.GetString(12);
                kq.SoCuonDangMuon = reader.GetInt32(13);
            }
            reader.Close();
            return kq;
        }
        public bool ChoMuonSach(MuonSach temp) 
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "ChoMuonSach";
            command.Connection = conn;

            command.Parameters.Add("@masach", SqlDbType.NChar).Value = temp.MaSach;
            command.Parameters.Add("@madocgia", SqlDbType.Int).Value = temp.MaDG;
            command.Parameters.Add("@manhanvien", SqlDbType.Int).Value = temp.MaNV;
            command.Parameters.Add("@ngaytra", SqlDbType.DateTime).Value = temp.NgayHanTra;
            
            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public bool SuaThongTinMuonTra(int MaMT,DateTime HanMuon,string MaSach)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SuaThongTinMuonTra";
            command.Connection = conn;

            command.Parameters.Add("@mamuontra", SqlDbType.Int).Value = MaMT;
            command.Parameters.Add("@hanmuon", SqlDbType.DateTime).Value = HanMuon;
            command.Parameters.Add("@masach", SqlDbType.NChar).Value = MaSach;           
            
            int kq = command.ExecuteNonQuery();
            return kq > 0;

        }
        public List<GiaoDienMuonTra> TimKiemMuonTra(string strthongtin)
        {
            List<GiaoDienMuonTra> LS = new List<GiaoDienMuonTra>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.TimKiemMuonTra(@strthongtin)";
            command.Connection = conn;
            command.Parameters.Add("@strthongtin", SqlDbType.NVarChar).Value = strthongtin;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                GiaoDienMuonTra temp = new GiaoDienMuonTra();
                temp.MaMuonTra = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    temp.MaSach = reader.GetString(1);
                }
                else
                {
                    temp.MaSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    temp.MaDocGia = reader.GetInt32(2);
                }
                else
                {
                    temp.MaDocGia = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    temp.TenDocGia = reader.GetString(3);
                }
                else
                {
                    temp.TenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    int datra = reader.GetInt32(4);
                    if (datra == 0) temp.TinhTrang = "Chưa trả";
                    else
                    {
                        temp.TinhTrang = "Đã trả";
                    }
                }
                else
                {
                    temp.TinhTrang = "Chưa có thông tin";
                }
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }

        public List<DocGiaViPham> HienThiListSachDangMuonQuaHan()
        {
            List<DocGiaViPham> docGiaViPhams = new List<DocGiaViPham>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM ThongKeDocGiaViPhamQuaHan";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DocGiaViPham docGiaViPham = new DocGiaViPham();
                if (!reader.IsDBNull(0))
                {
                    docGiaViPham.maDocGia = reader.GetInt32(0);
                }
                else
                {
                    Console.WriteLine("null ma muon tra ");
                }

                if (!reader.IsDBNull(1))
                {
                    docGiaViPham.tenDocGia = reader.GetString(1);
                }
                else
                {
                    docGiaViPham.tenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    docGiaViPham.soNgayQuaHan = reader.GetInt32(5);
                }
                else
                {
                    docGiaViPham.soNgayQuaHan = -1;
                }
                docGiaViPham.maSach = reader.GetString(6);  
                
                docGiaViPhams.Add(docGiaViPham);
            }

            reader.Close();
            return docGiaViPhams;
        }

    }
}
