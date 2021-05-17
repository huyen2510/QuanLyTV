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
    public partial class FormThemNV : Form
    {
        public bool ThemThanhCong = false;
        NhanVienBLL NVBLL = new NhanVienBLL();
        public FormThemNV()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txbMaNhanVien.Text.Length == 0)
            {
                MessageBox.Show("Mã nhân viên không được trống");
                return;
            }
            ThemNhanVien temp = new ThemNhanVien();
            if(txbMaNhanVien.Text != "") 
                temp.MaNhanVien =Int32.Parse(txbMaNhanVien.Text);
                temp.HoTen = txbHoTen.Text;
                temp.NgaySinh = DateTime.Parse(dateTimePicker1.Text);
                temp.SDT = Int32.Parse(txbSDT.Text);
                temp.Email = txbEmail.Text;
                temp.MaChucVu = Int32.Parse(txbMaCV.Text);
            if (NVBLL.ThemNhanVien(temp))
            {
                MessageBox.Show("Thêm nhân viên thành công");
                ThemThanhCong = true;
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Thêm nhân viên thất bại");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
