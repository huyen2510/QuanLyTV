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
using DTO.MuonTra;
namespace QuanLyThuVien.Form_MuonTra
{
    public partial class Form_ChiTietMuonTra : Form
    {
        public int MaMuonTra;
        MuonTraBLL MTBLL = new MuonTraBLL();
        public Form_ChiTietMuonTra()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
        void LoadThongTin()
        {
            ChiTietMuonTra temp = MTBLL.LayThongTinChiTiet(MaMuonTra);
            lbMaMuonTra.Text = temp.MaMuonTra+"";
            lbNgayMuon.Text = temp.NgayMuon.ToString("dd/MM/yyyy");
            txbHanMuon.Text = temp.HanMuon.ToString("dd/MM/yyyy");
            lbTinhTrang.Text = temp.TinhTrang;
            if(temp.NgayQuaHan < 0)
            {
                lbNgayQuaHan.Text = "Chưa quá hạn";
            }
            else
            {
                lbNgayQuaHan.Text = temp.NgayQuaHan + " ngày";
            }
           
            lbMaNV.Text = temp.MaNV+"";
            lbMaDG.Text = temp.MaDocGia + "";
            lbTenDG.Text = temp.TenDocGia;
            lbDonVi.Text = temp.DonVi;
            lbSoCuon.Text = temp.SoCuonDangMuon + "";
            txbMaSach.Text = temp.MaSach;
            lbTenSach.Text = temp.TenSach;
            lbTap.Text = temp.Tap + "";
            lbLanTB.Text = temp.LanTB + "";
            
        }
        private void Form_ChiTietMuonTra_Load(object sender, EventArgs e)
        {
            LoadThongTin();
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
            DateTime ngaytra = new DateTime();
            if (DateTime.TryParse(ChuyenDoiNgayThang(txbHanMuon.Text), out ngaytra))
            {
                int MaMT = Int32.Parse(lbMaMuonTra.Text);
                if (MTBLL.SuaThongTinMuonTra(MaMT,ngaytra, txbMaSach.Text))
                {
                    MessageBox.Show("Sửa thông tin thành công");
                    LoadThongTin();
                }
                else
                {
                    MessageBox.Show("Sửa thông tin thất bại");
                }
            }
            
            
        }
    }
}
