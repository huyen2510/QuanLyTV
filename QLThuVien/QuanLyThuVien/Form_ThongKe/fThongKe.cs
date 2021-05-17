using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;
using System.Data.SqlClient;
using System.Data.Common;
using DTO.TheLoai;
using MetroFramework.Controls;
using BLL;

namespace QuanLyThuVien.Form_ThongKe
{
    public partial class fThongKe : UserControl
    {
        TheLoaiAccess tla = new TheLoaiAccess();
        ThongKeBLL thongKeBLL = new ThongKeBLL();
        public fThongKe()
        {
            InitializeComponent();
            DauSachMuonNhieu();
            LoadListTheLoai();
            SachConLai();
            TheLoaiYeuThich();
        }
        public void LoadListTheLoai()
        {
            List<TheLoai> list = tla.LayDanhSachTheLoai().ToList();
            foreach (var item in list)
            {
                LinkLabel linkLabel = new LinkLabel() { Text = item.TenTheLoai };
                linkLabel.Click += linkLabel_Click;
                            }
        }
        private void linkLabel_Click(object sender, EventArgs e)
        {
            LinkLabel x = (LinkLabel)sender;
            String tenTheLoai = x.Text;
            var list = new DauSachAccess().DanhSachDauSachTheoTheLoai(tenTheLoai);
            int i = 1;
            foreach(var item in list)
            {
                ListViewItem lvi = new ListViewItem(i+"");
                lvi.SubItems.Add(item.TenDauSach);
                lvi.SubItems.Add(item.Tap+"");
                lvi.SubItems.Add(item.TenTacGia);
                lvi.SubItems.Add(item.SoLuong+"");
                i++;
            }
        }

        public void DauSachMuonNhieu()
        {
            var list = thongKeBLL.DauSachMuonNhieu().ToList();
            lvDauSachMuonNhieu.Items.Clear();
            int i = 1;
            foreach (var item in list)
            {
                ListViewItem lvi = new ListViewItem(i + "");
                lvi.SubItems.Add(item.TenDauSach);
                lvi.SubItems.Add(item.Tap + "");
                lvi.SubItems.Add(item.SoLuotMuon+"");
                lvDauSachMuonNhieu.Items.Add(lvi);
                i++;
            }
        }
        public void SachConLai()
        {
            var list = thongKeBLL.SachConLai().ToList();
            lvSachConLai.Items.Clear();
            int i = 1;
            foreach (var item in list)
            {
                ListViewItem lvi = new ListViewItem(i + "");
                lvi.SubItems.Add(item.TenDauSach);
                lvi.SubItems.Add(item.Tap + "");
                lvi.SubItems.Add(item.SoLuotMuon + "");
                lvSachConLai.Items.Add(lvi);
                i++;
            }
        }
        public void TheLoaiYeuThich()
        {
            var list = new ThongKeAccess().TheLoaiYeuThich().ToList();
            int i = 1;
            foreach (var item in list)
            {
                ListViewItem lvi = new ListViewItem(i + "");
                lvi.SubItems.Add(item.TenTheLoai);
                lvi.SubItems.Add(item.SoLuot + "");
                i++;
            }
        }
    }
}