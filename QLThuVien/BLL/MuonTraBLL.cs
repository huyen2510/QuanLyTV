using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.MuonTra;
using DAL;
namespace BLL
{
    public class MuonTraBLL
    {
        MuonTraAccess MTAC = new MuonTraAccess();
        public List<GiaoDienMuonTra> HienThiGiaoDienMuonTra()
        {
            return MTAC.HienThiGiaoDienMuonTra();
        }
        public ChiTietMuonTra LayThongTinChiTiet(int MaMuonTra)
        {
            return MTAC.LayThongTinMuonTra(MaMuonTra);
        }
        public bool ChoMuonSach(MuonSach temp)
        {
            return MTAC.ChoMuonSach(temp);
        }
        public bool SuaThongTinMuonTra(int MaMT,DateTime HanMuon,string MaSach)
        {
            return MTAC.SuaThongTinMuonTra(MaMT, HanMuon, MaSach);
        }
        public List<GiaoDienMuonTra> TimKiemMuonTra(string strthongtin)
        {
            return MTAC.TimKiemMuonTra(strthongtin);
        }
        public List<DocGiaViPham> HienThiListSachDangMuonQuaHan()
        {
            return MTAC.HienThiListSachDangMuonQuaHan();
        }
    }
}
