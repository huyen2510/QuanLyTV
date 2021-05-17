using BLL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien.Form_MuonTra
{
    public partial class Form_TraSach : Form
    {
        private DocGiaBLL docGiaBLL;
        public Form_TraSach()
        {
            InitializeComponent();
            docGiaBLL = new DocGiaBLL();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length == 0)
            {
                MessageBox.Show("Mã mượn trả không được trống");
                return;

            }
            if (docGiaBLL.TraSach(Int32.Parse(textBox1.Text)) == 1)
            {
                MessageBox.Show("Đã trả sách thành công");
                Close();
            }
            else if (docGiaBLL.TraSach(Int32.Parse(textBox1.Text)) == 0)
            {
                MessageBox.Show("Sách này chưa được mượn");
            }
            else
            {
                MessageBox.Show("Sách đã được trả");
            }
        }
    }
}
