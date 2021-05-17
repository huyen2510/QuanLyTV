using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using DTO.NhanVien;

namespace QuanLyThuVien.Form_NhanVien
{
    public partial class ThongKeNV : Form
    {
        NhanVienBLL NVBLL = new NhanVienBLL();
        public ThongKeNV()
        {
            InitializeComponent();
        }

        private void ThongKeNV_Load(object sender, EventArgs e)
        {
            LayDanhSach();
            LaySoCuonSach();


        }
        void LayDanhSach()
        {
            List<ThongKeTheoChucVu> TKE = new List<ThongKeTheoChucVu>();
            TKE = NVBLL.LayDanhSach();
            ListViewThongKe1.Items.Clear();
            foreach (ThongKeTheoChucVu tke in TKE)
            {
                ListViewItem lvi = new ListViewItem(tke.MaChucVu + "");
                lvi.SubItems.Add(tke.TenChucVu);
                lvi.SubItems.Add(tke.SoLuong + "");
                ListViewThongKe1.Items.Add(lvi);
                lvi.Tag = tke;
            }
        }
        void LaySoCuonSach()
        {
            List<ThongKeHoatDongNhanVien> TKHD = new List<ThongKeHoatDongNhanVien>();
            TKHD = NVBLL.LaySoCuonSach();
            ListViewThongKe2.Items.Clear();
            foreach (ThongKeHoatDongNhanVien tkhd in TKHD)
            {
                ListViewItem lvi = new ListViewItem(tkhd.MaNhanVien + "");
                lvi.SubItems.Add(tkhd.HoTen);
                lvi.SubItems.Add(tkhd.SoCuonSach + "");
                ListViewThongKe2.Items.Add(lvi);
                lvi.Tag = tkhd;
            }
        }
    }
}
