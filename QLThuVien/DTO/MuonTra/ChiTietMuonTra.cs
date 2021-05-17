using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.MuonTra
{
    public class ChiTietMuonTra
    {
        public int MaMuonTra { get; set; }
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public int Tap { get; set; }
        public int LanTB { get; set; }
        public DateTime NgayMuon { get; set; }
        public DateTime HanMuon { get; set; }
        public string TinhTrang { get; set; }
        public int MaNV { get; set; }
        public int NgayQuaHan { get; set; }
        public int MaDocGia { get; set; }
        public string TenDocGia { get; set; }
        public string DonVi { get; set; }
        public int SoCuonDangMuon { get; set; }
    }
}
