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
    public partial class SuaDauSach : Form
    {
        public string MaDauSach;
        public bool SuaThanhCong = false;
        SachBLL SBLL = new SachBLL();
        public SuaDauSach()
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

        private void SuaDauSach_Load(object sender, EventArgs e)
        {          
            DauSach temp = SBLL.LayThongTinDauSach(MaDauSach);
            lbMaDauSach.Text = temp.MaDauSach;
            txbTenDauSach.Text = temp.TenDauSach;
            txbTacGia.Text = temp.TacGia;
            txbTheLoai.Text = temp.TheLoai;
            txbNgonNgu.Text = temp.NgonNgu;
            txbNhaXuatBan.Text = temp.NhaXuatBan;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DauSach temp = new DauSach();
            temp.MaDauSach = MaDauSach;
            temp.TacGia = txbTacGia.Text;
            temp.NhaXuatBan = txbNhaXuatBan.Text;
            temp.NgonNgu = txbNgonNgu.Text;
            temp.TheLoai = txbTheLoai.Text;
            temp.TenDauSach = txbTenDauSach.Text;

            if (SBLL.SuaDauSach(temp))
            {
                MessageBox.Show("Sửa thông tin đầu sách thành công");
                SuaThanhCong = true;
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Sửa thông tin đầu sách thất bại");
            }
        }
    }
}
