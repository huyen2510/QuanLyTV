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
    public partial class SuaNhanVien : Form
    {
        public int MaNV;
        NhanVienBLL NVBLL = new NhanVienBLL(); 
        public SuaNhanVien()
        {
            InitializeComponent();
        }

        private void SuaNhanVien_Load(object sender, EventArgs e)
        {
            ThemNhanVien temp = NVBLL.LayThongTinNhanVien(MaNV);
            lbMaNV.Text = temp.MaNhanVien.ToString();
            txbHoTen.Text = temp.HoTen;
            pickDateTimeNV.Text = temp.NgaySinh.ToString(); 
            txbSDT.Text = temp.SDT.ToString();
            txbEmail.Text = temp.Email.ToString();
            txbMaCV.Text = temp.MaChucVu.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ThemNhanVien nv = new ThemNhanVien();
            nv.MaNhanVien = Int32.Parse(lbMaNV.Text);
            nv.HoTen = txbHoTen.Text;
            nv.NgaySinh = DateTime.Parse(pickDateTimeNV.Text);
            nv.SDT = Int32.Parse(txbSDT.Text);
            nv.Email = txbEmail.Text;
            nv.MaChucVu = Int32.Parse(txbMaCV.Text);
            if(NVBLL.SuaNhanVien(nv))
            {
                MessageBox.Show("Sửa thành công");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
