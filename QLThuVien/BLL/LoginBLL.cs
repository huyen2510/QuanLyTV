using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO.Login;
using DAL;
namespace BLL
{
    public class LoginBLL
    {
        LoginAccess LGA = new LoginAccess();
        public bool DangNhap(Login login)
        {
            return LGA.DangNhap(login);
        }
    }
}
