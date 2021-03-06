USE [master]
GO
/****** Object:  Database [QuanLyTV]    Script Date: 5/11/2021 9:26:05 PM ******/
CREATE DATABASE [QuanLyTV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyTV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyTV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyTV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyTV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyTV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyTV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTV] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyTV] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyTV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyTV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyTV', N'ON'
GO
ALTER DATABASE [QuanLyTV] SET QUERY_STORE = OFF
GO
USE [QuanLyTV]
GO
/****** Object:  UserDefinedFunction [dbo].[DemSoCuonSachDangMuon]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DemSoCuonSachDangMuon](@madocgia int)
returns int
as begin
		declare @kq int
		set @kq = (select count(*)
					from MuonTra join ChiTiet_MuonTra
					on MuonTra.MaMuonTra = ChiTiet_MuonTra.MaMuonTra
					where MuonTra.MaDocGia = @madocgia and DaTra = 0)					
		return(@kq)
end
GO
/****** Object:  UserDefinedFunction [dbo].[DemSoSachTheoTheLoai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DemSoSachTheoTheLoai](@matheloai int)
returns int
as
begin
		declare @kq int
		set @kq = (select count(*)
					from Sach,DauSach,TheLoai_DauSach
					where Sach.MaDauSach = DauSach.MaDauSach
						and DauSach.MaDauSach = TheLoai_DauSach.MaDauSach
						and TheLoai_DauSach.MaTheLoai = @matheloai)
		return(@kq)
end
GO
/****** Object:  UserDefinedFunction [dbo].[GomNgonNgu]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GomNgonNgu](@madausach nchar(50))
returns nvarchar(500)
as 
begin
	declare Contro cursor for (select TenNgonNgu
		from NgonNgu_DauSach join NgonNgu on NgonNgu_DauSach.MaNgonNgu = NgonNgu.MaNgonNgu
		where MaDauSach = @madausach )
	open Contro
	declare @kq nvarchar(500)
	set @kq = ''
	declare @tenngonngu nvarchar(100)
	fetch next from Contro into @tenngonngu
	while @@FETCH_STATUS = 0
	begin
		set @kq = @kq + @tenngonngu + ', '
		fetch next from Contro into @tenngonngu
	end
	close Contro
	deallocate Contro
	set @kq = stuff(@kq,len(@kq),1,'')
	return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[GomNXB]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GomNXB](@ma nchar(50))
returns nvarchar(500)
as 
begin
	declare Contro cursor for (select TenNXB
	from NXB_DauSach join NhaXuatBan on NXB_DauSach.MaNXB = NhaXuatBan.MaNXB
	where MaDauSach = @ma)
	open Contro
	declare @kq nvarchar(500)
	set @kq = ''
	declare @tenNXB nvarchar(100)
	fetch next from Contro into @tenNXB
	while @@FETCH_STATUS = 0
	begin
		set @kq = @kq + @tenNXB+', '
		fetch next from Contro into @tenNXB
	end
	close Contro
	deallocate Contro
	set @kq = stuff(@kq,len(@kq),1,'')
	return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[GomTacGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GomTacGia](@madausach nchar(50))
returns nvarchar(500)
as 
begin
	declare Contro cursor for (select TenTacGia
		from TacGia_DauSach join TacGia on TacGia_DauSach.MaTacGia = TacGia.MaTacGia
		where MaDauSach = @madausach )
	open Contro
	declare @kq nvarchar(500)
	set @kq = ''
	declare @tentacgia nvarchar(100)
	fetch next from Contro into @tentacgia
	while @@FETCH_STATUS = 0
	begin
		set @kq = @kq + @tentacgia + ', '
		fetch next from Contro into @tentacgia
	end
	close Contro
	deallocate Contro
	set @kq = stuff(@kq,len(@kq),1,'')
	return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[GomTheLoai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GomTheLoai](@madausach nchar(50))
returns nvarchar(500)
as 
begin
	declare Contro cursor for (select TenTheLoai
		from TheLoai_DauSach join TheLoai on TheLoai_DauSach.MaTheLoai = TheLoai.MaTheLoai
		where MaDauSach = @madausach )
	open Contro
	declare @kq nvarchar(500)
	set @kq = ''
	declare @tenTheLoai nvarchar(100)
	fetch next from Contro into @tenTheLoai
	while @@FETCH_STATUS = 0
	begin
		set @kq = @kq + @tenTheLoai + ', '
		fetch next from Contro into @tenTheLoai
	end
	close Contro
	deallocate Contro
	set @kq = stuff(@kq,len(@kq),1,'')
	return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[HienThi]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[HienThi]()
returns @BangThongTin table(
MaNhanVien int,
MaDocGia int,
TenDocGia nvarchar(200),
NgayMuon datetime,
NgayTra datetime)
as
begin
    insert into @BangThongTin
    select 
	nv.MaNhanVien, dg.MaDocGia, dg.TenDocGia, ct.NgayMuon, ct.NgayTra 
    from DocGia dg, NhanVien nv, MuonTra mt, ChiTiet_MuonTra ct 
    where 
	      nv.MaNhanVien = mt.MaNhanVien and
          mt.MaDocGia = dg.MaDocGia and
	      ct.MaMuonTra = mt.MaMuonTra	  
    return;
end
GO
/****** Object:  UserDefinedFunction [dbo].[hienthisachdangmuon]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[hienthisachdangmuon] (@madocgia int)
RETURNS @bangsachdangmuontheodocgia 
		TABLE (MaMuonTra nvarchar(50),MaSach nvarchar(50), TenDauSach nvarchar(200), TenTacGia nvarchar(200),
	NgayMuon Date, HoTen nvarchar(200))
BEGIN
	insert into @bangsachdangmuontheodocgia
	SELECT 
	DISTINCT  mt.MaMuonTra, s.MaSach AS [Mã sách], ds.TenDauSach AS [Tên sách],dbo.GomTacGia(ds.MaDauSach),
	ctmt.NgayMuon AS [Ngày mu?n], nv.HoTen AS [Mu?n c?a nhân viên]
	from 
	dbo.DocGia dg,dbo.NhanVien nv, dbo.MuonTra mt, dbo.ChiTiet_MuonTra ctmt, dbo.Sach s, dbo.TacGia tg, dbo.DauSach ds, 
	dbo.TacGia_DauSach tgds
	WHERE dg.MaDocGia = @madocgia AND mt.MaDocGia = dg.MaDocGia AND mt.MaMuonTra = ctmt.MaMuonTra 
	AND ctmt.MaSach = s.MaSach AND mt.MaNhanVien = nv.MaNhanVien AND s.MaDauSach = ds.MaDauSach AND ds.MaDauSach = tgds.MaDauSach
	AND tgds.MaTacGia = tg.MaTacGia AND ctmt.DaTra = 0
	return
END
GO
/****** Object:  UserDefinedFunction [dbo].[LayThongTiNhanVien]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[LayThongTiNhanVien](@maNhanVien int)
returns @bangchitiet table (
		MaNhanVien int,HoTen nvarchar(200),NgaySinh date,SDT int,
		Email nvarchar(200),MaChucVu int
)as begin
	insert into @bangchitiet 
				select MaNhanVien,HoTen,NgaySinh,SDT,Email,MaChucVu				
				from NhanVien							
				where MaNhanVien = @maNhanVien
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[NguoiMuonSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[NguoiMuonSach] (@masach nchar(50))
returns nvarchar(50)
as begin
	declare @kq nvarchar(200)
	if exists (select * from ChiTiet_MuonTra where MaSach = @masach)
	begin
		set @kq = (select TenDocGia 
					from (DocGia join MuonTra on DocGia.MaDocGia = MuonTra.MaDocGia) 
						join ChiTiet_MuonTra on MuonTra.MaMuonTra = ChiTiet_MuonTra.MaMuonTra
					where MaSach = @masach)
	end
	else
		set @kq = N'Chưa ai mượn'
	return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[ThongKeMuonQuaHan]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ThongKeMuonQuaHan]()
returns @bangthongtin table(
	MaDocGia int, TenDocGia nvarchar(500), SoNgayQuaHan int,TinhTrang int) 
AS
BEGIN

		insert into @bangthongtin
			SELECT DocGia.MaDocGia,DocGia.TenDocGia,DATEDIFF(day,NgayTra,GETDATE()),ChiTiet_MuonTra.DaTra
			FROM DocGia
			LEFT JOIN MuonTra ON MuonTra.MaDocGia = DocGia.MaDocGia
			LEFT JOIN ChiTiet_MuonTra ON ChiTiet_MuonTra.MaMuonTra = MuonTra.MaMuonTra

	Return
END
GO
/****** Object:  UserDefinedFunction [dbo].[ThongTinChiTietCuonSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ThongTinChiTietCuonSach] (@masach nchar(50))
returns @bangchitiet table (
		MaDauSach nchar(50),TenDauSach nvarchar(500),TacGia nvarchar(500),TheLoai nvarchar(500),
		NgonNgu nvarchar(500),NXB nvarchar(500),
		MaSach nchar(50),Tap int,LanTaiBan int,SoTrang int,NamXuatBan date,
		NgayThem date,TinhTrang nvarchar(200),Gia int,TenGia nvarchar(500),Tang int,Ngan int,HinhAnh nvarchar(max)
)as begin	
		insert into @bangchitiet 
			select DauSach.MaDauSach,TenDauSach,dbo.GomTacGia(DauSach.MaDauSach),
			dbo.GomTheLoai(DauSach.MaDauSach),dbo.GomNgonNgu(DauSach.MaDauSach),
			dbo.GomNXB(DauSach.MaDauSach),

			MaSach,Tap,LanTaiBan,SoTrang,NgayNhap,NamXuatBan,TinhTrang,v.MaGiaSach,TenGiaSach,
			Tang,Ngan,HinhAnh								 		    
	
			from (Sach join DauSach on Sach.MaDauSach = DauSach.MaDauSach)
			join (ViTriCuThe as v join GiaSach on v.MaGiaSach = GiaSach.MaGiaSach)
			on Sach.MaViTri = v.MaViTri				
			where MaSach =@masach
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[ThongTinChiTietDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ThongTinChiTietDauSach] (@madausach nchar(50))
returns @bangchitiet table (
		MaDauSach nchar(50),TenDauSach nvarchar(500),TacGia nvarchar(500),TheLoai nvarchar(500),
		NgonNgu nvarchar(500),NXB nvarchar(500)
)as begin
	insert into @bangchitiet 
				select MaDauSach,TenDauSach,dbo.GomTacGia(MaDauSach),
				dbo.GomTheLoai(MaDauSach),dbo.GomNgonNgu(MaDauSach),
				dbo.GomNXB(MaDauSach)				
				from DauSach							
				where MaDauSach = @madausach
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[ThongTinChiTietMuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ThongTinChiTietMuonTra](@mamuontra int)
returns @bangthongtin table(
	MaMuonTra int, MaSach nchar(50),TenSach nvarchar(500), Tap int,LanTB int, NgayMuon date, 
	HanMuon date,TinhTrang int ,MaNhanVien int,NgayQuaHan int,
	MaDocGia int, TenDocGia nvarchar(200), DonVi nvarchar(200),SoCuonDangMuon int
)as begin
	insert into @bangthongtin 
		select MuonTra.MaMuonTra,ChiTiet_MuonTra.MaSach,DauSach.TenDauSach,Sach.Tap,Sach.LanTaiBan,
		NgayMuon,NgayHanTra,DaTra,MaNhanVien,DATEDIFF(day,NgayHanTra,NgayTra),
		MuonTra.MaDocGia,TenDocGia,DonVi,dbo.DemSoCuonSachDangMuon(MuonTra.MaDocGia)		
		from (((MuonTra join ChiTiet_MuonTra on MuonTra.MaMuonTra = ChiTiet_MuonTra.MaMuonTra)
			join DocGia on MuonTra.MaDocGia = DocGia.MaDocGia) 
			join Sach on ChiTiet_MuonTra.MaSach = Sach.MaSach)
			join DauSach on Sach.MaDauSach =DauSach.MaDauSach
		where MuonTra.MaMuonTra = @mamuontra
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[timKiemDocGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[timKiemDocGia] ( @noidungtimkiem nvarchar(max))
RETURNs @bangketqua table 
(MaDocGia int, TenDocGia nvarchar(200), DonVi nvarchar(200), NgaySinh Date, SDT int, QueQuan nvarchar(100))
AS
BEGIN

	declare @checkInt int
	-- do ma doc gia la kieu int nen can check 
	set @checkInt = TRY_CAST(@noidungtimkiem AS int)
	IF (@checkInt IS NOT NULL ) 

		BEGIN
			insert into @bangketqua
			select * FROM DocGia
			where dbo.DocGia.MaDocGia = @checkInt
		END
		
	 else 
	 BEGIN
			insert into @bangketqua
			select * FROM DocGia
			where dbo.DocGia.MaDocGia = TRY_CAST(@noidungtimkiem AS int)
					or dbo.DocGia.TenDocGia like N'%'+@noidungtimkiem+'%'
					or dbo.DocGia.DonVi like N'%'+@noidungtimkiem+'%'
					or dbo.DocGia.NgaySinh like N'%'+@noidungtimkiem+'%'
					or dbo.DocGia.SDT like N'%'+@noidungtimkiem+'%'
					or dbo.DocGia.QueQuan like N'%'+@noidungtimkiem+'%'
	 END
		

	return
END
GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemMuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TimKiemMuonTra](@strthongtin nvarchar(max))
returns @bangketqua table(
		MaMuonTra int,MaSach nchar(50),MaDocGia int,TenDocGia nchar(200),TinhTrang int		
)as begin
	set @strthongtin = @strthongtin + ','
	while (CHARINDEX(',',@strthongtin) > 0)
	-- tìm kiếm nhiều thông tin,cắt từng thông tin theo dấu ','
	begin
		declare @thongtin nvarchar(500)
		set @thongtin = LEFT(@strthongtin,CHARINDEX(',',@strthongtin)-1)
		set @thongtin = Rtrim(Ltrim(@thongtin))
		insert into @bangketqua
			SELECT MuonTra.MaMuonTra,MaSach,DocGia.MaDocGia,TenDocGia,DaTra
			FROM (MuonTra join ChiTiet_MuonTra on MuonTra.MaMuonTra = ChiTiet_MuonTra.MaMuonTra)
					join DocGia on MuonTra.MaDocGia = DocGia.MaDocGia
			where	MuonTra.MaMuonTra = TRY_CONVERT(int,@thongtin) or
					LOWER(MaSach) like N'%'+LOWER(@thongtin)+'%' or
					MuonTra.MaDocGia = TRY_CONVERT(int,@thongtin) or
					LOWER(TenDocGia) like N'%'+LOWER(@thongtin)+'%' 					
		set @strthongtin = stuff(@strthongtin,1,CHARINDEX(',',@strthongtin)+1,'')
	end	
	return
end	
GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemNangCao]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TimKiemNangCao](
	@tendausach nvarchar(500),@tacgia nvarchar(500),
	@theloai nvarchar(500),@ngonngu nvarchar(500),@nxb nvarchar(500)
)
returns @bangketqua table(
	MaSach nchar(50), TenDauSach nvarchar(500),Tap int,LanTaiBan int,ViTri nchar(10),NguoiMuon nvarchar(200),
	TacGia nvarchar(500),TheLoai nvarchar(500),NgonNgu nvarchar(500),NXB nvarchar(500)	
)as begin
	insert into @bangketqua
			SELECT MaSach, TenDauSach, Tap, LanTaiBan, dbo.ViTri(MaViTri),dbo.NguoiMuonSach(MaSach),
			dbo.GomTacGia(DauSach.MaDauSach), dbo.GomTheLoai(DauSach.MaDauSach),			
            dbo.GomNgonNgu(DauSach.MaDauSach), dbo.GomNXB(DauSach.MaDauSach)
			FROM Sach INNER JOIN DauSach  ON  Sach.MaDauSach = DauSach.MaDauSach	
			where  LOWER(TenDauSach) like N'%'+LOWER(@tendausach)+'%' 
				 and LOWER(dbo.GomTacGia(DauSach.MaDauSach)) like N'%'+LOWER(@tacgia)+'%'
				 and LOWER(dbo.GomNXB(DauSach.MaDauSach)) like N'%'+LOWER(@nxb)+'%'
				 and LOWER(dbo.GomTheLoai(DauSach.MaDauSach)) like N'%'+LOWER(@theloai)+'%'
				 and LOWER(dbo.GomNgonNgu(DauSach.MaDauSach)) like N'%'+LOWER(@ngonngu)+'%'
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TimKiemSach](@strthongtin nvarchar(max))
returns @bangketqua table(
		MaSach nchar(50),TenDauSach nvarchar(500),Tap int,LanTaiBan int,ViTri nvarchar(10),
		NguoiMuon nvarchar(200),
		TacGia nvarchar(500),TheLoai nvarchar(500),NgonNgu nvarchar(500),NXB nvarchar(500)		
)as begin
	set @strthongtin = @strthongtin + ','
	while (CHARINDEX(',',@strthongtin) > 0)
	-- tìm kiếm nhiều thông tin,cắt từng thông tin theo dấu ','
	begin
		declare @thongtin nvarchar(500)
		set @thongtin = LEFT(@strthongtin,CHARINDEX(',',@strthongtin)-1)
		set @thongtin = Rtrim(Ltrim(@thongtin))
		insert into @bangketqua
			SELECT MaSach, TenDauSach, Tap, LanTaiBan, dbo.ViTri(MaViTri),dbo.NguoiMuonSach(MaSach),
			dbo.GomTacGia(DauSach.MaDauSach), dbo.GomTheLoai(DauSach.MaDauSach),			
            dbo.GomNgonNgu(DauSach.MaDauSach), dbo.GomNXB(DauSach.MaDauSach)
			FROM Sach INNER JOIN DauSach  ON  Sach.MaDauSach = DauSach.MaDauSach				
			where	LOWER(MaSach) like N'%'+LOWER(@thongtin)+'%'
					or LOWER(TenDauSach) like N'%'+@thongtin+'%'
					or LOWER(dbo.NguoiMuonSach(MaSach)) like N'%'+@thongtin+'%'
					or LOWER(dbo.GomTacGia(DauSach.MaDauSach)) like N'%'+LOWER(@thongtin)+'%'
					or LOWER(dbo.GomTheLoai(DauSach.MaDauSach)) like N'%'+LOWER(@thongtin)+'%'
					or LOWER(dbo.GomNXB(DauSach.MaDauSach)) like N'%'+LOWER(@thongtin)+'%'					
					or LOWER(dbo.GomNgonNgu(DauSach.MaDauSach)) like N'%'+LOWER(@thongtin)+'%'
		set @strthongtin = stuff(@strthongtin,1,CHARINDEX(',',@strthongtin)+1,'')
	end	
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[ViTri]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ViTri](@mavitri int)
returns nvarchar(7)
as
begin
	declare Contro cursor for (select MaGiaSach,Tang,Ngan from ViTriCuThe where MaViTri = @mavitri)
	open Contro
	declare @kq nvarchar(7)
	declare @Gia int,@Tang int,@Ngan int
	fetch next from Contro into @Gia,@Tang,@Ngan
	set @kq = 'G'+CAST(@Gia as nchar(1))+'T'+CAST(@Tang as nchar(1))+'N'+CAST(@Ngan as nchar(1))
	close Contro
	deallocate Contro
	return @kq
end
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [int] NOT NULL,
	[TenChucVu] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] NOT NULL,
	[HoTen] [nvarchar](200) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [int] NULL,
	[Email] [nchar](200) NULL,
	[MaChucVu] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HienThiGiaoDienNhanVien]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HienThiGiaoDienNhanVien]
AS
SELECT dbo.NhanVien.MaNhanVien, dbo.NhanVien.HoTen, dbo.NhanVien.NgaySinh, dbo.NhanVien.SDT, dbo.NhanVien.Email, dbo.ChucVu.MaChucVu
FROM     dbo.ChucVu INNER JOIN
                  dbo.NhanVien ON dbo.ChucVu.MaChucVu = dbo.NhanVien.MaChucVu
GO
/****** Object:  Table [dbo].[MuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTra](
	[MaDocGia] [int] NULL,
	[MaNhanVien] [int] NULL,
	[MaMuonTra] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDocGia] [int] NOT NULL,
	[TenDocGia] [nvarchar](200) NULL,
	[DonVi] [nvarchar](200) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [int] NULL,
	[QueQuan] [nvarchar](100) NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [nchar](50) NOT NULL,
	[MaDauSach] [nchar](50) NULL,
	[Tap] [int] NULL,
	[LanTaiBan] [int] NULL,
	[TinhTrang] [nvarchar](100) NULL,
	[SoTrang] [int] NULL,
	[NgayNhap] [date] NULL,
	[NamXuatBan] [date] NULL,
	[MaViTri] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_MuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_MuonTra](
	[MaMuonTra] [int] IDENTITY(1,1) NOT NULL,
	[MaSach] [nchar](50) NULL,
	[NgayMuon] [date] NULL,
	[DaTra] [int] NULL,
	[NgayHanTra] [date] NULL,
	[NgayTra] [date] NULL,
 CONSTRAINT [PK_ChiTiet_MuonTra] PRIMARY KEY CLUSTERED 
(
	[MaMuonTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ThongKeDocGiaViPhamQuaHan]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongKeDocGiaViPhamQuaHan]
AS
SELECT dbo.MuonTra.MaDocGia, dbo.DocGia.TenDocGia, dbo.ChiTiet_MuonTra.NgayHanTra, dbo.ChiTiet_MuonTra.NgayTra, dbo.ChiTiet_MuonTra.DaTra, DATEDIFF(day, dbo.ChiTiet_MuonTra.NgayHanTra, dbo.ChiTiet_MuonTra.NgayTra) 
                  AS soNgayQuaHan, dbo.Sach.MaSach
FROM     dbo.ChiTiet_MuonTra INNER JOIN
                  dbo.MuonTra ON dbo.ChiTiet_MuonTra.MaMuonTra = dbo.MuonTra.MaMuonTra INNER JOIN
                  dbo.DocGia ON dbo.MuonTra.MaDocGia = dbo.DocGia.MaDocGia INNER JOIN
                  dbo.Sach ON dbo.ChiTiet_MuonTra.MaSach = dbo.Sach.MaSach
WHERE  (dbo.ChiTiet_MuonTra.NgayHanTra < dbo.ChiTiet_MuonTra.NgayTra)
GO
/****** Object:  Table [dbo].[DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSach](
	[MaDauSach] [nchar](50) NOT NULL,
	[TenDauSach] [nvarchar](200) NULL,
 CONSTRAINT [PK_DauSach] PRIMARY KEY CLUSTERED 
(
	[MaDauSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](200) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai_DauSach](
	[MaDauSach] [nchar](50) NULL,
	[MaTheLoai] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_PhanNhomTheLoai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_PhanNhomTheLoai]()
RETURNS TABLE
AS RETURN
	(select ds.TenDauSach, tl.TenTheLoai
	from (select a.MaDauSach, a.MaTheLoai
			from (select TheLoai.MaTheLoai ,count(TenDauSach) as soSach,DauSach.MaDauSach 
					from TheLoai,TheLoai_DauSach,DauSach
					where TheLoai.MaTheLoai=TheLoai_DauSach.MaTheLoai 
						and DauSach.MaDauSach=TheLoai_DauSach.MaDauSach 
					group by TheLoai.MaTheLoai,DauSach.MaDauSach) as a,
				Sach,
				ChiTiet_MuonTra
			where Sach.MaDauSach=a.MaDauSach 
				and ChiTiet_MuonTra.MaSach=Sach.MaSach
			group by a.MaTheLoai ,a.MaDauSach) as b,
		DauSach ds,
		TheLoai tl
	where b.MaDauSach=ds.MaDauSach 
		and b.MaTheLoai=tl.MaTheLoai)
GO
/****** Object:  UserDefinedFunction [dbo].[F_SachDuocMuonNhieu]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_SachDuocMuonNhieu]()
RETURNS TABLE 
AS RETURN
	(SELECT TenDauSach , COUNT(Sach.MaSach) as SoLuotMuon
	FROM Sach,ChiTiet_MuonTra,DauSach
	WHERE DauSach.MaDauSach=Sach.MaDauSach and ChiTiet_MuonTra.MaSach=Sach.MaSach
	GROUP BY TenDauSach)
GO
/****** Object:  UserDefinedFunction [dbo].[F_SoLuongSachConLai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_SoLuongSachConLai]()
RETURNS TABLE
AS RETURN
	(SELECT ds.TenDauSach, COUNT(*) as "Số lượng"
	FROM Sach s, DauSach ds, ChiTiet_MuonTra mt
	WHERE s.MaDauSach=ds.MaDauSach
	and s.MaSach=mt.MaSach
	and ((mt.DaTra=1) or (mt.NgayMuon=null))
	GROUP BY ds.TenDauSach)
GO
/****** Object:  View [dbo].[HienThiGiaoDienDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[HienThiGiaoDienDauSach] 
	as
		select MaDauSach,TenDauSach,
				dbo.GomTacGia(MaDauSach) as [Tác giả],
				dbo.GomTheLoai(MaDauSach)as [Thể loại],
				dbo.GomNgonNgu(MaDauSach)as [Ngôn ngữ],
				dbo.GomNXB(MaDauSach)as [NXB]
		from DauSach
GO
/****** Object:  View [dbo].[HienThiGiaoDienMuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HienThiGiaoDienMuonTra]
AS
SELECT dbo.MuonTra.MaMuonTra, dbo.ChiTiet_MuonTra.MaSach, dbo.MuonTra.MaDocGia, dbo.DocGia.TenDocGia, dbo.ChiTiet_MuonTra.DaTra
FROM     dbo.MuonTra INNER JOIN
                  dbo.ChiTiet_MuonTra ON dbo.MuonTra.MaMuonTra = dbo.ChiTiet_MuonTra.MaMuonTra INNER JOIN
                  dbo.DocGia ON dbo.MuonTra.MaDocGia = dbo.DocGia.MaDocGia
GO
/****** Object:  View [dbo].[HienThiGiaoDienSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HienThiGiaoDienSach]
AS
SELECT dbo.Sach.MaSach, dbo.DauSach.TenDauSach, dbo.Sach.Tap, dbo.Sach.LanTaiBan, dbo.ViTri(dbo.Sach.MaViTri) AS [Vị trí], dbo.NguoiMuonSach(dbo.Sach.MaSach) AS [Người mượn], dbo.GomTacGia(dbo.DauSach.MaDauSach) AS [Tác giả], 
                  dbo.GomTheLoai(dbo.DauSach.MaDauSach) AS [Thể loại], dbo.GomNgonNgu(dbo.DauSach.MaDauSach) AS [Ngôn ngữ], dbo.GomNXB(dbo.DauSach.MaDauSach) AS NXB
FROM     dbo.Sach INNER JOIN
                  dbo.DauSach ON dbo.Sach.MaDauSach = dbo.DauSach.MaDauSach
GO
/****** Object:  View [dbo].[hienthitoanbodocgia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[hienthitoanbodocgia]
AS SELECT * FROM dbo.DocGia dg
GO
/****** Object:  View [dbo].[SoLuongNV_CV]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SoLuongNV_CV]
AS
SELECT cv.TenChucVu, COUNT(nv.MaNhanVien) AS SoLuong
FROM     dbo.NhanVien AS nv INNER JOIN
                  dbo.ChucVu AS cv ON nv.MaChucVu = cv.MaChucVu
GROUP BY cv.MaChucVu, cv.TenChucVu
GO
/****** Object:  View [dbo].[ThongKeCuonSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeCuonSach]
as
select TenDauSach,Tap,LanTaiBan,SoTrang,	
	COUNT(*) as [Số cuốn]
from DauSach left join Sach on DauSach.MaDauSach = Sach.MaDauSach
group by TenDauSach,Tap,LanTaiBan,SoTrang
GO
/****** Object:  View [dbo].[ThongKeDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeDauSach]
as
	SELECT  DauSach.MaDauSach,TenDauSach, dbo.GomTacGia(DauSach.MaDauSach) AS [Tác giả],
			dbo.GomNgonNgu(DauSach.MaDauSach) AS [Ngôn Ngữ],
			dbo.GomTheLoai(DauSach.MaDauSach) AS [Thể Loại], 
            dbo.GomNXB(DauSach.MaDauSach) AS NXB, COUNT(*) AS [Số cuốn sách]
	FROM    DauSach LEFT JOIN Sach ON DauSach.MaDauSach = Sach.MaDauSach                       
	GROUP BY DauSach.MaDauSach, DauSach.TenDauSach
GO
/****** Object:  View [dbo].[ThongKeHoatDongNhanVien]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeHoatDongNhanVien]
as
select NhanVien.MaNhanVien,HoTen,count(*) as [Số cuốn]
from NhanVien left join MuonTra on NhanVien.MaNhanVien = MuonTra.MaNhanvien
group by NhanVien.MaNhanVien,HoTen
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](200) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia_DauSach](
	[MaDauSach] [nchar](50) NULL,
	[MaTacGia] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ThongKeTacGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeTacGia]
as
select TenTacGia,NgaySinh,Count(*) as [Số cuốn sách]
from TacGia,TacGia_DauSach,DauSach,Sach
where TacGia.MaTacGia = TacGia_DauSach.MaTacGia
	and TacGia_DauSach.MaDauSach = DauSach.MaDauSach
	and DauSach.MaDauSach = Sach.MaDauSach
group by TenTacGia,NgaySinh
GO
/****** Object:  View [dbo].[ThongKeTheLoai]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeTheLoai]
as
select TenTheLoai,count(*) as [Số đầu sách],
	dbo.DemSoSachTheoTheLoai(TheLoai.MaTheLoai) as [Số cuốn sách]
from TheLoai left join TheLoai_DauSach
on TheLoai.MaTheLoai = TheLoai_DauSach.MaTheLoai
group by TheLoai.MaTheLoai,TenTheLoai
GO
/****** Object:  View [dbo].[ThongTin_CT]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongTin_CT]
as
select nv.MaNhanVien, dg.MaDocGia, dg.TenDocGia, ct.NgayMuon, ct.NgayTra 
from DocGia dg, NhanVien nv, MuonTra mt, ChiTiet_MuonTra ct
where nv.MaNhanVien = mt.MaNhanVien and
      mt.MaDocGia = dg.MaDocGia and
	  ct.MaMuonTra = mt.MaMuonTra and
	  nv.MaNhanVien = 1
GO
/****** Object:  UserDefinedFunction [dbo].[ThongKeNhanVienTheoChucVu]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ThongKeNhanVienTheoChucVu]()
RETURNS TABLE
AS RETURN
    (SELECT ChucVu.MaChucVu, ChucVu.TenChucVu,COUNT(*) as "Số lượng"
    FROM NhanVien, ChucVu
    WHERE NhanVien.MaChucVu = ChucVu.MaChucVu
GROUP BY ChucVu.MaChucVu, ChucVu.TenChucVu)
GO
/****** Object:  Table [dbo].[GiaSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaSach](
	[MaGiaSach] [int] NOT NULL,
	[TenGiaSach] [nvarchar](500) NULL,
 CONSTRAINT [PK_GiaSach] PRIMARY KEY CLUSTERED 
(
	[MaGiaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgonNgu]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu](
	[MaNgonNgu] [int] IDENTITY(1,1) NOT NULL,
	[TenNgonNgu] [nvarchar](200) NULL,
 CONSTRAINT [PK_NgonNgu] PRIMARY KEY CLUSTERED 
(
	[MaNgonNgu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgonNgu_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu_DauSach](
	[MaDauSach] [nchar](50) NULL,
	[MaNgonNgu] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT] [int] NULL,
	[Email] [nvarchar](200) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB_DauSach](
	[MaDauSach] [nchar](50) NULL,
	[MaNXB] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [nchar](100) NOT NULL,
	[MatKhau] [nchar](100) NULL,
	[MaNhanVien] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViTriCuThe]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViTriCuThe](
	[MaViTri] [int] IDENTITY(1,1) NOT NULL,
	[Tang] [int] NULL,
	[Ngan] [int] NULL,
	[MaGiaSach] [int] NULL,
 CONSTRAINT [PK_ViTriCuThe] PRIMARY KEY CLUSTERED 
(
	[MaViTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuLyViPham]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuLyViPham](
	[MaXuLy] [int] NOT NULL,
	[MaDocGia] [int] NULL,
	[LyDo] [nvarchar](max) NULL,
	[TienPhat] [int] NULL,
	[DaTra] [int] NULL,
 CONSTRAINT [PK_XuLyViPham_1] PRIMARY KEY CLUSTERED 
(
	[MaXuLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTiet_MuonTra] ON 

INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (1, N'32132141                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-04-20' AS Date), CAST(N'2021-05-11' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (5, N'10035344                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-24' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (6, N'59435344                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-04-25' AS Date), CAST(N'2021-04-20' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (8, N'04435344                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-24' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (9, N'05435344                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-04-08' AS Date), CAST(N'2021-04-20' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (10, N'06435344                                          ', CAST(N'2021-01-02' AS Date), 1, CAST(N'2021-03-08' AS Date), CAST(N'2021-04-08' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (13, N'09435344                                          ', CAST(N'2021-04-02' AS Date), 1, CAST(N'2021-07-08' AS Date), CAST(N'2021-05-11' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (14, N'18435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (15, N'08435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (16, N'17435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (17, N'07435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (19, N'50435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (20, N'31435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), CAST(N'2021-07-08' AS Date))
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (21, N'32435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-07-08' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (23, N'78435344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (24, N'14035344                                          ', CAST(N'2021-04-02' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (25, N'81435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (26, N'14535344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (27, N'91435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (28, N'90435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (29, N'67435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-09-02' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (30, N'65435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (31, N'69435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (32, N'60435344                                          ', CAST(N'2021-06-07' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (33, N'29435344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (35, N'99435344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (36, N'28435344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (38, N'14235344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (40, N'13035344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-10-10' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (41, N'63435344                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-12-11' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (42, N'17150000                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-12-11' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (43, N'17150072                                          ', CAST(N'2021-10-01' AS Date), 0, CAST(N'2021-12-11' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (44, N'17150073                                          ', CAST(N'2021-04-20' AS Date), 0, CAST(N'2021-12-11' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (45, N'13135344                                          ', CAST(N'2021-05-08' AS Date), 0, CAST(N'2021-12-11' AS Date), NULL)
INSERT [dbo].[ChiTiet_MuonTra] ([MaMuonTra], [MaSach], [NgayMuon], [DaTra], [NgayHanTra], [NgayTra]) VALUES (46, N'25435344                                          ', CAST(N'2021-05-08' AS Date), 1, CAST(N'2021-12-11' AS Date), CAST(N'2021-05-11' AS Date))
SET IDENTITY_INSERT [dbo].[ChiTiet_MuonTra] OFF
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (1, N'Thủ Thư')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (2, N'Quản Lý')
GO
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'1                                                 ', N'Giáo trình giải tích')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'11                                                ', N'Những ngày thơ ấu')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'12                                                ', N'SGK Giải tích 12')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'13                                                ', N'Đường lối quân sự ')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'15                                                ', N'Mới')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'2                                                 ', N'Toán rời rạc')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'3                                                 ', N'Vật lý đại cương')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'4                                                 ', N'Những nguyên lý cơ bản của chủ nghĩa mác lenin')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'5                                                 ', N'Tư tưởng Hồ Chí Minh')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'6                                                 ', N'Cuộc sống không giống cuộc đời')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'7                                                 ', N'Giải thuật và lập trình')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'8                                                 ', N'10 Lời khuyên khởi nghiệp')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'9                                                 ', N'Hiểu nghèo thoát nghèo')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'BT                                                ', N'Để luôn đạt điểm 10')
INSERT [dbo].[DauSach] ([MaDauSach], [TenDauSach]) VALUES (N'HFC#                                              ', N'Head First C#')
GO
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (1, N'Nguyễn Văn Anh', N'CNTT17', CAST(N'1999-01-01' AS Date), 0, N'Chưa có thông tin')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (2, N'Nguyễn Văn Chiều', N'CNTT16', CAST(N'1999-10-10' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (3, N'Nguyễn Thị Dung', N'KHMT17', CAST(N'1999-11-21' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (4, N'Nguyễn Văn Bá', N'CNTT16', CAST(N'1998-04-16' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (5, N'Lê Văn Dũng', N'KTPM17', CAST(N'1999-01-01' AS Date), 0, N'Chưa có thông tin')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (6, N'Lê Văn Việt', N'CNTT15', CAST(N'1997-12-12' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (7, N'Lê Thị Giang', N'KTPM17', CAST(N'1999-01-01' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (8, N'Lê Hoàng Hải', N'CNTT15', CAST(N'1998-05-04' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (9, N'Bùi Hoàng Ánh', N'KTPM15', CAST(N'1998-03-23' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (10, N'Bùi Hoàng Lam', N'CDT17', CAST(N'1998-07-07' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (11, N'Bùi Thị Kim', N'KTPM17', CAST(N'1997-05-06' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (12, N'Bùi Hoàng Quân', N'CDT17', CAST(N'1998-08-08' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (13, N'Bùi Thị Phượng', N'KHMT18', CAST(N'1999-04-01' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (14, N'Ngô Thị Trang', N'KHMT17', CAST(N'1999-05-01' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (15, N'Ngô Anh Dũng', N'CDT17', CAST(N'1999-11-11' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (16, N'Hoa Tất Thắng', N'Khoa CNTT', CAST(N'1979-02-03' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (17, N'Nguyễn Thị An', N'CDT17', CAST(N'1998-03-02' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (18, N'Nguyễn Văn Giang', N'Khoa CNTT', CAST(N'1980-12-12' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (19, N'Đinh Duy Hiếu', N'CNTT17', CAST(N'1998-10-11' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (20, N'Đào Trung Anh', N'CNTT17', CAST(N'1999-03-21' AS Date), NULL, NULL)
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (21, N'Bùi Khánh Huyền', N'KHMT17', CAST(N'2021-05-11' AS Date), 0, N'Đan Phượng')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [DonVi], [NgaySinh], [SDT], [QueQuan]) VALUES (22, N'Trần Thu Thủy', N'KHMT17', CAST(N'1999-02-10' AS Date), 0, N'Sơn La')
GO
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (0, N'Các nguyên tắc chung, Khoa học máy tính, và thông tin')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (1, N'Triết học và Tâm lý học')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (2, N'Tôn giáo học')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (3, N'Các khoa học xã hội')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (4, N'Ngôn ngữ học')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (5, N'Các khoa học tự nhiên')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (6, N'Công nghệ và khoa học ứng dụng')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (7, N'Nghệ thuật và tái tạo')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (8, N'Văn học')
INSERT [dbo].[GiaSach] ([MaGiaSach], [TenGiaSach]) VALUES (9, N'Địa lý và lịch sử')
GO
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (1, 1, 1)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (2, 3, 5)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (3, 3, 6)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (4, 3, 8)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (4, 3, 9)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (5, 4, 10)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (6, 4, 13)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (7, 5, 14)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (7, 5, 15)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (8, 6, 16)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (8, 6, 17)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (9, 7, 19)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (10, 7, 20)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (10, 7, 21)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (11, 2, 23)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (12, 2, 24)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (12, 8, 25)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (13, 8, 26)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (12, 8, 27)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (15, 8, 28)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (16, 8, 29)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (17, 9, 30)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (18, 9, 31)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (19, 10, 32)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (20, 10, 33)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (10, 3, 35)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (13, 2, 36)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (10, 3, 38)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (11, 3, 40)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (5, 2, 41)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (9, 3, 43)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (9, 3, 42)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (10, 3, 44)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (3, 3, 45)
INSERT [dbo].[MuonTra] ([MaDocGia], [MaNhanVien], [MaMuonTra]) VALUES (1, 3, 46)
GO
SET IDENTITY_INSERT [dbo].[NgonNgu] ON 

INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (1, N'Tiếng Việt')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (2, N'Tiếng Anh')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (3, N'Tiếng Nga')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (4, N'Tiếng Trung')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (5, N'Tiếng Pháp')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (6, N'Tiếng Đức')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (7, N'Tiếng Lào')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (8, N'Tiếng Campuchia')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (9, N'Tiếng Cuba')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (10, N'Tiếng Hàn')
INSERT [dbo].[NgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (11, N'')
SET IDENTITY_INSERT [dbo].[NgonNgu] OFF
GO
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'1                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'1                                                 ', 2)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'3                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'5                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'6                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'7                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'8                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'9                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'11                                                ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'12                                                ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'13                                                ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'8                                                 ', 2)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'9                                                 ', 2)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'HFC#                                              ', 2)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'HFC#                                              ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'4                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'4                                                 ', 3)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'BT                                                ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'BT                                                ', 2)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'15                                                ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'2                                                 ', 1)
INSERT [dbo].[NgonNgu_DauSach] ([MaDauSach], [MaNgonNgu]) VALUES (N'2                                                 ', 2)
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (1, N'Nguyễn Thị Bích Ngọc', CAST(N'1999-01-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (2, N'Bùi Trung Tú', CAST(N'1998-06-30' AS Date), 987343342, N'Chưa có thông tin                                                                                                                                                                                       ', 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (3, N'Trần Tuấn Anh', CAST(N'1998-01-01' AS Date), NULL, NULL, 2)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (4, N'Phòng Văn Huỳnh', CAST(N'1997-04-03' AS Date), 0, N'Chưa có thông tin                                                                                                                                                                                       ', 2)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (5, N'Lê Văn Hào', CAST(N'1997-02-03' AS Date), NULL, NULL, 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (6, N'Phạm Văn Đình', CAST(N'1996-05-05' AS Date), 0, N'Chưa có thông tin                                                                                                                                                                                       ', 2)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (7, N'Lê Văn Thắng', CAST(N'1996-03-03' AS Date), NULL, NULL, 2)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (8, N'Đinh Như Hà', CAST(N'2000-01-11' AS Date), 0, N'hanhudinh@gmail.com                                                                                                                                                                                     ', 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (9, N'Bùi Trung Quang', CAST(N'1995-10-10' AS Date), NULL, NULL, 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (10, N'Trần Văn Hà', CAST(N'1999-02-20' AS Date), NULL, NULL, 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (11, N'Bùi Khánh Huyền', CAST(N'2021-04-20' AS Date), 1234545, N'buikhanhhuyena4@gmail.com                                                                                                                                                                               ', 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [NgaySinh], [SDT], [Email], [MaChucVu]) VALUES (12, N'Bùi ', CAST(N'2021-05-06' AS Date), 2145324, N'bkh                                                                                                                                                                                                     ', 1)
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (1, N'Tri thức', NULL, NULL, N'trithuc@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (2, N'Giáo dục', NULL, NULL, N'giaoduc@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (3, N'Đại học sư phạm', NULL, NULL, N'dhsupham@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (4, N'Đại học quốc gia', NULL, NULL, N'dhquocgia@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (5, N'Công an nhân dân', NULL, NULL, N'congannhandan@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (6, N'Thanh niên', NULL, NULL, N'thanhnien@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (7, N'Kim đồng', NULL, NULL, N'kimdong@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (8, N'Quân đội', NULL, NULL, N'quandoi@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (9, N'Lao động xã hội', NULL, NULL, N'laodongxahoi@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (10, N'Y học', NULL, NULL, N'yhoc@gmail.com')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (11, N'Nhà xuất bản trẻ', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (12, N'Simon & Schuster', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (13, N'Gia Đình', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (1013, N'Đại học quốc gia TP Hồ Chí Minh', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (1014, N'O''Reilly', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Email]) VALUES (1015, N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'1                                                 ', 1013)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'2                                                 ', 2)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'3                                                 ', 2)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'4                                                 ', 1)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'5                                                 ', 5)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'4                                                 ', 2)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'7                                                 ', 3)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'8                                                 ', 6)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'9                                                 ', 1)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'HFC#                                              ', 1014)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'11                                                ', 7)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'12                                                ', 2)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'13                                                ', 8)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'BT                                                ', 7)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'6                                                 ', 6)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'6                                                 ', 7)
INSERT [dbo].[NXB_DauSach] ([MaDauSach], [MaNXB]) VALUES (N'15                                                ', 7)
GO
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'04435344                                          ', N'1                                                 ', 1, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1998-01-20' AS Date), 55, N'04435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'05435344                                          ', N'1                                                 ', 1, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1998-01-01' AS Date), 66, N'05435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'06435344                                          ', N'1                                                 ', 2, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 77, N'06435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'07435344                                          ', N'1                                                 ', 2, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 88, N'07435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'08435344                                          ', N'1                                                 ', 2, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 99, N'08435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'09435344                                          ', N'1                                                 ', 2, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 110, N'09435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10035344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 3, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10135344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 4, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10235344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 5, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10335344                                          ', N'7                                                 ', 1, 1, N'Mới', 890, CAST(N'2020-04-20' AS Date), CAST(N'2008-01-01' AS Date), 6, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10535344                                          ', N'7                                                 ', 1, 1, N'Mới', 890, CAST(N'2020-04-20' AS Date), CAST(N'2008-01-01' AS Date), 8, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10635344                                          ', N'7                                                 ', 1, 1, N'Mới', 890, CAST(N'2020-04-20' AS Date), CAST(N'2008-01-01' AS Date), 9, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10735344                                          ', N'8                                                 ', 1, 1, N'Mới', 290, CAST(N'2020-04-20' AS Date), CAST(N'2012-01-01' AS Date), 10, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10835344                                          ', N'8                                                 ', 1, 1, N'Mới', 290, CAST(N'2020-04-20' AS Date), CAST(N'2012-01-01' AS Date), 11, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'10935344                                          ', N'8                                                 ', 1, 1, N'Mới', 290, CAST(N'2020-04-20' AS Date), CAST(N'2012-01-01' AS Date), 12, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'11035344                                          ', N'9                                                 ', 1, 1, N'Mới', 398, CAST(N'2020-04-20' AS Date), CAST(N'2018-01-01' AS Date), 14, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'11135344                                          ', N'9                                                 ', 1, 1, N'Mới', 398, CAST(N'2020-04-20' AS Date), CAST(N'2018-01-01' AS Date), 15, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'11235344                                          ', N'9                                                 ', 1, 1, N'Mới', 398, CAST(N'2020-04-20' AS Date), CAST(N'2018-01-01' AS Date), 16, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'11335344                                          ', N'9                                                 ', 1, 1, N'Mới', 398, CAST(N'2020-04-20' AS Date), CAST(N'2018-01-01' AS Date), 17, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'12735344                                          ', N'11                                                ', 1, 1, N'Cũ', 658, CAST(N'2020-04-20' AS Date), CAST(N'1960-01-01' AS Date), 126, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'12835344                                          ', N'12                                                ', 1, 1, N'Cũ', 210, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 127, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'12935344                                          ', N'12                                                ', 1, 2, N'Mới', 220, CAST(N'2020-04-20' AS Date), CAST(N'2019-01-01' AS Date), 128, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13035344                                          ', N'12                                                ', 1, 1, N'Cũ', 210, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 130, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13135344                                          ', N'12                                                ', 1, 2, N'Mới', 220, CAST(N'2020-04-20' AS Date), CAST(N'2019-01-01' AS Date), 131, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13235344                                          ', N'12                                                ', 2, 1, N'Mới', 320, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 132, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13335344                                          ', N'12                                                ', 2, 2, N'Mới', 329, CAST(N'2020-04-20' AS Date), CAST(N'2017-01-01' AS Date), 133, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13535344                                          ', N'12                                                ', 2, 2, N'Mới', 329, CAST(N'2020-04-20' AS Date), CAST(N'2017-01-01' AS Date), 135, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13635344                                          ', N'13                                                ', 1, 1, N'Cũ', 410, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 136, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13735344                                          ', N'13                                                ', 1, 2, N'Mới', 500, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 137, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13835344                                          ', N'13                                                ', 1, 1, N'Cũ', 410, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 138, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'13935344                                          ', N'13                                                ', 1, 2, N'Mới', 500, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 139, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'14035344                                          ', N'13                                                ', 1, 1, N'Cũ', 410, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 141, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'14135344                                          ', N'13                                                ', 1, 2, N'Mới', 500, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 142, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'14235344                                          ', N'13                                                ', 1, 1, N'Cũ', 410, CAST(N'2020-04-20' AS Date), CAST(N'1999-01-01' AS Date), 143, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'14335344                                          ', N'13                                                ', 1, 2, N'Mới', 500, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 144, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'14535344                                          ', N'13                                                ', 1, 2, N'Mới', 500, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 146, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'15435344                                          ', N'1                                                 ', 1, 2, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 28, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'16435344                                          ', N'1                                                 ', 2, 2, N'Cũ', 270, CAST(N'2020-04-20' AS Date), CAST(N'2001-01-01' AS Date), 29, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'17150000                                          ', N'BT                                                ', 1, 2, N'Mới', 110, CAST(N'2020-06-04' AS Date), CAST(N'2020-12-15' AS Date), 206, N'17150000                                          .jpg')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'17150021                                          ', N'BT                                                ', 1, 2, N'Mới', 110, CAST(N'2020-06-04' AS Date), CAST(N'2019-12-15' AS Date), 207, N'17150021                                          .jpg')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'17150072                                          ', N'BT                                                ', 2, 1, N'Mới', 150, CAST(N'2020-06-01' AS Date), CAST(N'2020-01-30' AS Date), 204, N'17150072                                          .jpg')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'17150073                                          ', N'BT                                                ', 1, 1, N'Mới', 10, CAST(N'2020-06-02' AS Date), CAST(N'2020-01-06' AS Date), 205, N'17150073                                          .jpg')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'17435344                                          ', N'1                                                 ', 2, 2, N'Cũ', 270, CAST(N'2020-04-20' AS Date), CAST(N'2001-01-01' AS Date), 30, N'17435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'18435344                                          ', N'1                                                 ', 2, 2, N'Cũ', 270, CAST(N'2020-04-20' AS Date), CAST(N'2001-01-01' AS Date), 31, N'18435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'19435344                                          ', N'1                                                 ', 2, 2, N'Cũ', 270, CAST(N'2020-04-20' AS Date), CAST(N'2001-01-01' AS Date), 32, N'19435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'20435344                                          ', N'1                                                 ', 2, 2, N'Cũ', 270, CAST(N'2020-04-20' AS Date), CAST(N'2001-01-01' AS Date), 34, N'20435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'21435344                                          ', N'1                                                 ', 1, 3, N'Mới', 240, CAST(N'2020-04-20' AS Date), CAST(N'2003-01-01' AS Date), 35, N'21435344                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'22435344                                          ', N'1                                                 ', 1, 3, N'Mới', 240, CAST(N'2020-04-20' AS Date), CAST(N'2003-01-01' AS Date), 36, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'23435344                                          ', N'1                                                 ', 1, 3, N'Mới', 240, CAST(N'2020-04-20' AS Date), CAST(N'2003-01-01' AS Date), 37, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'24435344                                          ', N'1                                                 ', 1, 3, N'Mới', 240, CAST(N'2020-04-20' AS Date), CAST(N'2003-01-01' AS Date), 38, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'25435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 39, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'26435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 40, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'27435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 41, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'28435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 42, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'29435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 43, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'30435344                                          ', N'1                                                 ', 2, 3, N'Mới', 273, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 45, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'31435344                                          ', N'2                                                 ', 1, 1, N'Cũ', 400, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 46, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'32132141                                          ', N'1                                                 ', 1, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1998-01-01' AS Date), 1, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'32435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 47, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'33435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 48, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'34435344                                          ', N'2                                                 ', 1, 1, N'Cũ', 400, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 49, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'35435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 50, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'36435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 51, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'37435344                                          ', N'2                                                 ', 1, 1, N'Cũ', 400, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 52, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'38435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 53, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'39435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 54, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'40435344                                          ', N'2                                                 ', 1, 1, N'Cũ', 400, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 56, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'41435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 57, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'42435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 58, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'44435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 60, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'45435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 61, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'46435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 62, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'47435344                                          ', N'2                                                 ', 1, 2, N'Mới', 411, CAST(N'2020-04-20' AS Date), CAST(N'2005-01-01' AS Date), 63, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'48435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 64, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'49435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 65, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'50435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 67, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'51435344                                          ', N'2                                                 ', 1, 3, N'Mới', 410, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 68, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'52435344                                          ', N'3                                                 ', 1, 1, N'Cũ', 230, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 69, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'53435344                                          ', N'3                                                 ', 1, 2, N'Cũ', 241, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 70, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'54435344                                          ', N'3                                                 ', 1, 3, N'Mới', 250, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 71, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'55435344                                          ', N'3                                                 ', 1, 1, N'Cũ', 230, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 72, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'56435344                                          ', N'3                                                 ', 1, 2, N'Cũ', 241, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 73, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'57435344                                          ', N'3                                                 ', 1, 3, N'Mới', 250, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 74, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'58435344                                          ', N'3                                                 ', 1, 1, N'Cũ', 230, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 75, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'59435344                                          ', N'3                                                 ', 1, 2, N'Cũ', 241, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 76, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'60435344                                          ', N'3                                                 ', 1, 3, N'Mới', 250, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 78, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'61435344                                          ', N'3                                                 ', 1, 2, N'Cũ', 241, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 79, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'62435344                                          ', N'3                                                 ', 1, 3, N'Mới', 250, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 80, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'63435344                                          ', N'3                                                 ', 1, 3, N'Mới', 250, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 81, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'64435344                                          ', N'3                                                 ', 2, 1, N'Cũ', 300, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 82, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'65435344                                          ', N'3                                                 ', 2, 2, N'Mới', 311, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 83, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'66435344                                          ', N'3                                                 ', 2, 3, N'Mới', 325, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 84, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'67435344                                          ', N'3                                                 ', 2, 1, N'Cũ', 300, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 85, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'69435344                                          ', N'3                                                 ', 2, 3, N'Mới', 325, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 87, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'70435344                                          ', N'3                                                 ', 2, 1, N'Cũ', 300, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 89, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'72138459                                          ', N'1                                                 ', 1, 1, N'Cũ', 250, CAST(N'2020-04-20' AS Date), CAST(N'1998-01-01' AS Date), 33, N'72138459                                          .png')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'72435344                                          ', N'3                                                 ', 2, 3, N'Mới', 325, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 91, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'73435344                                          ', N'3                                                 ', 2, 2, N'Mới', 311, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 92, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'74435344                                          ', N'3                                                 ', 2, 2, N'Mới', 311, CAST(N'2020-04-20' AS Date), CAST(N'2002-01-01' AS Date), 93, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'75435344                                          ', N'3                                                 ', 2, 3, N'Mới', 325, CAST(N'2020-04-20' AS Date), CAST(N'2006-01-01' AS Date), 94, N'')
GO
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'76435344                                          ', N'4                                                 ', 1, 1, N'Cũ', 500, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 95, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'77435344                                          ', N'4                                                 ', 1, 2, N'Cũ', 541, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 96, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'78435344                                          ', N'4                                                 ', 1, 3, N'Mới', 550, CAST(N'2020-04-20' AS Date), CAST(N'2004-01-01' AS Date), 97, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'79435344                                          ', N'4                                                 ', 1, 1, N'Cũ', 500, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 98, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'80435344                                          ', N'4                                                 ', 1, 2, N'Cũ', 541, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 100, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'81435344                                          ', N'4                                                 ', 1, 3, N'Mới', 550, CAST(N'2020-04-20' AS Date), CAST(N'2004-01-01' AS Date), 101, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'82435344                                          ', N'4                                                 ', 1, 1, N'Cũ', 500, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 102, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'83435344                                          ', N'4                                                 ', 1, 2, N'Cũ', 541, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 103, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'84435344                                          ', N'4                                                 ', 1, 3, N'Mới', 550, CAST(N'2020-04-20' AS Date), CAST(N'2004-01-01' AS Date), 104, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'85435344                                          ', N'4                                                 ', 1, 1, N'Cũ', 500, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 105, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'86435344                                          ', N'4                                                 ', 1, 2, N'Cũ', 541, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 106, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'87435344                                          ', N'4                                                 ', 1, 3, N'Mới', 550, CAST(N'2020-04-20' AS Date), CAST(N'2004-01-01' AS Date), 107, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'88435344                                          ', N'4                                                 ', 1, 1, N'Cũ', 500, CAST(N'2020-04-20' AS Date), CAST(N'1996-01-01' AS Date), 108, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'89435344                                          ', N'4                                                 ', 1, 2, N'Cũ', 541, CAST(N'2020-04-20' AS Date), CAST(N'2000-01-01' AS Date), 109, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'90435344                                          ', N'4                                                 ', 1, 3, N'Mới', 550, CAST(N'2020-04-20' AS Date), CAST(N'2004-01-01' AS Date), 111, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'91435344                                          ', N'5                                                 ', 1, 1, N'Mới', 600, CAST(N'2020-04-20' AS Date), CAST(N'1980-01-01' AS Date), 112, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'92435344                                          ', N'5                                                 ', 1, 2, N'Mới', 620, CAST(N'2020-04-20' AS Date), CAST(N'2090-01-01' AS Date), 113, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'93435344                                          ', N'5                                                 ', 1, 1, N'Mới', 600, CAST(N'2020-04-20' AS Date), CAST(N'1980-01-01' AS Date), 114, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'94435344                                          ', N'5                                                 ', 1, 2, N'Mới', 620, CAST(N'2020-04-20' AS Date), CAST(N'2090-01-01' AS Date), 115, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'95435344                                          ', N'5                                                 ', 1, 1, N'Mới', 600, CAST(N'2020-04-20' AS Date), CAST(N'1980-01-01' AS Date), 116, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'96435344                                          ', N'5                                                 ', 1, 2, N'Mới', 620, CAST(N'2020-04-20' AS Date), CAST(N'2090-01-01' AS Date), 117, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'97435344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 118, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'98435344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 119, N'')
INSERT [dbo].[Sach] ([MaSach], [MaDauSach], [Tap], [LanTaiBan], [TinhTrang], [SoTrang], [NgayNhap], [NamXuatBan], [MaViTri], [HinhAnh]) VALUES (N'99435344                                          ', N'6                                                 ', 1, 1, N'Mới', 150, CAST(N'2020-04-20' AS Date), CAST(N'2010-01-01' AS Date), 120, N'')
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1, N'Hồ Ngọc Đại', CAST(N'1936-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (2, N'Kenneth H. Rosen', CAST(N'1960-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (3, N'Nguyễn Quang Hậu', CAST(N'1960-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (4, N'Trần Quang Nhiếp', CAST(N'1954-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (5, N'Nguyễn Hoàng Hải', CAST(N'1963-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (6, N'Lê Minh Hoàng', CAST(N'1969-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (7, N'Caspian Woods', CAST(N'1970-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (8, N'Donald Trump', CAST(N'1946-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (9, N'Tô Hoài', CAST(N'1920-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (10, N'Nguyên Hồng', CAST(N'1918-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (11, N'Vũ Quang Hiến', CAST(N'1936-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (12, N'Trần Văn Hạo', CAST(N'1967-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (13, N'Vũ Tuấn', CAST(N'1970-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (14, N'Lê Thị Thiên Hương', CAST(N'1969-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (15, N'Hồ Quang Hiếu', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (16, N'Trần Hạo Nam', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (17, N'BùiTrungTú', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (18, N'Gordon W.Green Jr', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1017, N'Nguyễn Đình Huy', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1018, N'Nguyễn Bá Thi', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1019, N'Andrew Stellman', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1020, N'Jennifer Greene', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1021, N'Nguyễn Khuyến', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh]) VALUES (1022, N'', NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'1                                                 ', 1017)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'1                                                 ', 1018)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'3                                                 ', 3)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'5                                                 ', 4)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'6                                                 ', 5)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'7                                                 ', 6)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'8                                                 ', 7)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'9                                                 ', 8)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'11                                                ', 10)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'12                                                ', 1)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'13                                                ', 11)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'12                                                ', 12)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'12                                                ', 13)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'12                                                ', 14)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'HFC#                                              ', 1019)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'HFC#                                              ', 1020)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'4                                                 ', 1)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'BT                                                ', 18)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'15                                                ', 1021)
INSERT [dbo].[TacGia_DauSach] ([MaDauSach], [MaTacGia]) VALUES (N'2                                                 ', 2)
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNhanVien]) VALUES (N'bkh                                                                                                 ', N'123                                                                                                 ', 1)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNhanVien]) VALUES (N'ttt                                                                                                 ', N'123                                                                                                 ', 2)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Toán học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Tin học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Vật lý')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Triết học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Lịch sử - Chính trị')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (6, N'Tâm lý - Kỹ năng sống')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (7, N'Kinh tế')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (8, N'Hồi ký')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (9, N'Văn hóa - Tôn giáo')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (10, N'Văn học - Nghệ thuật')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (14, N'Tự lực')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (17, N'Văn học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (18, N'')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'1                                                 ', 1)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'2                                                 ', 1)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'3                                                 ', 3)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'5                                                 ', 5)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'6                                                 ', 6)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'7                                                 ', 1)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'7                                                 ', 2)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'8                                                 ', 7)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'9                                                 ', 7)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'11                                                ', 8)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'12                                                ', 1)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'13                                                ', 5)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'HFC#                                              ', 2)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'4                                                 ', 4)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'BT                                                ', 14)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'15                                                ', 17)
INSERT [dbo].[TheLoai_DauSach] ([MaDauSach], [MaTheLoai]) VALUES (N'2                                                 ', 2)
GO
SET IDENTITY_INSERT [dbo].[ViTriCuThe] ON 

INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (1, 1, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (2, 1, 2, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (3, 1, 3, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (4, 1, 4, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (5, 1, 5, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (6, 2, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (7, 2, 2, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (8, 2, 3, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (9, 2, 4, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (10, 2, 5, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (11, 3, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (12, 3, 2, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (13, 3, 3, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (14, 3, 4, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (15, 3, 5, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (16, 4, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (17, 4, 2, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (18, 4, 3, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (19, 4, 4, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (20, 4, 5, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (21, 5, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (22, 5, 2, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (23, 5, 3, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (24, 5, 4, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (25, 5, 5, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (26, 1, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (27, 1, 2, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (28, 1, 3, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (29, 1, 4, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (30, 1, 5, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (31, 2, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (32, 2, 2, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (33, 2, 3, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (34, 2, 4, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (35, 2, 5, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (36, 3, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (37, 3, 2, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (38, 3, 3, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (39, 3, 4, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (40, 3, 5, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (41, 4, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (42, 4, 2, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (43, 4, 3, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (44, 4, 4, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (45, 4, 5, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (46, 5, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (47, 5, 2, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (48, 5, 3, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (49, 5, 4, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (50, 5, 5, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (51, 1, 1, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (52, 1, 2, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (53, 1, 3, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (54, 1, 4, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (55, 1, 5, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (56, 2, 1, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (57, 2, 2, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (58, 2, 3, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (59, 2, 4, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (60, 2, 5, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (61, 3, 1, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (62, 3, 2, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (63, 3, 3, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (64, 3, 4, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (65, 3, 5, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (66, 4, 1, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (67, 4, 2, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (68, 4, 3, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (69, 4, 4, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (70, 4, 5, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (71, 5, 1, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (72, 5, 2, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (73, 5, 3, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (74, 5, 4, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (75, 5, 5, 2)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (76, 1, 1, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (77, 1, 2, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (78, 1, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (79, 1, 4, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (80, 1, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (81, 2, 1, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (82, 2, 2, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (83, 2, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (84, 2, 4, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (85, 2, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (86, 3, 1, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (87, 3, 2, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (88, 3, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (89, 3, 4, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (90, 3, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (91, 4, 1, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (92, 4, 2, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (93, 4, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (94, 4, 4, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (95, 4, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (96, 5, 1, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (97, 5, 2, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (98, 5, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (99, 5, 4, 3)
GO
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (100, 5, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (101, 1, 1, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (102, 1, 2, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (103, 1, 3, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (104, 1, 4, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (105, 1, 5, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (106, 2, 1, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (107, 2, 2, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (108, 2, 3, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (109, 2, 4, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (110, 2, 5, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (111, 3, 1, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (112, 3, 2, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (113, 3, 3, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (114, 3, 4, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (115, 3, 5, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (116, 4, 1, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (117, 4, 2, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (118, 4, 3, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (119, 4, 4, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (120, 4, 5, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (121, 5, 1, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (122, 5, 2, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (123, 5, 3, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (124, 5, 4, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (125, 5, 5, 4)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (126, 1, 1, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (127, 1, 2, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (128, 1, 3, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (129, 1, 4, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (130, 1, 5, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (131, 2, 1, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (132, 2, 2, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (133, 2, 3, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (134, 2, 4, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (135, 2, 5, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (136, 3, 1, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (137, 3, 2, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (138, 3, 3, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (139, 3, 4, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (140, 3, 5, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (141, 4, 1, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (142, 4, 2, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (143, 4, 3, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (144, 4, 4, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (145, 4, 5, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (146, 5, 1, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (147, 5, 2, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (148, 5, 3, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (149, 5, 4, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (150, 5, 5, 5)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (151, 1, 1, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (152, 1, 2, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (153, 1, 3, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (154, 1, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (155, 1, 5, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (156, 2, 1, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (157, 2, 2, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (158, 2, 3, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (159, 2, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (160, 2, 5, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (161, 3, 1, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (162, 3, 2, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (163, 3, 3, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (164, 3, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (165, 3, 5, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (166, 4, 1, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (167, 4, 2, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (168, 4, 3, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (169, 4, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (170, 4, 5, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (171, 5, 1, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (172, 5, 2, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (173, 5, 3, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (174, 5, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (175, 5, 5, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (176, 1, 1, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (177, 1, 2, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (178, 1, 3, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (179, 1, 4, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (180, 1, 5, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (181, 2, 1, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (182, 2, 2, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (183, 2, 3, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (184, 2, 4, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (185, 2, 5, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (186, 3, 1, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (187, 3, 2, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (188, 3, 3, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (189, 3, 4, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (190, 3, 5, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (191, 4, 1, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (192, 4, 2, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (193, 4, 3, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (194, 4, 4, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (195, 4, 5, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (196, 5, 1, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (197, 5, 2, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (198, 5, 3, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (199, 5, 4, 7)
GO
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (200, 5, 5, 7)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (201, 3, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (202, 3, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (203, 3, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (204, 3, 6, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (205, 3, 3, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (206, 2, 9, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (207, 3, 5, 3)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (1205, 3, 4, 6)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (1206, 1, 1, 0)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (1207, 1, 1, 1)
INSERT [dbo].[ViTriCuThe] ([MaViTri], [Tang], [Ngan], [MaGiaSach]) VALUES (1208, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[ViTriCuThe] OFF
GO
ALTER TABLE [dbo].[ChiTiet_MuonTra] ADD  CONSTRAINT [DF_ChiTiet_MuonTra_NgayMuon]  DEFAULT (getdate()) FOR [NgayMuon]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_NgayNhap]  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[ChiTiet_MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_MuonTra_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTiet_MuonTra] CHECK CONSTRAINT [FK_ChiTiet_MuonTra_Sach]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_ChiTiet_MuonTra] FOREIGN KEY([MaMuonTra])
REFERENCES [dbo].[ChiTiet_MuonTra] ([MaMuonTra])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_ChiTiet_MuonTra]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_DocGia] FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DocGia] ([MaDocGia])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_DocGia]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_NhanVien]
GO
ALTER TABLE [dbo].[NgonNgu_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_DauSach_DauSach] FOREIGN KEY([MaDauSach])
REFERENCES [dbo].[DauSach] ([MaDauSach])
GO
ALTER TABLE [dbo].[NgonNgu_DauSach] CHECK CONSTRAINT [FK_NgonNgu_DauSach_DauSach]
GO
ALTER TABLE [dbo].[NgonNgu_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_NgonNgu_DauSach_NgonNgu] FOREIGN KEY([MaNgonNgu])
REFERENCES [dbo].[NgonNgu] ([MaNgonNgu])
GO
ALTER TABLE [dbo].[NgonNgu_DauSach] CHECK CONSTRAINT [FK_NgonNgu_DauSach_NgonNgu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NXB_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_NXB_DauSach_DauSach] FOREIGN KEY([MaDauSach])
REFERENCES [dbo].[DauSach] ([MaDauSach])
GO
ALTER TABLE [dbo].[NXB_DauSach] CHECK CONSTRAINT [FK_NXB_DauSach_DauSach]
GO
ALTER TABLE [dbo].[NXB_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_NXB_DauSach_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[NXB_DauSach] CHECK CONSTRAINT [FK_NXB_DauSach_NhaXuatBan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_DauSach] FOREIGN KEY([MaDauSach])
REFERENCES [dbo].[DauSach] ([MaDauSach])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_DauSach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ViTriCuThe] FOREIGN KEY([MaViTri])
REFERENCES [dbo].[ViTriCuThe] ([MaViTri])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ViTriCuThe]
GO
ALTER TABLE [dbo].[TacGia_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_TacGia_DauSach_DauSach] FOREIGN KEY([MaDauSach])
REFERENCES [dbo].[DauSach] ([MaDauSach])
GO
ALTER TABLE [dbo].[TacGia_DauSach] CHECK CONSTRAINT [FK_TacGia_DauSach_DauSach]
GO
ALTER TABLE [dbo].[TacGia_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_TacGia_DauSach_TacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[TacGia_DauSach] CHECK CONSTRAINT [FK_TacGia_DauSach_TacGia]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[TheLoai_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_TheLoai_DauSach_DauSach] FOREIGN KEY([MaDauSach])
REFERENCES [dbo].[DauSach] ([MaDauSach])
GO
ALTER TABLE [dbo].[TheLoai_DauSach] CHECK CONSTRAINT [FK_TheLoai_DauSach_DauSach]
GO
ALTER TABLE [dbo].[TheLoai_DauSach]  WITH CHECK ADD  CONSTRAINT [FK_TheLoai_DauSach_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[TheLoai_DauSach] CHECK CONSTRAINT [FK_TheLoai_DauSach_TheLoai]
GO
ALTER TABLE [dbo].[ViTriCuThe]  WITH CHECK ADD  CONSTRAINT [FK_ViTriCuThe_GiaSach] FOREIGN KEY([MaGiaSach])
REFERENCES [dbo].[GiaSach] ([MaGiaSach])
GO
ALTER TABLE [dbo].[ViTriCuThe] CHECK CONSTRAINT [FK_ViTriCuThe_GiaSach]
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH CHECK ADD  CONSTRAINT [FK_XuLyViPham_DocGia1] FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DocGia] ([MaDocGia])
GO
ALTER TABLE [dbo].[XuLyViPham] CHECK CONSTRAINT [FK_XuLyViPham_DocGia1]
GO
/****** Object:  StoredProcedure [dbo].[ChoMuonSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ChoMuonSach](
	@masach nchar(50),@madocgia int,@manhanvien int, @ngaytra date
)as begin
	-- kiểm tra tính chính xác của mã độc giả
	if not exists (select * from DocGia where MaDocGia = @madocgia)		
		return 0	
	-- kiểm tra tính chính xác của mã sách
	else if not exists (select * from Sach where MaSach = @masach)	
		return 0
	-- không thể cho mượn cuốn sách đang có người mượn
	else if  exists (select * from ChiTiet_MuonTra where MaSach = @masach and DaTra = 0 )
		return 0
	--else if(  DATEDIFF(day,@ngayhantra,@ngaymuon) > 0)
	else
	begin
		-- thêm vào bảng chi tiết mượn trả trước	
		insert into ChiTiet_MuonTra(MaSach,DaTra,NgayHanTra) values(@masach,0,@ngaytra)
		-- sau đó thêm vào bảng mượn trả
		insert into MuonTra(MaDocGia,MaNhanVien,MaMuonTra) values(
		@madocgia,@manhanvien,(select Max(MaMuonTra) from ChiTiet_MuonTra)
		)
	end	
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteDL]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteDL]
@MaNhanVien int
as 
begin
delete NhanVien
where MaNhanVien = @MaNhanVien
end
GO
/****** Object:  StoredProcedure [dbo].[InsertDL]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertDL]
@MaNhanVien int,
@HoTen nvarchar(200),
@NgaySinh datetime,
@SDT int,
@email nchar(200),
@MaChucVu int
as
begin
	if not exists (select * from NhanVien where MaNhanVien = @MaNhanVien)	
		insert into NhanVien(MaNhanVien, HoTen, NgaySinh, SDT, Email, MaChucVu)
		values (@MaNhanVien, @HoTen, @NgaySinh, @SDT, @email, @MaChucVu)
	else 
		return 0
end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.TaiKhoan WHERE TenDangNhap = @userName AND MatKhau = @passWord
END
GO
/****** Object:  StoredProcedure [dbo].[LuuTru]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LuuTru]
as
select * from NhanVien
GO
/****** Object:  StoredProcedure [dbo].[PR_XoaTaiKhoan]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_XoaTaiKhoan](@maNhanVien INT)
AS 
BEGIN
	IF EXISTS (SELECT * FROM TaiKhoan WHERE MaNhanVien=@maNhanVien)
	BEGIN
		DELETE FROM TaiKhoan WHERE MaNhanVien=@maNhanVien;
		PRINT N'Delete successfully'
	END
	ELSE
		PRINT N'This account doesnt exist'
END
GO
/****** Object:  StoredProcedure [dbo].[SuaDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SuaDauSach](
	@madausach nchar(50),@tendausach nvarchar(500),@tacgia nvarchar(500),
	@theloai nvarchar(500),@NXB nvarchar(500),@ngonngu nvarchar(500)
)as begin
	update DauSach set TenDauSach = @tendausach where MaDauSach = @madausach
	delete from TacGia_DauSach where MaDauSach = @madausach
	exec ThemTacGia_DauSach @MaDauSach = @madausach,@strTacGia = @tacgia
	delete from TheLoai_DauSach where MaDauSach = @madausach
	exec ThemTheLoai_DauSach @MaDauSach = @madausach,@strTheLoai = @theloai
	delete from NXB_DauSach where MaDauSach = @madausach
	exec ThemNXB_DauSach @MaDauSach = @madausach,@strNXB = @NXB
	delete from NgonNgu_DauSach where MaDauSach = @madausach
	exec ThemNgonNgu_DauSach @MaDauSach = @madausach,@strNgonNgu = @ngonngu
end
GO
/****** Object:  StoredProcedure [dbo].[suadocgia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[suadocgia] (@maDocGia int , @tenDocGia nvarchar(200), @donVi nvarchar(200), 
						@ngaySinh date, @sdt int, @queQuan nvarchar(100))
AS BEGIN 
	UPDATE DocGia
	SET 
		TenDocGia = @tenDocGia,
		DonVi = @donVi,
		NgaySinh = @ngaySinh,
		SDT = @sdt,
		QueQuan = @queQuan
	WHERE MaDocGia = @maDocGia

END
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinMuonTra]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaThongTinMuonTra](
	@mamuontra int,@hanmuon datetime,@masach nchar(50)
)
as begin
	--kiểm tra tính chính xác của mã sách
	if not exists (select * from Sach where MaSach = @masach)	
		return 0
	else
		update ChiTiet_MuonTra set MaSach = @masach, NgayTra = @hanmuon where MaMuonTra = @mamuontra
end
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SuaThongTinSach](
	@masach nchar(50),@tap int,@lantaiban int,@sotrang int,
	@namxuatban datetime,@tinhtrang nvarchar(200),
	@giasach int,@tang int,@ngan int
) as begin
	update ViTriCuThe set MaGiaSach = @giasach,Tang = @tang,Ngan = @ngan
			where MaViTri = (select MaViTri from Sach where MaSach = @masach)
	update Sach set Tap = @tap,LanTaiBan =@lantaiban,SoTrang = @sotrang,
			NamXuatBan = @namxuatban,TinhTrang = @tinhtrang
		where MaSach = @masach
end
GO
/****** Object:  StoredProcedure [dbo].[ThemDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemDauSach] (
	@madausach nchar(50), @tendausach nvarchar(500),@tacgia nvarchar(500),@NXB nvarchar(500),
	@theloai nvarchar(500),@ngonngu nvarchar(500)
)as begin
	if not exists (select * from DauSach where MaDauSach = @madausach)
	begin
		insert into DauSach(MaDauSach,TenDauSach) values (@madausach,@tendausach)
		-- kết nối đầu sách với các bảng tác giả, thể loại, NXB, Ngôn ngữ
		exec ThemTacGia_DauSach @madausach,@tacgia
		exec ThemTheLoai_DauSach @madausach,@theloai
		exec ThemNXB_DauSach @madausach,@NXB
		exec ThemNgonNgu_DauSach @madausach,@ngonngu
	end
	else 
		return 0
end
GO
/****** Object:  StoredProcedure [dbo].[themDocGia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[themDocGia] (@maDocGia int , @tenDocGia nvarchar(200), @donVi nvarchar(200), 
						@ngaySinh date, @sdt int, @queQuan nvarchar(100))
AS BEGIN 
	if not exists (select * from DocGia where MaDocGia = @madocgia)
		INSERT INTO DocGia(MaDocGia,TenDocGia,DonVi,NgaySinh,SDT,QueQuan)
		VALUES(@maDocGia,@tenDocGia,@donVi,@ngaySinh,@sdt,@queQuan)
	else 
		return 0
END
GO
/****** Object:  StoredProcedure [dbo].[ThemNgonNgu_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemNgonNgu_DauSach](@MaDauSach nchar(50), @strNgonNgu nvarchar(500))
as begin
	set @strNgonNgu =@strNgonNgu + ','
	while (CHARINDEX(',',@strNgonNgu) > 0) -- có nhiều tác giả, cắt từng tên theo dấu ','
	begin
		declare @tenngonngu nvarchar(500)
		set @tenngonngu = LEFT(@strNgonNgu,CHARINDEX(',',@strNgonNgu)-1)
		set @tenngonngu = Rtrim(Ltrim(@tenngonngu))
		if exists (select * from NgonNgu where LOWER(TenNgonNgu) = LOWER(@tenngonngu))
		begin
			insert into NgonNgu_DauSach(MaDauSach,MaNgonNgu) 
			values (
				@MaDauSach,
				(select MaNgonNgu from NgonNgu where TenNgonNgu = @tenngonngu)
			)
		end
		else
		begin 
			insert into NgonNgu(TenNgonNgu) values (@tenngonngu)
			insert into NgonNgu_DauSach(MaDauSach,MaNgonNgu) 
			values (
				@MaDauSach,
				(select MaNgonNgu from NgonNgu where TenNgonNgu = @tenngonngu)
			)
		end
		set @strNgonNgu = SUBSTRING(@strNgonNgu,CHARINDEX(',',@strNgonNgu)+1,LEN(@strNgonNgu))
	end
end
GO
/****** Object:  StoredProcedure [dbo].[ThemNXB_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemNXB_DauSach](@MaDauSach nchar(50), @strNXB nvarchar(500))
as begin
	set @strNXB =@strNXB + ','
	while (CHARINDEX(',',@strNXB) > 0) -- có nhiều NXB, cắt từng tên theo dấu ','
	begin
		declare @tennxb nvarchar(500)
		set @tennxb = LEFT(@strNXB,CHARINDEX(',',@strNXB)-1)
		set @tennxb = Rtrim(Ltrim(@tennxb))
		if exists (select * from NhaXuatBan where LOWER(TenNXB) = LOWER(@tennxb))
		begin
			insert into NXB_DauSach(MaDauSach,MaNXB) 
			values (
				@MaDauSach,
				(select MaNXB from NhaXuatBan where TenNXB = @tennxb)
			)
		end
		else
		begin 
			insert into NhaXuatBan(TenNXB) values (@tennxb)
			insert into TheLoai_DauSach(MaDauSach,MaTheLoai) 
			values (
				@MaDauSach,
				(select MaNXB from NhaXuatBan where TenNXB = @tennxb)
			)
		end
		set @strNXB = stuff(@strNXB,1,CHARINDEX(',',@strNXB)+1,'')
	end
end
GO
/****** Object:  StoredProcedure [dbo].[ThemSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemSach](
	@madausach nchar(50),@masach nchar(50),@tap int,@lantaiban int, 
	@namxb date,@sotrang int,@tinhtrang nvarchar(200),
	@GiaSach int,@Tang int, @Ngan int)
	as begin
	if exists (select * from DauSach where MaDauSach = @madausach)
		if not exists (select * from Sach where MaSach = @masach)	
			begin
				insert into ViTriCuThe(Tang,Ngan,MaGiaSach) values (@Tang,@Ngan,@GiaSach)		
				insert into Sach(MaDauSach,MaSach,Tap,LanTaiBan,TinhTrang,SoTrang,NamXuatBan,MaViTri)
				values
				(
					@madausach,@masach,@tap,@lantaiban,@tinhtrang,@sotrang,@namxb,
					(select Max(MaViTri) from ViTriCuThe)
				)
			end
		else 
			return 0
end
GO
/****** Object:  StoredProcedure [dbo].[ThemTacGia_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemTacGia_DauSach](
	@MaDauSach nchar(50), @strTacGia nvarchar(500)
)as begin
	set @strTacGia = @strTacGia + ','
	while (CHARINDEX(',',@strTacGia) > 0) -- có nhiều tác giả, cắt từng tên theo dấu ','
	begin
		declare @tentacgia nvarchar(500)
		set @tentacgia = LEFT(@strTacGia,CHARINDEX(',',@strTacGia)-1)
		set @tentacgia = Rtrim(Ltrim(@tentacgia))
		if exists (select * from TacGia where LOWER(TenTacGia) = LOWER(@tentacgia))
		begin
		insert into TacGia_DauSach(MaDauSach,MaTacGia) 
		values (
			@MaDauSach,
			(select MaTacGia from TacGia where TenTacGia = @tentacgia)
		)
		end
		else
		begin 
			insert into TacGia(TenTacGia) values (@tentacgia)
			insert into TacGia_DauSach(MaDauSach,MaTacGia) 
			values (
				@MaDauSach,
				(select MaTacGia from TacGia where TenTacGia = @tentacgia)
			)
		end
		set @strTacGia = stuff(@strTacGia,1,CHARINDEX(',',@strTacGia)+1,'')
	end 
end
GO
/****** Object:  StoredProcedure [dbo].[ThemTheLoai_DauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemTheLoai_DauSach](@MaDauSach nchar(50), @strTheLoai nvarchar(500))
as begin
	set @strTheLoai =@strTheLoai + ','
	while (CHARINDEX(',',@strTheLoai) > 0) -- có nhiều tác giả, cắt từng tên theo dấu ','
	begin
		declare @tentheloai nvarchar(500)
		set @tentheloai = LEFT(@strTheLoai,CHARINDEX(',',@strTheLoai)-1)
		set @tentheloai = Rtrim(Ltrim(@tentheloai))
		if exists (select * from TheLoai where LOWER(TenTheLoai) = LOWER(@tentheloai))
		begin
			insert into TheLoai_DauSach(MaDauSach,MaTheLoai) 
			values (
				@MaDauSach,
				(select MaTheLoai from TheLoai where TenTheLoai = @tentheloai)
			)
		end
		else
		begin 
			insert into TheLoai(TenTheLoai) values (@tentheloai)
			insert into TheLoai_DauSach(MaDauSach,MaTheLoai) 
			values (
				@MaDauSach,
				(select MaTheLoai from TheLoai where TenTheLoai = @tentheloai)
			)
		end
		set @strTheLoai = SUBSTRING(@strTheLoai,CHARINDEX(',',@strTheLoai)+1,LEN(@strTheLoai))
	end
end
GO
/****** Object:  StoredProcedure [dbo].[trasach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[trasach] (@maMuonTra int, @ngaytra datetime) 

AS
BEGIN
	if not exists (select * from ChiTiet_MuonTra where MaMuonTra = @maMuonTra and ChiTiet_MuonTra.DaTra = 1)	
	begin
		UPDATE dbo.ChiTiet_MuonTra
		SET
			--MaMuonTra - column value is auto-generated
			dbo.ChiTiet_MuonTra.DaTra = 1, -- int
			dbo.ChiTiet_MuonTra.NgayTra = @ngaytra -- datetimehiTiet_MuonTra
		WHERE dbo.ChiTiet_MuonTra.MaMuonTra = @maMuonTra 
	end
	else 
		return 2
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDL]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateDL]
@MaNhanVien int,
@HoTen nvarchar(200),
@NgaySinh datetime,
@SDT int,
@email nchar(200),
@MaChucVu int
as
begin
update NhanVien
set HoTen= @HoTen, NgaySinh= @NgaySinh, SDT= @SDT, Email = @email, MaChucVu= @MaChucVu
where MaNhanVien = @MaNhanVien
end
GO
/****** Object:  StoredProcedure [dbo].[XoaCuonSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaCuonSach] @masach nchar(50)
as begin
	-- nếu mã sách không tồn tại thì kết thúc
	if not exists (select * from Sach where MaSach = @masach)
		return 0
	-- chỉ xóa cuốn sách khi không có ai mượn, hoặc mượn mà đã trả
	if not exists (select * from ChiTiet_MuonTra where MaSach = @masach)		
	begin		
		delete from Sach where MaSach = @masach
	end
	else if not exists(select * from ChiTiet_MuonTra where MaSach = @masach and DaTra = 0)
	begin 
		delete from MuonTra where MaMuonTra = 
					(select MaMuonTra from ChiTiet_MuonTra where MaSach = @masach)
		delete from ChiTiet_MuonTra where MaSach = @masach
		delete from Sach where MaSach = @masach
	end	
	else
	begin
		return 0
	end
end
GO
/****** Object:  StoredProcedure [dbo].[XoaDauSach]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaDauSach] @madausach nchar(50)
as begin
	-- B1: xóa mã đầu sách đã có ở các bảng liên quan
	-- Xóa tại bảng sách:
	declare @MaSach nchar(50)	
	declare Contro cursor for (select MaSach from Sach where MaDauSach = @madausach)
	open Contro
	fetch next from Contro into @MaSach
	while @@FETCH_STATUS = 0
	begin
		exec XoaCuonSach @MaSach
		fetch next from Contro into @MaSach
	end
	close Contro
	deallocate Contro
	--
	delete from TacGia_DauSach where MaDauSach = @madausach
	delete from NXB_DauSach where MaDauSach = @madausach
	delete from TheLoai_DauSach where MaDauSach = @madausach
	delete from NgonNgu_DauSach where MaDauSach = @madausach

	-- b2: Xóa đầu sách đó
	delete from DauSach where MaDauSach = @madausach
end
GO
/****** Object:  StoredProcedure [dbo].[xoadocgia]    Script Date: 5/11/2021 9:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoadocgia] (@maDocGia int)
AS BEGIN 
	DELETE DocGia
	WHERE MaDocGia = @maDocGia
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MuonTra"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTiet_MuonTra"
            Begin Extent = 
               Top = 21
               Left = 806
               Bottom = 184
               Right = 1000
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DocGia"
            Begin Extent = 
               Top = 134
               Left = 472
               Bottom = 297
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2256
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienMuonTra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienMuonTra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChucVu"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NhanVien"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienNhanVien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienNhanVien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sach"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DauSach"
            Begin Extent = 
               Top = 45
               Left = 472
               Bottom = 164
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HienThiGiaoDienSach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nv"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cv"
            Begin Extent = 
               Top = 63
               Left = 464
               Bottom = 182
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SoLuongNV_CV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SoLuongNV_CV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[18] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTiet_MuonTra"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 232
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MuonTra"
            Begin Extent = 
               Top = 141
               Left = 320
               Bottom = 312
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DocGia"
            Begin Extent = 
               Top = 105
               Left = 865
               Bottom = 337
               Right = 1076
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sach"
            Begin Extent = 
               Top = 0
               Left = 531
               Bottom = 143
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1560
         Width = 2532
         Width = 2796
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 3156
         Or = 1350
         Or = 1350
         Or = 1350
      E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeDocGiaViPhamQuaHan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeDocGiaViPhamQuaHan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ThongKeDocGiaViPhamQuaHan'
GO
USE [master]
GO
ALTER DATABASE [QuanLyTV] SET  READ_WRITE 
GO
