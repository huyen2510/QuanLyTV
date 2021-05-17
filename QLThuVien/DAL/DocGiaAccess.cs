using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.DocGia;

namespace DAL
{
    public class DocGiaAccess : DatabaseAccess
    {
        public List<DocGia> HienThiGiaoDienDocGia()
        {
            List<DocGia> listDocGia = new List<DocGia>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM dbo.hienthitoanbodocgia";
            command.Connection = conn;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DocGia docGia = new DocGia();
                docGia.maDocGia = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    docGia.tenDocGia = reader.GetString(1);
                }
                else
                {
                    docGia.tenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    docGia.donVi = reader.GetString(2);
                }
                else
                {
                    docGia.donVi = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    docGia.ngaySinh = reader.GetDateTime(3);
                }
                else
                {
                    docGia.ngaySinh = DateTime.Now;
                }
                if (!reader.IsDBNull(4))
                {
                    docGia.sdt = reader.GetInt32(4);
                }
                else
                {
                    docGia.sdt = 0;
                }
                if (!reader.IsDBNull(5))
                {
                    docGia.queQuan = reader.GetString(5);
                }
                else
                {
                    docGia.queQuan = "Chưa có thông tin";
                }
                listDocGia.Add(docGia);
            }
            reader.Close();
            return listDocGia;
        }
        public List<DocGia> TimKiemDocGia(string textSearch)
        {
            List<DocGia> listDocGia = new List<DocGia>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM dbo.timKiemDocGia(@textSearch)";
            command.Connection = conn;
            command.Parameters.Add("@textSearch", SqlDbType.NVarChar).Value = textSearch;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DocGia docGia = new DocGia();
                docGia.maDocGia = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    docGia.tenDocGia = reader.GetString(1);
                }
                else
                {
                    docGia.tenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    docGia.donVi = reader.GetString(2);
                }
                else
                {
                    docGia.donVi = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    docGia.ngaySinh = reader.GetDateTime(3);
                }
                else
                {
                    docGia.ngaySinh = DateTime.Now;
                }
                if (!reader.IsDBNull(4))
                {
                    docGia.sdt = reader.GetInt32(4);
                }
                else
                {
                    docGia.sdt = 0;
                }
                if (!reader.IsDBNull(5))
                {
                    docGia.queQuan = reader.GetString(5);
                }
                else
                {
                    docGia.queQuan = "Chưa có thông tin";
                }
                listDocGia.Add(docGia);
            }

            reader.Close();
            return listDocGia;
        }

        public DocGia ThongTinChiTietDocGia(int maDocGia)
        {

            DocGia docGia = new DocGia();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM dbo.timKiemDocGia(@maDocGia)";
            command.Connection = conn;
            command.Parameters.Add("@maDocGia", SqlDbType.NVarChar).Value = maDocGia.ToString();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                docGia.maDocGia = reader.GetInt32(0);
                if (!reader.IsDBNull(1))
                {
                    docGia.tenDocGia = reader.GetString(1);
                }
                else
                {
                    docGia.tenDocGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    docGia.donVi = reader.GetString(2);
                }
                else
                {
                    docGia.donVi = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    docGia.ngaySinh = reader.GetDateTime(3);
                }
                else
                {
                    docGia.ngaySinh = DateTime.Now;
                }
                if (!reader.IsDBNull(4))
                {
                    docGia.sdt = reader.GetInt32(4);
                }
                else
                {
                    docGia.sdt = 0;
                }
                if (!reader.IsDBNull(5))
                {
                    docGia.queQuan = reader.GetString(5);
                }
                else
                {
                    docGia.queQuan = "Chưa có thông tin";
                }

               
            }
            reader.Close();
            return docGia;

        }
        public List<SachDangMuon> HienThiListSachDangMuon(int maDocGia)
        {
            List<SachDangMuon> sachDangMuons = new List<SachDangMuon>();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM dbo.hienthisachdangmuon(@maDocGia)";
            command.Connection = conn;
            command.Parameters.Add("@maDocGia", SqlDbType.Int).Value = maDocGia;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                SachDangMuon sachDangMuon = new SachDangMuon();
                if (!reader.IsDBNull(0))
                {
                    sachDangMuon.maMuonTra = Int32.Parse(reader.GetString(0));
                }
                else
                {
                    Console.WriteLine("null ma muon tra ");
                }

                if (!reader.IsDBNull(1))
                {
                    sachDangMuon.maSach = reader.GetString(1);
                }
                else
                {
                    sachDangMuon.maSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(2))
                {
                    sachDangMuon.tenDauSach = reader.GetString(2);
                }
                else
                {
                    sachDangMuon.tenDauSach = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(3))
                {
                    sachDangMuon.tenTacGia = reader.GetString(3);
                }
                else
                {
                    sachDangMuon.tenTacGia = "Chưa có thông tin";
                }
                if (!reader.IsDBNull(4))
                {
                    sachDangMuon.ngayMuon = reader.GetDateTime(4);
                }
                else
                {
                    sachDangMuon.ngayMuon = DateTime.Now;
                }
                if (!reader.IsDBNull(5))
                {
                    sachDangMuon.tenNhanVien = reader.GetString(5);
                }
                else
                {
                    sachDangMuon.tenNhanVien = "Chưa có thông tin";
                }

                sachDangMuons.Add(sachDangMuon);
            }

            reader.Close();
            return sachDangMuons;
        }
        public int TraSach (int maMuonTra)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC trasach @maMuonTra , @ngayTra";
            command.Connection = conn;
            command.Parameters.Add("@maMuonTra", SqlDbType.NChar).Value = maMuonTra;
            command.Parameters.Add("@ngayTra", SqlDbType.Date).Value = DateTime.Now;

            int kq = command.ExecuteNonQuery();

            return kq ;
        }
        // sua thong tin doc gia
        public bool SuaThongTinDocGia(DocGia suaDocGia)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC suadocgia @maDocGia, @tenDocGia, " +
                "       @donVi, @ngaySinh, @sdt, @queQuan";
            command.Connection = conn;
            command.Parameters.Add("@maDocGia", SqlDbType.Int).Value = suaDocGia.maDocGia;
            command.Parameters.Add("@tenDocGia", SqlDbType.NVarChar).Value = suaDocGia.tenDocGia;
            command.Parameters.Add("@donVi", SqlDbType.NVarChar).Value = suaDocGia.donVi;
            command.Parameters.Add("@sdt", SqlDbType.Int).Value = suaDocGia.sdt;
            command.Parameters.Add("@queQuan", SqlDbType.NVarChar).Value = suaDocGia.queQuan;
            command.Parameters.Add("@ngaySinh", SqlDbType.Date).Value = suaDocGia.ngaySinh;

            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        public int XoaDocGia(DocGia docGia)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC xoadocgia @maDocGia";
            command.Connection = conn;
            command.Parameters.Add("@maDocGia", SqlDbType.Int).Value = docGia.maDocGia;

            return command.ExecuteNonQuery();
           
        }
        public bool ThemDocGia(DocGia docGia)
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC themDocGia @maDocGia, @tenDocGia, @donVi, @ngaySinh, @sdt, @queQuan";
            command.Connection = conn;
            command.Parameters.Add("@maDocGia", SqlDbType.Int).Value = docGia.maDocGia;
            command.Parameters.Add("@tenDocGia", SqlDbType.NVarChar).Value = docGia.tenDocGia;
            command.Parameters.Add("@donVi", SqlDbType.NVarChar).Value = docGia.donVi;
            command.Parameters.Add("@ngaySinh", SqlDbType.Date).Value = docGia.ngaySinh;
            command.Parameters.Add("@sdt", SqlDbType.Int).Value = docGia.sdt;
            command.Parameters.Add("@queQuan", SqlDbType.NVarChar).Value = docGia.queQuan;
            int kq = command.ExecuteNonQuery();
            return kq > 0;
        }
        
    }
}
