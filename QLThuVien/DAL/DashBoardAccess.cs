using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.DashBoard;
namespace DAL
{
    public  class DashBoardAccess : DatabaseAccess
    {
        public int SoLuongSach()
        {
            DashBoard db = new DashBoard();
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SoLuongSach";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            db.soluongsach = reader.GetInt32(0);
            return db.soluongsach;
        }
        public int SoLuongDocGia()
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "";
            command.Connection = conn;
            return 1;
        }
        public int SoLuongNhanVien()
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "";
            command.Connection = conn;
            return 1;
        }
        public int SoLuongMuon()
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "";
            command.Connection = conn;
            return 1;
        }
        public int SoLuongTra()
        {
            OpenConnection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "";
            command.Connection = conn;
            return 1;
        }
    }
}
