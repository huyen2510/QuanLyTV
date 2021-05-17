using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.Sach;
using DAL;
namespace BLL
{
    public class SachBLL
    {
        SachAccess SAC = new SachAccess();
        public List<Sach> LayToanBoSach()
        {
            return SAC.HienThiGiaoDienSach();
        }
        public List<DauSach> LayDauSach()
        {
            return SAC.LayDauSach();
        }
        public List<GiaSach> LayGiaSach()
        {
            return SAC.LayGiaSach();
        }
        public bool ThemSach(AddSach temp)
        {
            return SAC.ThemSach(temp);
        }
        public bool ThemDauSach(AddDauSach temp)
        {
            return SAC.ThemDauSach(temp);
        }
        public ThongTinSach LayThongTinSach (string MaSach)
        {
            return SAC.LayThongTinSach(MaSach);
        }
        public DauSach LayThongTinDauSach(string MaDauSach)
        {
            return SAC.LayThongTinDauSach(MaDauSach);
        }
        public bool SuaThongTinSach(ThongTinSach temp)
        {
            return SAC.SuaThongTinSach(temp);
        }
        public bool SuaDauSach(DauSach temp)
        {
            return SAC.SuaDauSach(temp);
        }
        public List<Sach> TimKiemSach(string thongtin)
        {
            return SAC.TimKiemSach(thongtin);
        }
        public List<Sach> TimKiemSachChiTiet(DauSach temp)
        {
            return SAC.TimKiemSachChiTiet(temp);
        }
        public bool XoaSach(string MaSach)
        {
            return SAC.XoaSach(MaSach);
        }
        public bool XoaDauSach(string MaDauSach)
        {
            return SAC.XoaDauSach(MaDauSach);
        }
        public List<DauSach> HienThiGiaoDienDauSach()
        {
            return SAC.HienThiGiaoDienDauSach();
        }
        public List<DauSach> ThongKeDauSach()
        {
            return SAC.ThongKeDauSach();
        }
        public List<ThongTinSach> ThongKeCuonSach()
        {
            return SAC.ThongKeCuonSach();
        }
        public List<TheLoai> ThongKeTheLoai()
        {
            return SAC.ThongKeTheLoai();
        }
    }
}
