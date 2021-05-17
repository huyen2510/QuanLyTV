using BLL;
using DTO.Sach;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien.Form_Sach
{
    public partial class ThemDauSach : Form
    {
        public bool ThemThanhCong = false;
        SachBLL SBLL = new SachBLL();
        public ThemDauSach()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txbMaDauSach.Text.Length == 0)
            {
                MessageBox.Show("Mã đầu sách không được trống");
                return;
            }
            AddDauSach temp = new AddDauSach();
            temp.MaDauSach = txbMaDauSach.Text;
            temp.TenDauSach = txbTenDauSach.Text;
            temp.TenTacGia = txbTacGia.Text;
            temp.NgonNgu = txbNgonNgu.Text;
            temp.TenTheLoai = txbTheLoai.Text;
            temp.NXB = txbNXB.Text;
            if (SBLL.ThemDauSach(temp))
            {
                MessageBox.Show("Thêm đầu sách thành công");
                ThemThanhCong = true;
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Thêm đầu sách thất bại");
            }
        }

        private void ThemDauSach_Load(object sender, EventArgs e)
        {

        }

    }
}
