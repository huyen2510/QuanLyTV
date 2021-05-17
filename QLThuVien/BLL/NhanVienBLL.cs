using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.NhanVien;
using DAL;
namespace BLL
{
    public class NhanVienBLL
    {
        NhanVienAccess NVA = new NhanVienAccess();
        public List<NhanVien> LayThongTinChiTiet()
        {
            List<NhanVien> NV = NVA.HienThiGiaoDienNhanVien();
            foreach (NhanVien nv in NV)
            {
                Console.WriteLine("MaNhanVien " + nv.MaNhanVien + "HoTen " + nv.HoTen);
            }
            return NVA.HienThiGiaoDienNhanVien();
        }
        public List<ThongKeTheoChucVu> LayDanhSach()
        {
            return NVA.LayDanhSach();
        }
        public List<ThongKeHoatDongNhanVien> LaySoCuonSach()
        {
            return NVA.LaySoCuonSach();
        }
        public bool ThemNhanVien (ThemNhanVien temp)
        {
            return NVA.ThemNhanVien(temp);
        }
        public bool XoaNhanVien(int MaNhanVien)
        {
            return NVA.XoaNhanVien(MaNhanVien);
        }
        public bool SuaNhanVien (ThemNhanVien temp)
        {
            return NVA.SuaNhanVien(temp);
        }
        public ThemNhanVien LayThongTinNhanVien(int MaNV)
        {
            return NVA.LayThongTinNhanVien(MaNV);
        }
    }
}
