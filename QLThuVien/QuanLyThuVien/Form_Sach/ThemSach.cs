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
    public partial class ThemSach : Form
    {
        SachBLL SBLL = new SachBLL();
        public string tenduoianh;
        public ThemSach()
        {
            InitializeComponent();
        }

        
        private void button3_Click_1(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnThemDauSach_Click(object sender, EventArgs e)
        {
            ThemDauSach themdausach = new ThemDauSach();
            themdausach.Show();
            if (themdausach.ThemThanhCong == true)
            {
                // Gợi ý dữ liệu cho Đầu sách
                cbDauSach.AutoCompleteCustomSource.Clear();
                AutoCompleteStringCollection autotext = new AutoCompleteStringCollection();
                List<DauSach> LDS = SBLL.LayDauSach();
                foreach (DauSach a in LDS)
                {
                    string temp = a.TenDauSach + " - " + a.MaDauSach;
                    temp = temp.Trim();
                    autotext.Add(temp);
                }
                cbDauSach.AutoCompleteMode = AutoCompleteMode.Suggest;
                cbDauSach.AutoCompleteSource = AutoCompleteSource.CustomSource;
                cbDauSach.AutoCompleteCustomSource = autotext;
            }

        }
        private void ThemSach_Load(object sender, EventArgs e)
        {
            // Gợi ý dữ liệu cho Đầu sách
            AutoCompleteStringCollection autotext = new AutoCompleteStringCollection();
            List<DauSach> LDS = SBLL.LayDauSach();
            foreach (DauSach a in LDS)
            {
                string temp = a.TenDauSach + " - " + a.MaDauSach;
                temp = temp.Trim();
                autotext.Add(temp);
            }
            cbDauSach.AutoCompleteMode = AutoCompleteMode.Suggest;
            cbDauSach.AutoCompleteSource = AutoCompleteSource.CustomSource;
            cbDauSach.AutoCompleteCustomSource = autotext;

            // Gợi ý dữ liệu cho giá sách
            
            List<GiaSach> LGS = SBLL.LayGiaSach();
            cbGia.Text = LGS[0].MaGiaSach.ToString() + " - " + LGS[0].TenGiaSach;
            foreach (GiaSach a in LGS)
            {
                cbGia.Items.Add(a.MaGiaSach.ToString() + " - " + a.TenGiaSach);
            }
        }
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
        // thêm sách
        private void button2_Click(object sender, EventArgs e)
        {
            AddSach temp = new AddSach();
            try
            {
                string[] dausach = cbDauSach.Text.Split('-');
                string tendausach = dausach[0].Trim();
                temp.MaDauSach = dausach[1].Trim();
                bool kiemtradausach = false;
                List<DauSach> lds = SBLL.LayDauSach();
                foreach (DauSach i in lds)
                {
                    if (i.TenDauSach.Trim() == tendausach && i.MaDauSach.Trim() == temp.MaDauSach)
                    {
                        kiemtradausach = true;
                        break;
                    }                  
                }
                if(kiemtradausach == true)
                {
                    temp.MaSach = txbMaSach.Text;
                    temp.Tap = Int32.Parse(nbTap.Value.ToString());
                    temp.LanTaiBan = Int32.Parse(nbLanTB.Value.ToString());
                    int sotrang;
                    if (Int32.TryParse(txbSoTrang.Text, out sotrang) && sotrang > 0)
                    {
                        temp.SoTrang = sotrang;
                        DateTime nxb = new DateTime();
                        if (DateTime.TryParse(ChuyenDoiNgayThang(txbNamXB.Text), out nxb))
                        {
                            temp.NamXB = nxb;
                            temp.TinhTrang = txbTinhTrang.Text;
                            string[] giasach = cbGia.Text.Split('-');
                            temp.GiaSach = Int32.Parse(giasach[0]);
                            temp.Tang = Int32.Parse(nbTang.Value.ToString());
                            temp.Ngan = Int32.Parse(nbNgan.Value.ToString());
                          
                            if (SBLL.ThemSach(temp))
                            {
                                MessageBox.Show("Thêm sách thành công.");
                                this.Dispose();
                            }
                            else
                            {
                                MessageBox.Show("Thêm sách thất bại. Mã sách không được trùng");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Ngày xuất bản không hợp lệ. Hãy kiểm tra lại!");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Số trang phải là số nguyên dương. Hãy kiểm tra lại!");
                    }
                }
                else
                {
                    MessageBox.Show("Đầu sách không tồn tại. Bạn phải thêm đầu sách trước khi thêm sách!");
                }
            }
            catch
            {
                MessageBox.Show("Sai cú pháp!! Cú pháp đúng: {Tên đầu sách} - {Mã đầu sách}.");
            }                     
        }
    }
}
