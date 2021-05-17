using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.NhanVien;

namespace DAL
{
    public class NhanVienAccess : DatabaseAccess
    {
        public List<NhanVien> HienThiGiaoDienNhanVien()
        {
            List<NhanVien> ListNhanVien = new List<NhanVien>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.HienThiGiaoDienNhanVien";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                NhanVien nv = new NhanVien();
                nv.MaNhanVien = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    nv.HoTen = reader.GetString(1);
                }
                else
                {
                    nv.HoTen = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    nv.NgaySinh = reader.GetDateTime(2);
                }
                else
                {
                    nv.NgaySinh = DateTime.Now;
                }
                if (!reader.IsDBNull(3))
                {
                    nv.SDT = reader.GetInt32(3);
                }
                else
                {
                    nv.SDT = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    nv.Email = reader.GetString(4);
                }
                else
                {
                    nv.Email = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(5))
                {
                    nv.MaChucVu = reader.GetInt32(5);
                }
                ListNhanVien.Add(nv);
            }
            reader.Close();
            return ListNhanVien;
        }
        public List<ChucVu> LayChucVu()
        {
            List<ChucVu> ListChucVu = new List<ChucVu>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ChucVu";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                ChucVu cv = new ChucVu();
                cv.MaChucVu = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    cv.TenChucVu = reader.GetString(1);
                }
                else
                {
                    cv.TenChucVu = "Chưa có thông tin";
                }
                ListChucVu.Add(cv);
            }
            reader.Close();
            return ListChucVu;
        }
        public List<TaiKhoan> LayTaiKhoan()
        {
            List<TaiKhoan> ListTaiKhoan = new List<TaiKhoan>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.TaiKhoan";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TaiKhoan tk = new TaiKhoan();
                if (!reader.IsDBNull(0))
                {
                    tk.TenDangNhap = reader.GetString(0);
                }
                else
                {
                    tk.TenDangNhap = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(1))
                {
                    tk.MatKhau = reader.GetString(1);
                }
                else
                {
                    tk.MatKhau = "Chưa có thông tin";
                }
                ListTaiKhoan.Add(tk);
            }
            reader.Close();
            return ListTaiKhoan;
        }
        public ThemNhanVien LayThongTinNhanVien(int MaNV)
        {
            ThemNhanVien nv = new ThemNhanVien();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM dbo.LayThongTiNhanVien(@maNhanVien)";
            command.Connection = conn;
            command.Parameters.Add("@maNhanVien", SqlDbType.Int).Value = MaNV;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                
                nv.MaNhanVien = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    nv.HoTen = reader.GetString(1);
                }
                else
                {
                    nv.HoTen = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    nv.NgaySinh = reader.GetDateTime(2);
                }
                else
                {
                    nv.NgaySinh = DateTime.Now;
                }
                if (!reader.IsDBNull(3))
                {
                    nv.SDT = reader.GetInt32(3);
                }
                else
                {
                    nv.SDT = 0;
                }
                if (!reader.IsDBNull(4))
                {
                    nv.Email = reader.GetString(4);
                }
                else
                {
                    nv.Email = "Chưa có thông tin";
                }
                 if (!reader.IsDBNull(5))
                 {
                     nv.MaChucVu = reader.GetInt32(5);
                 }

                
            }
            reader.Close();
            return nv;
        }
        public List<ThongKeTheoChucVu> LayDanhSach()
        {
            List<ThongKeTheoChucVu> LvThongKeCV = new List<ThongKeTheoChucVu>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ThongKeNhanVienTheoChucVu()";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                ThongKeTheoChucVu tkcv = new ThongKeTheoChucVu();
                tkcv.MaChucVu = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    tkcv.TenChucVu = reader.GetString(1);
                }
                else
                {
                    tkcv.TenChucVu = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    tkcv.SoLuong = reader.GetInt32(2);
                }
                else
                {
                    tkcv.SoLuong = 0;
                }
                LvThongKeCV.Add(tkcv);
            }
            reader.Close();
            return LvThongKeCV;
        }
        public List<ThongKeHoatDongNhanVien> LaySoCuonSach()
        {
            List<ThongKeHoatDongNhanVien> LvThongKeNV = new List<ThongKeHoatDongNhanVien>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "select * from dbo.ThongKeHoatDongNhanVien";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                ThongKeHoatDongNhanVien tks = new ThongKeHoatDongNhanVien();
                tks.MaNhanVien = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    tks.HoTen = reader.GetString(1);
                }
                else
                {
                    tks.HoTen = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    tks.SoCuonSach = reader.GetInt32(2);
                }
                else
                {
                    tks.SoCuonSach = 0;
                }
                LvThongKeNV.Add(tks);
            }
            reader.Close();
            return LvThongKeNV;
        }
        public bool ThemNhanVien (ThemNhanVien nv)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "InsertDL";
            command.Connection = conn;

            command.Parameters.Add("@MaNhanVien", SqlDbType.Int).Value = nv.MaNhanVien;
            command.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = nv.HoTen;
            command.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = nv.NgaySinh;
            command.Parameters.Add("@SDT", SqlDbType.Int).Value = nv.SDT;
            command.Parameters.Add("@Email", SqlDbType.NChar).Value = nv.Email;
            command.Parameters.Add("@MaChucVu", SqlDbType.Int).Value = nv.MaChucVu;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public bool XoaNhanVien(int MaNhanVien)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "DeleteDL";
            command.Connection = conn;

            command.Parameters.Add("@MaNhanVien", SqlDbType.Int).Value = MaNhanVien;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }

        public bool SuaNhanVien (ThemNhanVien nv)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "UpdateDL";
            command.Connection = conn;

            command.Parameters.Add("@MaNhanVien", SqlDbType.Int).Value = nv.MaNhanVien;
            command.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = nv.HoTen;
            command.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = nv.NgaySinh;
            command.Parameters.Add("@SDT", SqlDbType.Int).Value = nv.SDT;
            command.Parameters.Add("@email", SqlDbType.NChar).Value = nv.Email;
            command.Parameters.Add("@MaChucVu", SqlDbType.Int).Value = nv.MaChucVu;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
    }
}

