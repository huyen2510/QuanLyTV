using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.Sach
{
    public class ThongTinSach
    {
        // thông tin đầu sách của nó
        public string MaDauSach { get; set; }
        public string TenDauSach { get; set; }
        public string TenTacGia { get; set; }
        public string TheLoai { get; set; }
        public string NgonNgu { get; set; }
        public string NhaXuatBan { get; set; }
        // thông tin sách
        public string MaSach { get; set; }
        public int Tap { get; set; }
        public int LanTaiBan { get; set; }
        public int SoTrang { get; set; }
        public DateTime NamXuatBan { get; set; }
        public string NgayThem { get; set; }
        public string TinhTrang { get; set; }
        public int MaGiaSach { get; set; }
        public string TenGiaSach { get; set; }
        public int Tang { get; set; }
        public int Ngan { get; set; }
        public string HinhAnh { get; set; }
        public int SoCuon { get; set; }
    }
}
