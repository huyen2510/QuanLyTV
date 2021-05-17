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
    public partial class QuanLy_NhanVien : UserControl
    {

        NhanVienBLL NVBLL = new NhanVienBLL();
        public QuanLy_NhanVien()
        {
            InitializeComponent();
        }
        
        public void HienThiNhanVien()
        {
            List<NhanVien> listnv = new List<NhanVien>();
            listnv = NVBLL.LayThongTinChiTiet();
            ListViewNhanVien.Items.Clear();
            foreach (NhanVien nv in listnv)
            {
                ListViewItem listViewItem = new ListViewItem(nv.MaNhanVien + "");
                listViewItem.SubItems.Add(nv.HoTen);
                listViewItem.SubItems.Add(nv.NgaySinh + "");
                listViewItem.SubItems.Add(nv.SDT + "");
                listViewItem.SubItems.Add(nv.Email + "");
                //listViewItem.SubItems.Add(nv.MaChucVu + "");
                
                ListViewNhanVien.Items.Add(listViewItem);
                listViewItem.Tag = nv;
            }
            }
        private void btnThemNhanVien_Click(object sender, EventArgs e)
        {
            using (FormThemNV ThemNhanVien = new FormThemNV())
            {
                ThemNhanVien.ShowDialog();
            }
        }

        private void btnThongKeNV_Click(object sender, EventArgs e)
        {
            ThongKeNV thongkenv = new ThongKeNV();
            thongkenv.Show();

         }

        private void QuanLy_NhanVien_Load(object sender, EventArgs e)
        {
            HienThiNhanVien();
        }

        private void sửaNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (ListViewNhanVien.SelectedItems.Count > 0)
            {
                ListViewItem lvi = ListViewNhanVien.SelectedItems[0];
                NhanVien nv = lvi.Tag as NhanVien;

                SuaNhanVien temp = new SuaNhanVien();
                temp.MaNV = nv.MaNhanVien;
                temp.Show();
            }
        }

        private void xoáNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (ListViewNhanVien.SelectedItems.Count > 0)
            {
                ListViewItem lvi = ListViewNhanVien.SelectedItems[0];
                NhanVien nv = lvi.Tag as NhanVien;
                DialogResult result = MessageBox.Show("Bạn có chắc là muốn xóa nhân viên này?", "Xác nhận lần nữa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == System.Windows.Forms.DialogResult.Yes)
                {
                    if (NVBLL.XoaNhanVien(nv.MaNhanVien))
                    {
                        MessageBox.Show("Xóa thành công");
                        HienThiNhanVien();
                    }
                    else
                    {
                        MessageBox.Show("Xóa thất bại");
                    }
                }
            }
            else
            {
                MessageBox.Show("Bạn phải chọn 1 nhân viên");
            }
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void làmMớiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            HienThiNhanVien();
        }
    }
}
