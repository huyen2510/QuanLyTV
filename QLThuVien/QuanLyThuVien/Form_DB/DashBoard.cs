using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using DAL;
namespace QuanLyThuVien.Form_DB
{
    public partial class DashBoard : UserControl
    {
        public DashBoard()
        {
            InitializeComponent();
        }
        
        DatabaseAccess a = new DatabaseAccess();
        void HienThi()
        {
            a.OpenConnection();
            SqlDataAdapter sda1 = new SqlDataAdapter("select count(*) from Sach", a.strConn);
            DataTable dt = new DataTable();
            sda1.Fill(dt);
            DashBoardBLL dashBoardBLL = new DashBoardBLL();
            SachLbl.Text = dt.Rows[0][0].ToString();
            SqlDataAdapter sda2 = new SqlDataAdapter("select count(*) from DocGia", a.strConn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            DocGiaLbl.Text = dt2.Rows[0][0].ToString();
            SqlDataAdapter sda3 = new SqlDataAdapter("select count(*) from NhanVien", a.strConn);
            DataTable dt3 = new DataTable();
            sda3.Fill(dt3);
            NhanVienLbl.Text = dt3.Rows[0][0].ToString();
            SqlDataAdapter sda4 = new SqlDataAdapter("select count(*) from ChiTiet_MuonTra WHERE DaTra != 1", a.strConn);
            DataTable dt4 = new DataTable();
            sda4.Fill(dt4);
            MuonSachLbl.Text = dt4.Rows[0][0].ToString();
            SqlDataAdapter sda5 = new SqlDataAdapter("select count(*) from ChiTiet_MuonTra WHERE DaTra = 1", a.strConn);
            DataTable dt5 = new DataTable();
            sda5.Fill(dt5);
            TraSachLbl.Text = dt5.Rows[0][0].ToString();
            a.CloseConnection();
        }
        private void DashBoard_Load(object sender, EventArgs e)
        {
            HienThi();
        }
        
    }
}
