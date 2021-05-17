using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO.MuonTra;
using BLL;

namespace QuanLyThuVien.Form_MuonTra
{
    public partial class Form_MuonSach : Form
    {
        MuonTraBLL MTBLL = new MuonTraBLL();
        public Form_MuonSach()
        {
            InitializeComponent();
        }

        private void Form_MuonSach_Load(object sender, EventArgs e)
        {
            lbNgayHienTai.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
        string ChuyenDoiNgayThang(string s)
        {
            try
            {
                string[] temp = s.Split('/');
                return temp[1] + '/' + temp[0] + '/' + temp[2];
            }
            catch
            {
                return "";
            }

        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (txbMaSach.Text.Length == 0)
            {
                MessageBox.Show("Mã sách không được trống");
                return;
            }
            MuonSach temp = new MuonSach();
            temp.MaSach = txbMaSach.Text;
            temp.MaDG = txbMaNguoiMuon.Text;
            temp.MaNV = Int32.Parse(lbMaNV.Text);
            temp.NgayHanTra = DateTime.Parse(dateTimePicker1.Text);
            if (MTBLL.ChoMuonSach(temp))
            {
                MessageBox.Show("Mượn sách thành công!");
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Mượn sách thất bại");
            }

        }
    }
}
