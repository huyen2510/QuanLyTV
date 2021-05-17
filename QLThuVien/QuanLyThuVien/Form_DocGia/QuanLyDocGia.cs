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
using DTO.DocGia;

namespace QuanLyThuVien.Form_DocGia
{
    public partial class QuanLyDocGia : UserControl
    {
        private DocGiaBLL docGiaBLL;
        public QuanLyDocGia()
        {
            InitializeComponent();
            docGiaBLL = new DocGiaBLL();
            HienThiDocGia(null);


        }
        private void QuanLyDocGiaLoad(object sender, EventArgs e)
        {
            HienThiDocGia(null);
        }
        private void btnThemDocGia_Click(object sender, EventArgs e)
        {

        }
        private void HienThiDocGia(string text)
        {
           
            List<DocGia> listDocGia = new List<DocGia>();
            if (text == null)
            {
                listDocGia = docGiaBLL.LayToanBoDocGia();
            } else
            {
                listDocGia = docGiaBLL.TimKiemDocGia(text);
                if (listDocGia.Count == 0)
                {
                    MessageBox.Show("Không có độc giả cần tìm");
                }
            }
           
            listViewDocGia.Items.Clear();
            foreach (DocGia docGia in listDocGia)
            {
                ListViewItem listViewItem = new ListViewItem(docGia.maDocGia + "");
                listViewItem.SubItems.Add(docGia.tenDocGia);
                listViewItem.SubItems.Add(docGia.ngaySinh + "");
                listViewItem.SubItems.Add(docGia.donVi);
                listViewItem.SubItems.Add(docGia.sdt +"");
                listViewItem.SubItems.Add(docGia.queQuan);

                listViewDocGia.Items.Add(listViewItem);
                listViewItem.Tag = docGia;
            }
        }

        private void onClickThemDocgia(object sender, EventArgs e)
        {
            ThemDocGIa themDocGIa = new ThemDocGIa();
            themDocGIa.Show();
        }

        private void onClickTimKiemDocGIa(object sender, EventArgs e)
        {
            timKiemDocGia(txtboxTkDocGia.Text);
        }
        private void timKiemDocGia(string textTimkiem)
        {
            if (textTimkiem.Length != 0)
            {
                HienThiDocGia(textTimkiem);
            } else
            {
                HienThiDocGia(null);
            }
           
        }
        private void txtBoxTimKiemKeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                timKiemDocGia(txtboxTkDocGia.Text);
            }
        }

        private void clickItemThongTinChiTietDocGia(object sender, EventArgs e)
        {
            if (listViewDocGia.SelectedItems.Count > 0)
            {
                ListViewItem lvi = listViewDocGia.SelectedItems[0];
                DocGia docGia = lvi.Tag as DocGia;
                ThongTinChiTietDocGiacs temp = new ThongTinChiTietDocGiacs(docGia.maDocGia);
                temp.Show();

            }
            else
            {
                MessageBox.Show("Bạn phải chọn 1 độc giả");
            }
        }

        private void xoaDocGia(object sender, EventArgs e)
        {
            if (listViewDocGia.SelectedItems.Count > 0)
            {
                ListViewItem lvi = listViewDocGia.SelectedItems[0];
                DocGia docGia = lvi.Tag as DocGia;
                if (docGiaBLL.HienThiListSachDangMuon(docGia.maDocGia).Count != 0) {
                    MessageBox.Show("Độc giả này đang mượn sách nên không xóa được");
                } else
                {
                    // Huynh xoa doc gia
                   if (docGiaBLL.XoaDocGia(docGia) == 0)
                   {
                        MessageBox.Show("Độc Giả không tồn tại");
                   }
                   else
                    {
                        MessageBox.Show("Xóa độc giả thành công");
                    }
                }

            }
            else
            {
                MessageBox.Show("Bạn phải chọn 1 độc giả");
            }
          
        }

        private void lamMoi(object sender, EventArgs e)
        {
            HienThiDocGia(null);
        }

        
    }
}
