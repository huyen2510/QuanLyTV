using DAL;
using DTO;
using DTO.TheLoai;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ThongKeBLL
    {
        ThongKeAccess TKA = new ThongKeAccess();
        TheLoaiAccess TLA = new TheLoaiAccess();
        public List<TheLoai> LayDanhSachTheLoai()
        {
            return TLA.LayDanhSachTheLoai();
        }
        public List<DauSachDuocMuonNhieu> DauSachMuonNhieu()
        {
            return TKA.DauSachMuonNhieu();
        }
        public List<DauSachDuocMuonNhieu> SachConLai()
        {
            return TKA.SachConLai();
        }
    }
}
