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
    public class SachAccess : DatabaseAccess
    {
        public List<Sach> HienThiGiaoDienSach()
        {
            List<Sach> LS = new List<Sach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from HienThiGiaoDienSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
           
            while (reader.Read())
            {
                Sach temp = new Sach();
                temp.MaSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    temp.TenDauSach = reader.GetString(1);
                }
                else
                {
                    temp.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    temp.Tap = reader.GetInt32(2);
                }
                else
                {
                    temp.Tap = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    temp.LanTaiBan = reader.GetInt32(3);
                }
                else
                {
                    temp.LanTaiBan = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    temp.ViTri = reader.GetString(4);
                }
                else
                {
                    temp.ViTri = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    temp.NguoiMuon = reader.GetString(5);
                }
                else
                {
                    temp.NguoiMuon = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(6))
                {
                    temp.TacGia = reader.GetString(6);
                }
                else
                {
                    temp.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(7))
                {
                    temp.TheLoai = reader.GetString(7);
                }
                else
                {
                    temp.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(8))
                {
                    temp.NgonNgu = reader.GetString(8);
                }
                else
                {
                    temp.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(9))
                {
                    temp.NXB = reader.GetString(9);
                }
                else
                {
                    temp.NXB = "Chưa có thông tin";
                }
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
        public List<DauSach> LayDauSach()
        {
            List<DauSach> dsDS = new List<DauSach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from DauSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DauSach temp = new DauSach();
                temp.MaDauSach = reader.GetString(0);
                temp.TenDauSach = reader.GetString(1);
                dsDS.Add(temp);
            }
            reader.Close();
            return dsDS;
        }
        public List<GiaSach> LayGiaSach()
        {
            List<GiaSach> dstemp = new List<GiaSach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from GiaSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                GiaSach temp = new GiaSach();
                if (!reader.IsDBNull(0))
                {
                    temp.MaGiaSach = reader.GetInt32(0);
                }
                else
                {

                }
                if (!reader.IsDBNull(1))
                {
                    temp.TenGiaSach = reader.GetString(1);
                }
                else
                {

                }
            
                dstemp.Add(temp);
            }
            reader.Close();
            return dstemp;
        }
        public bool ThemSach(AddSach temp)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "ThemSach";
            command.Connection = conn;

            command.Parameters.Add("@madausach", SqlDbType.NChar).Value = temp.MaDauSach;
            command.Parameters.Add("@masach", SqlDbType.NChar).Value = temp.MaSach;
            command.Parameters.Add("@tap", SqlDbType.NChar).Value = temp.Tap;
            command.Parameters.Add("@lantaiban", SqlDbType.Int).Value = temp.LanTaiBan;
            command.Parameters.Add("@namxb", SqlDbType.NChar).Value = temp.NamXB;
            command.Parameters.Add("@sotrang", SqlDbType.NChar).Value = temp.SoTrang;
            command.Parameters.Add("@tinhtrang", SqlDbType.NChar).Value = temp.TinhTrang;
            command.Parameters.Add("@GiaSach", SqlDbType.NChar).Value = temp.GiaSach;
            command.Parameters.Add("@Tang", SqlDbType.NChar).Value = temp.Tang;
            command.Parameters.Add("@Ngan", SqlDbType.NChar).Value = temp.Ngan;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public bool ThemDauSach(AddDauSach temp)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "ThemDauSach";
            command.Connection = conn;

            command.Parameters.Add("@madausach", SqlDbType.NChar).Value = temp.MaDauSach;
            command.Parameters.Add("@tendausach", SqlDbType.NVarChar).Value = temp.TenDauSach;
            command.Parameters.Add("@tacgia", SqlDbType.NVarChar).Value = temp.TenTacGia;
            command.Parameters.Add("@NXB", SqlDbType.NVarChar).Value = temp.NXB;
            command.Parameters.Add("@theloai", SqlDbType.NVarChar).Value = temp.TenTheLoai;
            command.Parameters.Add("@ngonngu", SqlDbType.NVarChar).Value = temp.NgonNgu;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public ThongTinSach LayThongTinSach(string MaSach)
        {
            ThongTinSach kq = new ThongTinSach();          
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ThongTinChiTietCuonSach(@masach)";      
            command.Connection = conn;
            command.Parameters.Add("@masach", SqlDbType.NChar).Value = MaSach;
            SqlDataReader reader = command.ExecuteReader();
            if(reader.Read())
            {                
                kq.MaDauSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    kq.TenDauSach = reader.GetString(1);
                }
                else
                {
                    kq.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    kq.TenTacGia = reader.GetString(2);
                }
                else
                {
                    kq.TenTacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    kq.TheLoai = reader.GetString(3);
                }
                else
                {
                    kq.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    kq.NgonNgu = reader.GetString(4);
                }
                else
                {
                    kq.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    kq.NhaXuatBan = reader.GetString(5);
                }
                else
                {
                    kq.NhaXuatBan = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(6))
                {
                    kq.MaSach = reader.GetString(6);
                }                
                if (!reader.IsDBNull(7))
                {
                    kq.Tap = reader.GetInt32(7);
                }
                else
                {
                    kq.Tap = 0;
                }
                if (!reader.IsDBNull(8))
                {
                    kq.LanTaiBan = reader.GetInt32(8);
                }
                else
                {
                    kq.LanTaiBan = 0;
                }
                if (!reader.IsDBNull(9))
                {
                    kq.SoTrang = reader.GetInt32(9);
                }
                else
                {
                    kq.SoTrang = 0;
                }
                if (!reader.IsDBNull(10))
                {
                    kq.NgayThem = reader.GetDateTime(10).ToString("dd/MM/yyyy");
                }
                else
                {
                    kq.NgayThem = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(11))
                {
                    kq.NamXuatBan = reader.GetDateTime(11);
                }
                else
                {
                    kq.NamXuatBan = new DateTime();
                }
                if (!reader.IsDBNull(12))
                {
                    kq.TinhTrang = reader.GetString(12);
                }
                else
                {
                    kq.TinhTrang = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(13))
                {
                    kq.MaGiaSach = reader.GetInt32(13);
                }
                else
                {
                    kq.MaGiaSach = 0;
                }
                if (!reader.IsDBNull(14))
                {
                    kq.TenGiaSach = reader.GetString(14);
                }
                else
                {
                    kq.TenGiaSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(15))
                {
                    kq.Tang = reader.GetInt32(15);
                }
                else
                {
                    kq.Tang = 0;
                }
                if (!reader.IsDBNull(16))
                {
                    kq.Ngan = reader.GetInt32(16);
                }
                else
                {
                    kq.Ngan = 0;
                }
                if (!reader.IsDBNull(17))
                {
                    kq.HinhAnh = reader.GetString(17);
                }
                else
                {
                    kq.HinhAnh = "";
                }
            }
            reader.Close();
            return kq;
        }
        public DauSach LayThongTinDauSach(string MaDauSach)
        {
            DauSach kq = new DauSach();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ThongTinChiTietDauSach(@madausach)";
            command.Connection = conn;
            command.Parameters.Add("@madausach", SqlDbType.NChar).Value = MaDauSach;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                kq.MaDauSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    kq.TenDauSach = reader.GetString(1);
                }
                else
                {
                    kq.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    kq.TacGia = reader.GetString(2);
                }
                else
                {
                    kq.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    kq.TheLoai = reader.GetString(3);
                }
                else
                {
                    kq.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    kq.NgonNgu = reader.GetString(4);
                }
                else
                {
                    kq.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    kq.NhaXuatBan = reader.GetString(5);
                }

                else
                {
                    kq.NhaXuatBan = "Chưa có thông tin";
                }               
            }
            reader.Close();
            return kq;
        }
        public bool SuaThongTinSach(ThongTinSach x)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SuaThongTinSach";
            command.Connection = conn;

            command.Parameters.Add("@masach", SqlDbType.NChar).Value = x.MaSach;
            command.Parameters.Add("@tap", SqlDbType.Int).Value = x.Tap;
            command.Parameters.Add("@lantaiban", SqlDbType.Int).Value = x.LanTaiBan;
            command.Parameters.Add("@sotrang", SqlDbType.Int).Value = x.SoTrang;
            command.Parameters.Add("@namxuatban", SqlDbType.DateTime).Value = x.NamXuatBan;
            command.Parameters.Add("@tinhtrang", SqlDbType.NVarChar).Value = x.TinhTrang;
            command.Parameters.Add("@giasach", SqlDbType.Int).Value = x.MaGiaSach;
            command.Parameters.Add("@tang", SqlDbType.Int).Value = x.Tang;
            command.Parameters.Add("@ngan", SqlDbType.Int).Value = x.Ngan;
            //command.Parameters.Add("@hinhanh", SqlDbType.NVarChar).Value = x.HinhAnh;
            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public bool SuaDauSach(DauSach x)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SuaDauSach";
            command.Connection = conn;

            command.Parameters.Add("@madausach", SqlDbType.NChar).Value = x.MaDauSach;
            command.Parameters.Add("@tendausach", SqlDbType.NChar).Value = x.TenDauSach;
            command.Parameters.Add("@tacgia", SqlDbType.NChar).Value = x.TacGia;
            command.Parameters.Add("@theloai", SqlDbType.NChar).Value = x.TheLoai;
            command.Parameters.Add("@NXB", SqlDbType.NChar).Value = x.NhaXuatBan;
            command.Parameters.Add("@ngonngu", SqlDbType.NChar).Value = x.NgonNgu;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public List<Sach> TimKiemSach(string thongtin)
        {
            List<Sach> ltk = new List<Sach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.TimKiemSach(@thongtin)";
            command.Connection = conn;
            command.Parameters.Add("@thongtin", SqlDbType.NVarChar).Value = thongtin;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Sach kq = new Sach();
                kq.MaSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    kq.TenDauSach = reader.GetString(1);
                }
                else
                {
                    kq.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    kq.Tap = reader.GetInt32(2);
                }
                else
                {
                    kq.Tap = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    kq.LanTaiBan = reader.GetInt32(3);
                }
                else
                {
                    kq.LanTaiBan = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    kq.ViTri = reader.GetString(4);
                }
                else
                {
                    kq.ViTri = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    kq.NguoiMuon = reader.GetString(5);
                }
                else
                {
                    kq.NguoiMuon = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(6))
                {
                    kq.TacGia = reader.GetString(6);
                }
                else
                {
                    kq.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(7))
                {
                    kq.TheLoai = reader.GetString(7);
                }
                else
                {
                    kq.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(8))
                {
                    kq.NgonNgu = reader.GetString(8);
                }
                else
                {
                    kq.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(9))
                {
                    kq.NXB = reader.GetString(9);
                }
                else
                {
                    kq.NXB = "Chưa có thông tin";
                }

                ltk.Add(kq);
            }
            reader.Close();
            return ltk;
        }
        public List<Sach> TimKiemSachChiTiet(DauSach temp)
        {
            List<Sach> ltk = new List<Sach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.TimKiemNangCao(@tendausach,@tacgia,@theloai,@ngonngu,@nxb)";
            command.Connection = conn;
            command.Parameters.Add("@tendausach", SqlDbType.NVarChar).Value = temp.TenDauSach;
            command.Parameters.Add("@tacgia", SqlDbType.NVarChar).Value = temp.TacGia;
            command.Parameters.Add("@theloai", SqlDbType.NVarChar).Value = temp.TheLoai;
            command.Parameters.Add("@ngonngu", SqlDbType.NVarChar).Value = temp.NgonNgu;
            command.Parameters.Add("@nxb", SqlDbType.NVarChar).Value = temp.NhaXuatBan;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Sach kq = new Sach();
                kq.MaSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    kq.TenDauSach = reader.GetString(1);
                }
                else
                {
                    kq.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    kq.Tap = reader.GetInt32(2);
                }
                else
                {
                    kq.Tap = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    kq.LanTaiBan = reader.GetInt32(3);
                }
                else
                {
                    kq.LanTaiBan = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    kq.ViTri = reader.GetString(4);
                }
                else
                {
                    kq.ViTri = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    kq.NguoiMuon = reader.GetString(5);
                }
                else
                {
                    kq.NguoiMuon = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(6))
                {
                    kq.TacGia = reader.GetString(6);
                }
                else
                {
                    kq.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(7))
                {
                    kq.TheLoai = reader.GetString(7);
                }
                else
                {
                    kq.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(8))
                {
                    kq.NgonNgu = reader.GetString(8);
                }
                else
                {
                    kq.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(9))
                {
                    kq.NXB = reader.GetString(9);
                }
                else
                {
                    kq.NXB = "Chưa có thông tin";
                }
                ltk.Add(kq);
            }
            reader.Close();
            return ltk;
        }
        public bool XoaSach(string MaSach)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "XoaCuonSach";
            command.Connection = conn;
          
            command.Parameters.Add("@masach", SqlDbType.NChar).Value = MaSach;
           
            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public List<DauSach> HienThiGiaoDienDauSach()
        {
            List<DauSach> LS = new List<DauSach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from HienThiGiaoDienDauSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DauSach temp = new DauSach();
                temp.MaDauSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    temp.TenDauSach = reader.GetString(1);
                }
                else
                {
                    temp.TenDauSach = "Chưa có thông tin";
                }                                
                if (!reader.IsDBNull(2))
                {
                    temp.TacGia = reader.GetString(2);
                }
                else
                {
                    temp.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    temp.TheLoai = reader.GetString(3);
                }
                else
                {
                    temp.TheLoai = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    temp.NgonNgu = reader.GetString(4);
                }
                else
                {
                    temp.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    temp.NhaXuatBan = reader.GetString(5);
                }
                else
                {
                    temp.NhaXuatBan = "Chưa có thông tin";
                }
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
        public bool XoaDauSach(string MaDauSach)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "XoaDauSach";
            command.Connection = conn;

            command.Parameters.Add("@madausach", SqlDbType.NChar).Value = MaDauSach;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public List<DauSach> ThongKeDauSach()
        {
            List<DauSach> LS = new List<DauSach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from ThongKeDauSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DauSach temp = new DauSach();
                temp.MaDauSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    temp.TenDauSach = reader.GetString(1);
                }
                else
                {
                    temp.TenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    temp.TacGia = reader.GetString(2);
                }
                else
                {
                    temp.TacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    temp.NgonNgu = reader.GetString(3);
                }
                else
                {
                    temp.NgonNgu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    temp.TheLoai = reader.GetString(4);
                }
                else
                {
                    temp.TheLoai = "Chưa có thông tin";
                }
                
                if (!reader.IsDBNull(5))
                {
                    temp.NhaXuatBan = reader.GetString(5);
                }
                else
                {
                    temp.NhaXuatBan = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(6))
                {
                    temp.SoCuon = reader.GetInt32(6);
                }
                else
                {
                    temp.SoCuon = 0;
                }

                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
        public List<ThongTinSach> ThongKeCuonSach()
        {
            List<ThongTinSach> LS = new List<ThongTinSach>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from ThongKeCuonSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                ThongTinSach temp = new ThongTinSach();
                temp.TenDauSach = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    temp.Tap = reader.GetInt32(1);
                }
                else
                {
                    temp.Tap = 0;
                }
                if (!reader.IsDBNull(2))
                {
                    temp.LanTaiBan = reader.GetInt32(2);
                }
                else
                {
                    temp.LanTaiBan = 0;
                }
                if (!reader.IsDBNull(3))
                {
                    temp.SoTrang = reader.GetInt32(3);
                }
                else
                {
                    temp.SoTrang = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    temp.SoCuon = reader.GetInt32(4);
                }
                else
                {
                    temp.SoCuon = 0;
                }
                
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
        public List<TheLoai> ThongKeTheLoai()
        {
            List<TheLoai> LS = new List<TheLoai>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from ThongKeTheLoai";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TheLoai temp = new TheLoai();
                temp.TenTG = reader.GetString(0);
                if (!reader.IsDBNull(1))
                {
                    temp.SoDauSach = reader.GetInt32(1);
                }
                else
                {
                    temp.SoDauSach = 0;
                }
                if (!reader.IsDBNull(2))
                {
                    temp.SoCuonSach = reader.GetInt32(2);
                }
                else
                {
                    temp.SoCuonSach = 0;
                }                
                LS.Add(temp);
            }
            reader.Close();
            return LS;
        }
    }
}
