using BLL;
using DTO.DocGia;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien.Form_DocGia
{
    public partial class ThongTinChiTietDocGiacs : Form
    {
        public int maDocGia { get; set; }
        private DocGiaBLL docGiaBLL;
        private DocGia docGia;
        public ThongTinChiTietDocGiacs(int mDg)
        {
            InitializeComponent();
            maDocGia = mDg;
            docGiaBLL = new DocGiaBLL();
            //khi khoi tao view thi gọi 
            LoadThongTinChiTietDocGia();
        }

        public void LoadThongTinChiTietDocGia()
        {
            docGia = docGiaBLL.ThongTinChiTietDocGia(maDocGia);
            lbMaDocGia.Text = docGia.maDocGia.ToString();
            lbHotenDocGia.Text = docGia.tenDocGia;
            lbNgaysinh.Text = docGia.ngaySinh.ToString();
            lbSdt.Text = docGia.sdt.ToString();
            lbDonVi.Text = docGia.donVi;
            lbQuequan.Text = docGia.queQuan;

            LoadSachDangMuon();
        }
        private void LoadSachDangMuon()
        {
            List<SachDangMuon> sachDangMuons = new List<SachDangMuon>();
            sachDangMuons = docGiaBLL.HienThiListSachDangMuon(maDocGia);

            listViewSachDangMuon.Items.Clear();
            foreach (SachDangMuon sachDangMuon in sachDangMuons)
            {
                ListViewItem listViewItem = new ListViewItem(sachDangMuon.maSach);
                listViewItem.SubItems.Add(sachDangMuon.tenDauSach);
                listViewItem.SubItems.Add(sachDangMuon.tenTacGia);
                listViewItem.SubItems.Add(sachDangMuon.ngayMuon + "");
                listViewItem.SubItems.Add(sachDangMuon.tenNhanVien);

                listViewSachDangMuon.Items.Add(listViewItem);
                listViewItem.Tag = sachDangMuon;
            }
        }
        private void onClickTraSach(object sender, EventArgs e)
        {
            if (listViewSachDangMuon.SelectedItems.Count > 0)
            {
                ListViewItem lvi = listViewSachDangMuon.SelectedItems[0];
                SachDangMuon sachDangMuon = lvi.Tag as SachDangMuon;
                if (docGiaBLL.TraSach(sachDangMuon.maMuonTra) == 1 )
                {
                    //Huynh load lại sach da tra 
                    LoadThongTinChiTietDocGia();
                } else
                {
                    MessageBox.Show("Trả sách thất bại");
                }
            }
            else
            {
                MessageBox.Show("Bạn phải chọn 1 độc giả");
            }

        }
        private void suaThongTInDocGia(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SuaThongTinDocGia suaThongTinDocGia = new SuaThongTinDocGia(docGia);
            suaThongTinDocGia.Show();
            Close();
        }
    }
}
