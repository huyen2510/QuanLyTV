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
    public partial class SuaThongTinDocGia : Form
    {
        public DocGia docGia { get; set; }
        private DocGiaBLL docGiaBLL;
        public SuaThongTinDocGia(DocGia docGiaSetView)
        {
            InitializeComponent();
            docGiaBLL = new DocGiaBLL();
            docGia = docGiaSetView;
            lbSuaMaDocGia.Text = docGia.maDocGia.ToString();
            txtBoxSuaTenDocGia.Text = docGia.tenDocGia;
            txtBoxDonVi.Text = docGia.donVi;
            dateTimeSuaNgaySinh.Text = docGia.ngaySinh.ToString();
            txtBoxSdt.Text = docGia.sdt.ToString();
            txtBoxQuequan.Text = docGia.queQuan;

        }

        private void huySua(object sender, EventArgs e)
        {
            Close();
        }

        private void luuThongTinDocGia(object sender, EventArgs e)
        {
            DocGia suaDocGia = new DocGia();
            suaDocGia.maDocGia = docGia.maDocGia;
            suaDocGia.tenDocGia = txtBoxSuaTenDocGia.Text;
            suaDocGia.donVi = txtBoxDonVi.Text;
            suaDocGia.ngaySinh = DateTime.Parse(dateTimeSuaNgaySinh.Text);
            suaDocGia.queQuan = txtBoxQuequan.Text;
            suaDocGia.sdt = Int32.Parse(txtBoxSdt.Text);
            if (docGiaBLL.SuaDocGia(suaDocGia))
            {
                ThongTinChiTietDocGiacs thongTinChiTietDocGiacs = new ThongTinChiTietDocGiacs(suaDocGia.maDocGia);
                thongTinChiTietDocGiacs.Show();
            } else
            {
                MessageBox.Show("Sửa thông tin lỗi");
            }
            Close();

        }
    }
}
