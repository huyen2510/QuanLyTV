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
    public partial class ThongKe : Form
    {
        SachBLL SBLL = new SachBLL();
        public ThongKe()
        {
            InitializeComponent();
        }

        private void thốngKêTácGiảToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
        void ThongKeDauSach()
        {
            List<DauSach> LS = new List<DauSach>();
            LS = SBLL.ThongKeDauSach();
            lvTKDauSach.Items.Clear();
            foreach (DauSach s in LS)
            {
                ListViewItem lvi = new ListViewItem(s.MaDauSach);
                lvi.SubItems.Add(s.TenDauSach);                
                lvi.SubItems.Add(s.TacGia);
                lvi.SubItems.Add(s.TheLoai);
                lvi.SubItems.Add(s.NgonNgu);
                lvi.SubItems.Add(s.NhaXuatBan);
                lvi.SubItems.Add(s.SoCuon+"");
                lvTKDauSach.Items.Add(lvi);
                lvi.Tag = s;
            }
        }
        void ThongKeCuonSach()
        {
            List<ThongTinSach> LS = new List<ThongTinSach>();
            LS = SBLL.ThongKeCuonSach();
            lvTKCuonSach.Items.Clear();
            int stt = 1;
            foreach (ThongTinSach s in LS)
            {
                ListViewItem lvi = new ListViewItem(stt+"");
                lvi.SubItems.Add(s.TenDauSach);
                lvi.SubItems.Add(s.Tap+"");
                lvi.SubItems.Add(s.LanTaiBan+"");
                lvi.SubItems.Add(s.SoTrang+"");
                lvi.SubItems.Add(s.SoCuon +"");
                lvTKCuonSach.Items.Add(lvi);
                lvi.Tag = s;
                stt++;
            }
        }
        void ThongKeTheLoai()
        {
            List<TheLoai> LS = new List<TheLoai>();
            LS = SBLL.ThongKeTheLoai();
            lvTheLoai.Items.Clear();
            int stt = 1;
            foreach (TheLoai s in LS)
            {
                ListViewItem lvi = new ListViewItem(stt + "");
                lvi.SubItems.Add(s.TenTG);
                lvi.SubItems.Add(s.SoDauSach + "");
                lvi.SubItems.Add(s.SoCuonSach + "");
                lvTheLoai.Items.Add(lvi);
                lvi.Tag = s;
                stt++;
            }
        }
        private void ThongKe_Load(object sender, EventArgs e)
        {
            ThongKeDauSach();
            ThongKeCuonSach();
            ThongKeTheLoai();
        }
    }
}
