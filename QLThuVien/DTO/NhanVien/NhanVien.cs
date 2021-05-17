using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO.NhanVien
{
    public class NhanVien
    {
        public int MaNhanVien { get; set; }
        public string HoTen { get; set; }
        public DateTime NgaySinh { get; set; }
        public int SDT { get; set; }
        public string Email { get; set; }
        public int MaChucVu {get; set; }

    }
}
