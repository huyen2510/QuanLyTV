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
    public partial class ThemDocGIa : Form
    {
        private DocGiaBLL docGiaBLL;
        public ThemDocGIa()
        {
            InitializeComponent();
            docGiaBLL = new DocGiaBLL();
        }
        

        private void saveDocGiaDB(object sender, EventArgs e)
        {
            DocGia docGia = new DocGia();
            if (txtBoxMaDocGia.Text.Length == 0)
            {
                MessageBox.Show("Mã độc giả không được trống");
                return;
                
            }
            if (txtBoxThemTenDocGia.Text.Length == 0)
            {
                MessageBox.Show("Mã độc giả không được trống");
                return;
            }
            
            docGia.maDocGia = Int32.Parse(txtBoxMaDocGia.Text);
            docGia.tenDocGia = txtBoxThemTenDocGia.Text;
            docGia.donVi = txtBoxThemDonVi.Text;
            docGia.ngaySinh = dateTimeNgaySinh.Text.Length != 0 
                ?  DateTime.Parse(dateTimeNgaySinh.Text) : DateTime.Now;
            docGia.sdt = Int32.Parse(txtBoxThemSdt.Text);
            docGia.queQuan = txtBoxThemQuequan.Text;
            if(!docGiaBLL.ThemDocGia(docGia))
            {
                MessageBox.Show("Độc giả này bị trùng mã độc giả trong Database");
                return;
            }
            Close();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
