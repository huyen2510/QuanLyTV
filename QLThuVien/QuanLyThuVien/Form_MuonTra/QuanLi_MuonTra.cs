using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO.MuonTra;
using BLL;

namespace QuanLyThuVien.Form_MuonTra
{
    public partial class QuanLi_MuonTra : UserControl
    {
        MuonTraBLL MTBLL = new MuonTraBLL();
        public QuanLi_MuonTra()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form_MuonSach temp = new Form_MuonSach();
            temp.Show();
        }

        private void thôngTinChiTiếtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (lvMuonTra.SelectedItems.Count > 0)
            {
                ListViewItem lvi = lvMuonTra.SelectedItems[0];
                GiaoDienMuonTra s = lvi.Tag as GiaoDienMuonTra;
                Form_ChiTietMuonTra temp = new Form_ChiTietMuonTra();
                temp.MaMuonTra = s.MaMuonTra;
                temp.Show();
            }                        
        }
        void HienThiGiaoDien()
        {
            List<GiaoDienMuonTra> LS = new List<GiaoDienMuonTra>();
            LS = MTBLL.HienThiGiaoDienMuonTra();
            lvMuonTra.Items.Clear();
            foreach (GiaoDienMuonTra s in LS)
            {
                ListViewItem lvi = new ListViewItem(s.MaMuonTra + "");
                lvi.SubItems.Add(s.MaSach);               
                lvi.SubItems.Add(s.MaDocGia +"");
                lvi.SubItems.Add(s.TenDocGia);                
                lvi.SubItems.Add(s.TinhTrang);
                lvMuonTra.Items.Add(lvi);
                lvi.Tag = s;
            }
        }
        void HienThiGiaoDienQuaHan()
        {
            List<DocGiaViPham> LS = new List<DocGiaViPham>();
            LS = MTBLL.HienThiListSachDangMuonQuaHan();
            listViewQuaHan.Items.Clear();
            foreach (DocGiaViPham s in LS)
            {
                ListViewItem lvi = new ListViewItem(s.maDocGia + "");
                lvi.SubItems.Add(s.tenDocGia);
                lvi.SubItems.Add(s.soNgayQuaHan + "");
                lvi.SubItems.Add(s.maSach + " ");
                listViewQuaHan.Items.Add(lvi);
                lvi.Tag = s;
            }
        }
        private void QuanLi_MuonTra_Load(object sender, EventArgs e)
        {
            HienThiGiaoDien();
            HienThiGiaoDienQuaHan();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            List<GiaoDienMuonTra> LS = new List<GiaoDienMuonTra>();
            LS = MTBLL.TimKiemMuonTra(txbTimKiem.Text);
            lvMuonTra.Items.Clear();
            foreach (GiaoDienMuonTra s in LS)
            {
                ListViewItem lvi = new ListViewItem(s.MaMuonTra + "");
                lvi.SubItems.Add(s.MaSach);
                lvi.SubItems.Add(s.MaDocGia + "");
                lvi.SubItems.Add(s.TenDocGia);
                lvi.SubItems.Add(s.TinhTrang);
                lvMuonTra.Items.Add(lvi);
                lvi.Tag = s;
            }
        }

        private void lamMoiMuonTra(object sender, EventArgs e)
        {
            HienThiGiaoDien();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form_TraSach form_TraSach = new Form_TraSach();
            form_TraSach.Show();
        }
    }
}
