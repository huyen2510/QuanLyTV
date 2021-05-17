using BLL;
using DTO.Sach;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien.Form_Sach
{
    public partial class ThongTinChiTietSach : Form
    {
        SachBLL SBLL = new SachBLL();
        public string MaSach;
        string MaDauSach;
        public ThongTinChiTietSach()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnThemDauSach_Click(object sender, EventArgs e)
        {
            SuaDauSach temp = new SuaDauSach();
            temp.MaDauSach = MaDauSach;
            temp.ShowDialog();
            if(temp.SuaThanhCong == true)
            {
                LoadThongTin();
            }
        }
        void LoadThongTin()
        {
            ThongTinSach temp = SBLL.LayThongTinSach(MaSach);
            lbMaDauSach.Text = temp.MaDauSach;
            MaDauSach = temp.MaDauSach;
            lbTenDauSach.Text = temp.TenDauSach;
            lbTacGia.Text = temp.TenTacGia;
            lbTheLoai.Text = temp.TheLoai;
            lbNgonNgu.Text = temp.NgonNgu;
            lbNhaXuatBan.Text = temp.NhaXuatBan;
            lbMaSach.Text = temp.MaSach;
            lbMaDauSach.Text = temp.MaDauSach;
            lbNgayThem.Text = temp.NgayThem;
            nbTap.Value = temp.Tap;
            nbLanTB.Value = temp.LanTaiBan;
            nbTang.Value = temp.Tang;
            nbNgan.Value = temp.Ngan;
            txbSoTrang.Text = temp.SoTrang.ToString();
            txbNamXB.Text = temp.NamXuatBan.ToString("dd/MM/yyyy");
            txbTinhTrang.Text = temp.TinhTrang;
            cbGia.Text = temp.MaGiaSach.ToString() + " - " + temp.TenGiaSach;
           

           
            // Gợi ý dữ liệu cho giá sách
            List<GiaSach> LGS = SBLL.LayGiaSach();
            foreach (GiaSach a in LGS)
            {
                cbGia.Items.Add(a.MaGiaSach.ToString() + " - " + a.TenGiaSach);
            }
            //
        }
        private void ThongTinChiTietSach_Load(object sender, EventArgs e)
        {
            LoadThongTin();
        }

       /* private void button1_Click(object sender, EventArgs e)
        {
                OpenFileDialog openFile = new OpenFileDialog();
                openFile.Filter = "Pictures files (*.jpg, *.jpeg, *.jpe, *.jfif, *.png)|*.jpg; *.jpeg; *.jpe; *.jfif; *.png|All files (*.*)|*.*";
                openFile.RestoreDirectory = true;
                if (openFile.ShowDialog() == DialogResult.OK)
                {
                    txbLink.Text = openFile.FileName;
                    pictureBox1.Image = new Bitmap(openFile.FileName);
                    tenduoianh = Path.GetExtension(openFile.FileName);
                }                          
        }
             */   
        string ChuyenDoiNgayThang(string s)
        {
            try
            {
                string[] temp = s.Split('/');
                return temp[1] + '/' + temp[0] + '/' + temp[2];
            }
            catch
            {
                return "";
            }
            
        }
        private void button2_Click(object sender, EventArgs e)
        {
            ThongTinSach temp = new ThongTinSach();
            temp.MaSach = lbMaSach.Text;
            temp.Tap = Int32.Parse(nbTap.Value.ToString());
            temp.LanTaiBan = Int32.Parse(nbLanTB.Value.ToString());
            int sotrang;
            if(Int32.TryParse(txbSoTrang.Text,out sotrang) && sotrang > 0){
                temp.SoTrang = sotrang;
                DateTime nxb = new DateTime();              
                if (DateTime.TryParse(ChuyenDoiNgayThang(txbNamXB.Text), out nxb))
                {
                    temp.NamXuatBan = nxb;
                    temp.TinhTrang = txbTinhTrang.Text;
                    string[] giasach = cbGia.Text.Split('-');
                    temp.MaGiaSach = Int32.Parse(giasach[0]);
                    temp.Tang = Int32.Parse(nbTang.Value.ToString());
                    temp.Ngan = Int32.Parse(nbNgan.Value.ToString());
                    /*string tenanh = "";
                    if(pictureBox1.Image != null)
                    {
                        tenanh = temp.MaSach + tenduoianh;
                        File.Copy(txbLink.Text, Path.Combine(Application.StartupPath + "\\HinhAnh\\",tenanh),true);
                    }
                    temp.HinhAnh = tenanh;
*/
                    if (SBLL.SuaThongTinSach(temp))
                    {
                        MessageBox.Show("Sửa thông tin thành công");
                        LoadThongTin();
                    }
                    else
                    {
                        MessageBox.Show("Sửa thông tin thất bại");
                    }
                }
                else
                {
                    MessageBox.Show("Kiểm tra lại năm xuất bản");

                }
            }
            else{
                MessageBox.Show("Số trang phải là số nguyên dương");
            }                                                   
        }
    }
}
