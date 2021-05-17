using DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using DTO.Login;

namespace QuanLyThuVien.Form_Login
{
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        /*private void button1_Click(object sender, EventArgs e)
        {

            using (Form_Dashboard fd = new Form_Dashboard())
            {
                fd.ShowDialog();
            }
        }*/

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        } 
        Login login = new Login();
        LoginBLL loginBLL = new LoginBLL();
        private void button1_Click(object sender, EventArgs e)
        {
            login.TenDangNhap = UnameTb.Text ;
            login.MatKhau = PasswordTb.Text ;
            if (loginBLL.DangNhap(login))
            {
                MessageBox.Show("Wrong UserName or Password");
            }
            else
            {
                this.Hide();
                Form1 main = new Form1();
                main.Show();
            }
        }

        private void label5_Click(object sender, EventArgs e)
        {
            UnameTb.Text = "";
            PasswordTb.Text = "";
        }
    }
}
