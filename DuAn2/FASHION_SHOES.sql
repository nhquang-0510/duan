USE [master]
GO
CREATE DATABASE FASHION_SHOES
GO
USE FASHION_SHOES
GO
CREATE TABLE [NhanVien] (
  [IDNhanVien] varchar(10),
  [TenNhanVien] nvarchar(50),
  [GioiTinh] int,
  [Email] nvarchar(50),
  [ChucVu] int,
  [NgaySinh] date,
  [DiaChi] nvarchar(50),
  [DienThoai] varchar(10),
  [TaiKhoan] varchar(50),
  [MatKhau] varchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDNhanVien])
);

GO

CREATE TABLE [KhachHang] (
  [IDKhachHang] varchar(10),
  [TenKhachHang] nvarchar(50),
  [SoDienThoai] varchar(10),
  [DiaChi] nvarchar(50),
  [Email] nvarchar(50),
  [NgaySinh] date,
  [GioiTinh] int,
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDKhachHang])
);

GO

CREATE TABLE [PhuongThucThanhToan] (
  [IDPhuongThuc] varchar(10),
  [TenPhuongThuc] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDPhuongThuc])
);

GO

CREATE TABLE [Voucher] (
  [IDVoucher] varchar(10),
  [MaVoucher] nvarchar(50),
  [PhanTramGiamGia] float,
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDVoucher])
);

GO

CREATE TABLE [NhaCungCap] (
  [IDNhaCungCap] varchar(10),
  [TenNhaCungCap] nvarchar(50),
  [DiaChi] nvarchar(50),
  [SoDT] varchar(10),
  [Email] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDNhaCungCap])
);

GO

CREATE TABLE [ThuongHieu] (
  [IDThuongHieu] varchar(10),
  [TenThuongHieu] nvarchar(50),
  [Mota] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDThuongHieu])
);

GO

CREATE TABLE [SanPham] (
  [IDSanPham] varchar(10),
  [IDThuongHieu] varchar(10) FOREIGN KEY ([IDThuongHieu]) REFERENCES [ThuongHieu],
  [IDNhaCungCap] varchar(10) FOREIGN KEY ([IDNhaCungCap]) REFERENCES [NhaCungCap],
  [TenSanPham] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDSanPham])
);

GO

CREATE TABLE [ChatLieu] (
  [IDChatLieu] varchar(10),
  [TenChatLieu] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDChatLieu])
);

GO

CREATE TABLE [MauSac] (
  [IDMauSac] varchar(10),
  [TenMauSac] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDMauSac])
);

GO

CREATE TABLE [PhongCach] (
  [IDPhongCach] varchar(10),
  [TenPhongCach] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDPhongCach])
);

GO

CREATE TABLE [KichCo] (
  [IDKichCo] varchar(10),
  [TenKichCo] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDKichCo])
);

GO

CREATE TABLE [KieuDang] (
  [IDKieuDang] varchar(10),
  [TenKieuDang] nvarchar(50),
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDKieuDang])
);

GO

CREATE TABLE [ChiTietSanPham] (
  [IDChiTietSanPham] varchar(10),
  [IDSanPham] varchar(10) FOREIGN KEY([IDSanPham]) REFERENCES [SanPham],
  [IDMauSac] varchar(10) FOREIGN KEY([IDMauSac]) REFERENCES [MauSac],
  [IDChatLieu] varchar(10) FOREIGN KEY([IDChatLieu]) REFERENCES [ChatLieu],
  [IDKieuDang] varchar(10)FOREIGN KEY([IDKieuDang]) REFERENCES [KieuDang],
  [IDPhongCach] varchar(10) FOREIGN KEY([IDPhongCach]) REFERENCES [PhongCach],
  [IDKichCo] varchar(10) FOREIGN KEY([IDKichCo]) REFERENCES [KichCo],
  [MoTa] nvarchar(50),
  [HinhAnh] nvarchar(50),
  [GiaBan] float,
  [SoLuong] int,
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDChiTietSanPham])
);

GO

CREATE TABLE [HoaDon] (
  [IDHoaDon] INT IDENTITY(1,1),
  [IDKhachHang] varchar(10) FOREIGN KEY([IDKhachHang]) REFERENCES [KhachHang],
  [IDNhanVien] varchar(10) FOREIGN KEY([IDNhanVien]) REFERENCES [NhanVien],
  [IDPhuongThuc] varchar(10) FOREIGN KEY([IDPhuongThuc]) REFERENCES [PhuongThucThanhToan],
  [IDVoucher] varchar(10) FOREIGN KEY([IDVoucher]) REFERENCES [Voucher],
  [TongTien] float,
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDHoaDon])
);

GO

CREATE TABLE [ChiTietHoaDon] (
  [IDChiTietHoaDon] INT IDENTITY(1,1),
  [IDHoaDon] INT FOREIGN KEY([IDHoaDon]) REFERENCES [HoaDon],
  [IDSanPham] varchar(10) FOREIGN KEY([IDSanPham]) REFERENCES [SanPham],
  [IDChiTietSanPham] varchar(10) FOREIGN KEY([IDChiTietSanPham]) REFERENCES [ChiTietSanPham],
  [TenSanPham] nvarchar(50),
  [ThanhTien] float,
  [SoLuong] int,
  [NgayTao] datetime,
  [NgaySua] datetime,
  [TrangThai] int,
  PRIMARY KEY ([IDChiTietHoaDon])
);

go
--Bảng NhanVien

INSERT INTO NhanVien VALUES ('NV001',N'NGUYỄN THẾ QUANG',0,'QUANG@GMAIL.COM',0,'04/01/2004','HN','0911212169','ADMIN','123456',GETDATE(),GETDATE(),0)
INSERT INTO NhanVien VALUES ('NV002',N'THẾ QUANG',1,'QUANG1@GMAIL.COM',1,'04/01/2004','HN','0911212169','ADMIN1','1234561',GETDATE(),GETDATE(),0)

go
--Bảng KhachHang : 

INSERT INTO [KhachHang] ([IDKhachHang], [TenKhachHang], [SoDienThoai], [DiaChi], [Email], [NgaySinh], [GioiTinh], [NgayTao], [NgaySua], [TrangThai])
VALUES
	('KH000', N'Khách vãng lai', null, N'Hồ Chí Minh', 'johnsmith@gmail.com', '1990-01-01', 1, GETDATE(), GETDATE(), 0),
  ('KH001', N'John Smith', '0901234567', N'Hồ Chí Minh', 'johnsmith@gmail.com', '1990-01-01', 1, GETDATE(), GETDATE(), 0),
  ('KH002', N'Maria Garcia', '0912345678', N'Hà Nội', 'mariagarcia@gmail.com', '1992-02-02', 0, GETDATE(), GETDATE(), 0),
  ('KH003', N'Michael Johnson', '0923456789', N'Đà Nẵng', 'michaeljohnson@gmail.com', '1995-03-03', 1, GETDATE(), GETDATE(), 0),
  ('KH004', N'Sophia Martinez', '0934567890', N'Hải Phòng', 'sophiamartinez@gmail.com', '1988-04-04', 0, GETDATE(), GETDATE(), 0),
  ('KH005', N'David Lopez', '0945678901', N'Bình Dương', 'davidlopez@gmail.com', '1993-05-05', 1, GETDATE(), GETDATE(), 0),
  ('KH006', N'Isabella Rodriguez', '0956789012', N'Cần Thơ', 'isabellarodriguez@gmail.com', '1991-06-06', 0, GETDATE(), GETDATE(), 0),
  ('KH007', N'James Lee', '0967890123', N'Nghệ An', 'jameslee@gmail.com', '1994-07-07', 1, GETDATE(), GETDATE(), 0),
  ('KH008', N'Emma Harris', '0978901234', N'An Giang', 'emmaharris@gmail.com', '1989-08-08', 0, GETDATE(), GETDATE(), 0),
  ('KH009', N'Daniel Clark', '0989012345', N'Hưng Yên', 'danielclark@gmail.com', '1996-09-09', 1, GETDATE(), GETDATE(), 0),
  ('KH010', N'Sophie Walker', '0990123456', N'Vĩnh Phúc', 'sophiewalker@gmail.com', '1997-10-10', 0, GETDATE(), GETDATE(), 0);
-- Bảng NhaCungCap:
 go
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC001', N'Timberland', N'Địa chỉ 1', '123456789', 'email1@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC002', N'Salomon', N'Địa chỉ 2', '222226789', 'email2@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC003', N'Birkenstock', N'Địa chỉ 3', '133356789', 'email3@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC004', N'Hoka One One', N'Địa chỉ 4', '444446789', 'email4@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC005', N'Merrell', N'Địa chỉ 5', '555556789', 'email5@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC006', N'Under Armour', N'Địa chỉ 6', '666656789', 'email6@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC007', N'Skechers', N'Địa chỉ 7', '777776789', 'email7@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC008', N'ASICS', N'Địa chỉ 8', '888886789', 'email8@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC009', N'Balmain', N'Địa chỉ 9', '99999789', 'email9@example.com', GETDATE(), GETDATE(), 0);
INSERT INTO NhaCungCap (IDNhaCungCap, TenNhaCungCap, DiaChi, SoDT, Email, NgayTao, NgaySua, TrangThai)
VALUES ('NCC010', N'Jimmy Choo', N'Địa chỉ 10', '100000789', 'email10@example.com', GETDATE(), GETDATE(), 0);


GO
-- Bảng ThuongHieu:

INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH001', N'Nike', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH002', N'Adidas', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH003', N'Puma', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH004', N'Reebok', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH005', N'New Balance', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH006', N'Vans', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH007', N'Converse', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH008', N'Balenciaga', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH009', N'Gucci', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);
INSERT INTO ThuongHieu (IDThuongHieu, TenThuongHieu, Mota, NgayTao, NgaySua, TrangThai)
VALUES ('TH010', N'Givenchy', N'Mô tả thương hiệu', GETDATE(), GETDATE(), 0);


GO
-- Bảng SanPham:

INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP001', 'TH001', 'NCC010', N'Nike Jordan 1', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP002', 'TH002', 'NCC009', N'Adidas Superstar', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP003', 'TH003', 'NCC008', N'Puma Flash', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP004', 'TH004', 'NCC007', N'Reebook Sleep', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP005', 'TH005', 'NCC006', N'Balance Healthy', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP006', 'TH006', 'NCC005', N'Vans Moon', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP007', 'TH007', 'NCC004', N'Converse Boot', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP008', 'TH008', 'NCC003', N'Balenciaga Cartoon', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP009', 'TH009', 'NCC002', N'Gucci Snake', GETDATE(), GETDATE(), 0);
INSERT INTO SanPham (IDSanPham, IDThuongHieu, IDNhaCungCap, TenSanPham, NgayTao, NgaySua, TrangThai)
VALUES ('SP010', 'TH010', 'NCC001', N'Givenchy Sky', GETDATE(), GETDATE(), 0);

GO
-- Bảng ChatLieu:

INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL001', N'Da thật', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL002', N'Da PU', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL003', N'Da cá sấu', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL004', N'Cao su', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL005', N'Vải', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL006', N'Denim', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL007', N'Da tổng hợp', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL008', N'Kanvas', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL009', N'Nhựa PVC', GETDATE(), GETDATE(), 0);
INSERT INTO ChatLieu (IDChatLieu, TenChatLieu, NgayTao, NgaySua, TrangThai)
VALUES ('CL010', N'Cao su EVA', GETDATE(), GETDATE(), 0);


GO
-- Bảng MauSac:

INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS001', N'Đen', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS002', N'Trắng', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS003', N'Nâu', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS004', N'Xám', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS005', N'Xanh', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS006', N'Đỏ', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS007', N'Xanh lá cây', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS008', N'Hồng', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS009', N'Tím', GETDATE(), GETDATE(), 0);
INSERT INTO MauSac (IDMauSac, TenMauSac, NgayTao, NgaySua, TrangThai)
VALUES ('MS010', N'Vàng', GETDATE(), GETDATE(), 0);


GO
-- Bảng PhongCach:

INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC001', N'Classic', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC002', N'Retros', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC003', N'Athletic', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC004', N'Running', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC005', N'Lifestyle', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC006', N'Casual', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC007', N'Skateboarding', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC008', N'High-Top', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC009', N'Slip-On', GETDATE(), GETDATE(), 0);
INSERT INTO PhongCach (IDPhongCach, TenPhongCach, NgayTao, NgaySua, TrangThai)
VALUES ('PC010', N'Chunky', GETDATE(), GETDATE(), 0);


GO
-- Bảng KichCo:

INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC001', N'Size 35', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC002', N'Size 36', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC003', N'Size 37', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC004', N'Size 38', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC005', N'Size 39', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC006', N'Size 40', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC007', N'Size 41', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC008', N'Size 42', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC009', N'Size 43', GETDATE(), GETDATE(), 0);
INSERT INTO KichCo (IDKichCo, TenKichCo, NgayTao, NgaySua, TrangThai)
VALUES ('KC010', N'Size 44', GETDATE(), GETDATE(), 0);


GO
-- Bảng KieuDang:

INSERT INTO KieuDang (IDKieuDang, TenKieuDang, NgayTao, NgaySua, TrangThai)
VALUES ('KD001', N'Boots', GETDATE(), GETDATE(), 0);
INSERT INTO KieuDang (IDKieuDang, TenKieuDang, NgayTao, NgaySua, TrangThai)
VALUES ('KD002', N'Sneaker', GETDATE(), GETDATE(), 0);
INSERT INTO KieuDang (IDKieuDang, TenKieuDang, NgayTao, NgaySua, TrangThai)
VALUES ('KD003', N'Oxfords', GETDATE(), GETDATE(), 0);



GO
-- Bảng ChiTietSanPham:

INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP001', 'SP001', 'MS001', 'CL001', 'KD001', 'PC001', 'KC001', N'Mô tả chi tiết sản phẩm 1', 'hinh_anh_1.jpg', 1100000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP002', 'SP002', 'MS002', 'CL002', 'KD002', 'PC002', 'KC002', N'Mô tả chi tiết sản phẩm 2', 'hinh_anh_1.jpg', 1200000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP003', 'SP003', 'MS003', 'CL003', 'KD003', 'PC003', 'KC003', N'Mô tả chi tiết sản phẩm 3', 'hinh_anh_1.jpg', 1300000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP004', 'SP004', 'MS004', 'CL004', 'KD003', 'PC004', 'KC004', N'Mô tả chi tiết sản phẩm 4', 'hinh_anh_1.jpg', 1400000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP005', 'SP005', 'MS005', 'CL005', 'KD002', 'PC005', 'KC005', N'Mô tả chi tiết sản phẩm 5', 'hinh_anh_1.jpg', 1500000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP006', 'SP006', 'MS006', 'CL006', 'KD001', 'PC006', 'KC006', N'Mô tả chi tiết sản phẩm 6', 'hinh_anh_1.jpg', 1600000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP007', 'SP007', 'MS007', 'CL007', 'KD003', 'PC007', 'KC007', N'Mô tả chi tiết sản phẩm 7', 'hinh_anh_1.jpg', 1700000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP008', 'SP008', 'MS008', 'CL008', 'KD002', 'PC008', 'KC008', N'Mô tả chi tiết sản phẩm 8', 'hinh_anh_1.jpg', 1800000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP009', 'SP009', 'MS009', 'CL009', 'KD002', 'PC009', 'KC009', N'Mô tả chi tiết sản phẩm 9', 'hinh_anh_1.jpg', 1900000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP010', 'SP010', 'MS010', 'CL010', 'KD003', 'PC010', 'KC010', N'Mô tả chi tiết sản phẩm 10', 'hinh_anh_1.jpg', 2000000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP011', 'SP001', 'MS010', 'CL005', 'KD001', 'PC005', 'KC001', N'Mô tả chi tiết sản phẩm 11', 'hinh_anh_1.jpg', 2100000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP012', 'SP002', 'MS009', 'CL006', 'KD002', 'PC004', 'KC002', N'Mô tả chi tiết sản phẩm 12', 'hinh_anh_1.jpg', 2200000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP013', 'SP003', 'MS008', 'CL007', 'KD003', 'PC003', 'KC003', N'Mô tả chi tiết sản phẩm 13', 'hinh_anh_1.jpg', 2300000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP014', 'SP004', 'MS007', 'CL008', 'KD002', 'PC002', 'KC004', N'Mô tả chi tiết sản phẩm 14', 'hinh_anh_1.jpg', 2400000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP015', 'SP005', 'MS006', 'CL009', 'KD001', 'PC001', 'KC005', N'Mô tả chi tiết sản phẩm 15', 'hinh_anh_1.jpg', 2500000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP016', 'SP006', 'MS005', 'CL004', 'KD003', 'PC006', 'KC006', N'Mô tả chi tiết sản phẩm 16', 'hinh_anh_1.jpg', 2600000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP017', 'SP007', 'MS004', 'CL003', 'KD002', 'PC007', 'KC007', N'Mô tả chi tiết sản phẩm 17', 'hinh_anh_1.jpg', 2700000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP018', 'SP008', 'MS003', 'CL002', 'KD001', 'PC008', 'KC008', N'Mô tả chi tiết sản phẩm 18', 'hinh_anh_1.jpg', 2800000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP019', 'SP009', 'MS002', 'CL001', 'KD003', 'PC009', 'KC009', N'Mô tả chi tiết sản phẩm 19', 'hinh_anh_1.jpg', 2900000, 100, GETDATE(), GETDATE(), 0);
INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham, IDMauSac, IDChatLieu, IDKieuDang, IDPhongCach, IDKichCo, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
VALUES ('CTSP020', 'SP010', 'MS001', 'CL010', 'KD001', 'PC010', 'KC010', N'Mô tả chi tiết sản phẩm 20', 'hinh_anh_1.jpg', 3000000, 100, GETDATE(), GETDATE(), 0);

go
--Bảng phương thức thanh toán

INSERT INTO PhuongThucThanhToan ([IDPhuongThuc],[TenPhuongThuc],[NgayTao],[NgaySua],[TrangThai]) 
VALUES ('PT001',N'Tiền mặt',GETDATE(),GETDATE(),0)
INSERT INTO PhuongThucThanhToan ([IDPhuongThuc],[TenPhuongThuc],[NgayTao],[NgaySua],[TrangThai]) 
VALUES ('PT002',N'Chuyển khoản',GETDATE(),GETDATE(),0)


GO
--BẢNG VOUCHER
INSERT INTO VOUCHER VALUES ('VC000', 'NONE',0.0,GETDATE(),GETDATE(),0)
INSERT INTO VOUCHER VALUES ('VC001', N'GIẢM 10%',0.1,GETDATE(),GETDATE(),0)
INSERT INTO VOUCHER VALUES ('VC002', N'GIẢM 20%',0.2,GETDATE(),GETDATE(),0)
INSERT INTO VOUCHER VALUES ('VC003', N'GIẢM 30%',0.3,GETDATE(),GETDATE(),0)
INSERT INTO VOUCHER VALUES ('VC004', N'GIẢM 40%',0.4,GETDATE(),GETDATE(),0)
INSERT INTO VOUCHER VALUES ('VC005', N'GIẢM 50%',0.5,GETDATE(),GETDATE(),0)

GO

IF OBJECT_ID ('InsertSanPham') IS NOT NULL
BEGIN
DROP PROCEDURE InsertSanPham
END
GO
CREATE PROCEDURE InsertSanPham
	@IdSanPham varchar(10),
    @TenThuongHieu NVARCHAR(50),
    @TenNhaCungCap NVARCHAR(50),
    @TenSanPham NVARCHAR(100),
    @TrangThai int
AS
BEGIN
    DECLARE @IDThuongHieu varchar(10);
    DECLARE @IDNhaCungCap varchar(10);

    -- Tìm mã thương hiệu từ tên thương hiệu
    SELECT @IDThuongHieu = [IDThuongHieu] FROM [dbo].[ThuongHieu] WHERE [TenThuongHieu] = @TenThuongHieu;

    -- Tìm mã nhà cung cấp từ tên nhà cung cấp
    SELECT @IDNhaCungCap = [IDNhaCungCap] FROM [dbo].[NhaCungCap] WHERE [TenNhaCungCap] = @TenNhaCungCap;

    -- Chèn dữ liệu vào bảng SanPham
    INSERT INTO [dbo].[SanPham] ([IDSanPham],[IDThuongHieu], [IDNhaCungCap], [TenSanPham], [NgayTao], [NgaySua], [TrangThai])
    VALUES (@IdSanPham,@IDThuongHieu, @IDNhaCungCap, @TenSanPham, GETDATE(), GETDATE(), @TrangThai);
END

GO

IF OBJECT_ID ('UpdateSanPham') IS NOT NULL
BEGIN
DROP PROCEDURE UpdateSanPham
END
GO
CREATE PROCEDURE UpdateSanPham
    @IDSanPham VARCHAR(10),
    @TenThuongHieu NVARCHAR(50),
    @TenNhaCungCap NVARCHAR(50),
    @TenSanPham NVARCHAR(100),
    @TrangThai int
AS
BEGIN
    DECLARE @IDThuongHieu varchar(10);
    DECLARE @IDNhaCungCap varchar(10);

    -- Tìm mã thương hiệu từ tên thương hiệu
    SELECT @IDThuongHieu = [IDThuongHieu] FROM [dbo].[ThuongHieu] WHERE [TenThuongHieu] = @TenThuongHieu;

    -- Tìm mã nhà cung cấp từ tên nhà cung cấp
    SELECT @IDNhaCungCap = [IDNhaCungCap] FROM [dbo].[NhaCungCap] WHERE [TenNhaCungCap] = @TenNhaCungCap;

    -- Cập nhật dữ liệu trong bảng SanPham
    UPDATE [dbo].[SanPham]
    SET [IDThuongHieu] = @IDThuongHieu,
        [IDNhaCungCap] = @IDNhaCungCap,
        [TenSanPham] = @TenSanPham,
        [NgaySua] = GETDATE(),
        [TrangThai] = @TrangThai
    WHERE [IDSanPham] = @IDSanPham;
END

GO

IF OBJECT_ID ('InsertChiTietSanPham') IS NOT NULL
BEGIN
DROP PROCEDURE InsertChiTietSanPham
END
GO
CREATE PROCEDURE InsertChiTietSanPham
    @IDChiTietSanPham VARCHAR(10),
    @IDSanPham VARCHAR(10),
	@TENMAUSAC NVARCHAR(50),
	@TENCHATLIEU NVARCHAR(50),
	@TENKIEUDANG NVARCHAR(50),
	@TENPHONGCACH NVARCHAR(50),
	@TENKICHCO NVARCHAR(50),
    @MoTa NVARCHAR(MAX),
    @GiaBan FLOAT,
    @SoLuong INT,
	@TRANGTHAI INT
AS
BEGIN
	--
	DECLARE @IDMAUSAC varchar(10);
	DECLARE @IDCHATLIEU varchar(10);
	DECLARE @IDKIEUDANG VARCHAR(10);
	DECLARE @IDPHONGCACH VARCHAR(10);
	DECLARE @IDKICHCO VARCHAR(10);
	--
    SELECT @IDMAUSAC = [IDMAUSAC] FROM [dbo].[MAUSAC] WHERE [TenMAUSAC] = @TenMAUSAC;
	SELECT @IDCHATLIEU = [IDCHATLIEU] FROM [dbo].[CHATLIEU] WHERE [TenCHATLIEU] = @TenCHATLIEU;
	SELECT @IDKIEUDANG = [IDKIEUDANG] FROM [dbo].[KIEUDANG] WHERE [TenKIEUDANG] = @TenKIEUDANG;
	SELECT @IDPHONGCACH = [IDPHONGCACH] FROM [dbo].[PHONGCACH] WHERE [TENPHONGCACH] = @TENPHONGCACH;
	SELECT @IDKICHCO = [IDKICHCO] FROM [dbo].[KICHCO] WHERE [TENKICHCO] = @TENKICHCO;

    -- Chèn dữ liệu vào bảng ChiTietSanPham
    INSERT INTO ChiTietSanPham (IDChiTietSanPham, IDSanPham,IDMauSac,IDChatLieu,IDKieuDang,IDPHONGCACH,IDKICHCO, MoTa, HinhAnh, GiaBan, SoLuong, NgayTao, NgaySua, TrangThai)
    VALUES (@IDChiTietSanPham, @IDSanPham,@IDMAUSAC,@IDCHATLIEU,@IDKIEUDANG,@IDPHONGCACH,@IDKICHCO, @MoTa, 'jpg', @GiaBan, @SoLuong, GETDATE(), GETDATE(), @TRANGTHAI);
END


GO



IF OBJECT_ID ('UpdateChiTietSanPham') IS NOT NULL
BEGIN
DROP PROCEDURE UpdateChiTietSanPham
END
GO
CREATE PROCEDURE UpdateChiTietSanPham
    @IDSanPham VARCHAR(10),
	@TENMAUSAC NVARCHAR(50),
	@TENCHATLIEU NVARCHAR(50),
	@TENKIEUDANG NVARCHAR(50),
	@TENPHONGCACH NVARCHAR(50),
	@TENKICHCO NVARCHAR(50),
    @MoTa NVARCHAR(50),
    @GiaBan FLOAT,
    @SoLuong INT,
	@TRANGTHAI INT,
	@IDChiTietSanPham VARCHAR(10)
AS
BEGIN
	--
	DECLARE @IDMAUSAC varchar(10);
	DECLARE @IDCHATLIEU varchar(10);
	DECLARE @IDKIEUDANG VARCHAR(10);
	DECLARE @IDPHONGCACH VARCHAR(10);
	DECLARE @IDKICHCO VARCHAR(10);
	--
    SELECT @IDMAUSAC = [IDMAUSAC] FROM [dbo].[MAUSAC] WHERE [TenMAUSAC] = @TenMAUSAC;
	SELECT @IDCHATLIEU = [IDCHATLIEU] FROM [dbo].[CHATLIEU] WHERE [TenCHATLIEU] = @TenCHATLIEU;
	SELECT @IDKIEUDANG = [IDKIEUDANG] FROM [dbo].[KIEUDANG] WHERE [TenKIEUDANG] = @TenKIEUDANG;
	SELECT @IDPHONGCACH = [IDPHONGCACH] FROM [dbo].[PHONGCACH] WHERE [TENPHONGCACH] = @TENPHONGCACH;
	SELECT @IDKICHCO = [IDKICHCO] FROM [dbo].[KICHCO] WHERE [TENKICHCO] = @TENKICHCO;

    -- cập nhật dữ liệu vào bảng ChiTietSanPham
    update ChiTietSanPham set IDSanPham = @IDSanPham ,IDMauSac = @IDMAUSAC,IDChatLieu= @IDCHATLIEU,IDKieuDang = @IDKIEUDANG,IDPHONGCACH= @IDPHONGCACH,IDKICHCO=@IDKICHCO, MoTa=@MoTa, HinhAnh='jpg', GiaBan=@GiaBan, SoLuong=@SoLuong, NgaySua=GETDATE(), TrangThai=@TRANGTHAI where IDChiTietSanPham = @IDChiTietSanPham
END


go

IF OBJECT_ID ('VIEW_CTSP') IS NOT NULL
BEGIN
DROP VIEW VIEW_CTSP
END
GO
CREATE VIEW VIEW_CTSP
AS
SELECT
	ChiTietSanPham.IDChiTietSanPham,
    ChiTietSanPham.IDSanPham,
    SanPham.TenSanPham,
    ThuongHieu.TenThuongHieu,
    NhaCungCap.TenNhaCungCap,
    MauSac.TenMauSac,
    ChatLieu.TenChatLieu,
    KieuDang.TenKieuDang,
    PHONGCACH.TenPHONGCACH,
    KICHCO.TenKICHCO,
	chitietsanpham.MoTa,GiaBan,SoLuong,ChitietSanPham.TrangThai
FROM
    ChiTietSanPham
    INNER JOIN SanPham ON ChiTietSanPham.IDSanPham = SanPham.IDSanPham
    INNER JOIN ThuongHieu ON SanPham.IDThuongHieu = ThuongHieu.IDThuongHieu
    INNER JOIN NhaCungCap ON SanPham.IDNhaCungCap = NhaCungCap.IDNhaCungCap
    INNER JOIN MauSac ON ChiTietSanPham.IDMauSac = MauSac.IDMauSac
    INNER JOIN ChatLieu ON ChiTietSanPham.IDChatLieu = ChatLieu.IDChatLieu
    INNER JOIN KieuDang ON ChiTietSanPham.IDKieuDang = KieuDang.IDKieuDang
    INNER JOIN PHONGCACH ON ChiTietSanPham.IDPHONGCACH = PHONGCACH.IDPHONGCACH
    INNER JOIN KICHCO ON ChiTietSanPham.IDKICHCO = KICHCO.IDKICHCO;
	

GO
	
IF OBJECT_ID ('View_HoaDonInfo') IS NOT NULL
BEGIN
DROP VIEW View_HoaDonInfo
END
GO
CREATE VIEW View_HoaDonInfo
AS
SELECT
    HD.IDHoaDon,
	KH.TenKhachHang,
    NV.TenNhanVien,
    PT.TenPhuongThuc,
    VC.MaVoucher,
	HD.TongTien,
    HD.NgayTao,
    HD.TrangThai
FROM
    HoaDon HD
    LEFT JOIN NhanVien NV ON HD.IDNhanVien = NV.IDNhanVien
    LEFT JOIN KhachHang KH ON HD.IDKhachHang = KH.IDKhachHang
    LEFT JOIN PhuongThucThanhToan PT ON HD.IDPhuongThuc = PT.IDPhuongThuc
    LEFT JOIN Voucher VC ON HD.IDVoucher = VC.IDVoucher


GO

IF OBJECT_ID ('AddHD') IS NOT NULL
BEGIN
DROP PROCEDURE AddHD
END
GO
CREATE PROCEDURE AddHD
    @TenKhachHang nvarchar(50),
	@TenNhanVien nvarchar(50),
	@TenPhuongThuc nvarchar(50),
	@TenVoucher nvarchar(10)
AS
BEGIN
	DECLARE @MaKhachHang VARCHAR(10);
	DECLARE @MANHANVIEN VARCHAR(10);
	DECLARE @MAPHUONGTHUC VARCHAR(10);
	DECLARE @MAVOUCHER VARCHAR(10)

  -- Lấy mã khách hàng dựa trên tên khách hàng
  SELECT @MaKhachHang = IDKhachHang
  FROM KhachHang
  WHERE TenKhachHang = @TenKhachHang;
  --
  SELECT @MANHANVIEN = IDnhanvien
  FROM NhanVien
  WHERE TenNhanVien = @TenNhanVien;
  --
  SELECT @MAPHUONGTHUC = IDPHUONGTHUC
  FROM PhuongThucThanhToan
  WHERE TenPhuongThuc = @TenPhuongThuc
  --
  SELECT @MAVOUCHER = IDVOUCHER
  FROM VOUCHER
  WHERE MaVoucher = @TenVoucher   
   -- Thêm hóa đơn vào bảng HoaDon
    INSERT INTO [HoaDon] ([IDKhachHang], [IDNhanVien],[IDPHUONGTHUC],[IDVOUCHER], [TongTien],[NgayTao],[NgaySua], [TrangThai])
    VALUES (@MaKhachHang, @MANHANVIEN,@MAPHUONGTHUC,@MAVOUCHER, 0,GETDATE(), GETDATE(), 0);
END


GO


IF OBJECT_ID ('BANHANG') IS NOT NULL
BEGIN
DROP PROCEDURE BANHANG
END
GO
CREATE PROCEDURE BANHANG
    @IDHOADON INT,
    @IDCTSP VARCHAR(10),
    @SL INT
AS
BEGIN 
    DECLARE @TENSP NVARCHAR(20)
    DECLARE @IDSP NVARCHAR(10)
	DECLARE @DONGIA FLOAT
	--
    SELECT @TENSP = TENSANPHAM,
           @IDSP = ChiTietSanPham.IDSANPHAM,
		   @DONGIA = ChiTietSanPham.GiaBan
    FROM ChiTietSanPham
    JOIN SanPham ON ChiTietSanPham.IDSanPham = SanPham.IDSanPham
    WHERE IDChiTietSanPham = @IDCTSP
	--
	DECLARE @TONGTIEN FLOAT
	SET @TONGTIEN = @SL*@DONGIA
	--

    IF EXISTS (SELECT 1 FROM ChiTietHoaDon WHERE IDChiTietSanPham = @IDCTSP AND IDHoaDon = @IDHOADON)
    BEGIN
        UPDATE ChiTietSanPham
        SET SoLuong = SoLuong - @SL
        WHERE IDChiTietSanPham = @IDCTSP
		--
		UPDATE ChiTietHoaDon
		SET IDSanPham = @IDSP,
        IDChiTietSanPham = @IDCTSP,
        TenSanPham = @TENSP,
		soluong = SoLuong + @SL,
        ThanhTien = (SoLuong+@SL)*@DONGIA
		WHERE IDChiTietSanPham = @IDCTSP
    END
    ELSE
    BEGIN
		UPDATE ChiTietSanPham
        SET SoLuong = SoLuong - @SL
        WHERE IDChiTietSanPham = @IDCTSP
		--
        INSERT INTO ChiTietHoaDon (IDHoaDon, IDSanPham, IDChiTietSanPham, TenSanPham, ThanhTien, soluong,NgayTao,NgaySua,TrangThai)
        VALUES (@IDHOADON, @IDSP, @IDCTSP, @TENSP, @TONGTIEN, @SL,GETDATE(),GETDATE(),0)
    END
END


GO

IF OBJECT_ID ('TongTien') IS NOT NULL
BEGIN
DROP PROCEDURE TongTien
END
GO
CREATE PROCEDURE TongTien
    @IDHoaDon INT,
	@MAVOUCHER NVARCHAR(10)
AS
BEGIN
	DECLARE @TONGTHANHTIEN FLOAT
	DECLARE @PHANTRAMKHUYENMAI FLOAT
	DECLARE @TONGTIEN FLOAT
	DECLARE @TONGGIATRIKHUYENMAI FLOAT
	--
	SELECT @PHANTRAMKHUYENMAI = PhanTramGiamGia FROM Voucher WHERE MaVoucher = @MAVOUCHER
	SELECT @TONGTIEN = SUM(THANHTIEN) FROM ChiTietHoaDon WHERE IDHoaDon = @IDHoaDon
	SELECT @TONGGIATRIKHUYENMAI = @TONGTIEN*@PHANTRAMKHUYENMAI
	SELECT @TONGTHANHTIEN = @TONGTIEN - @TONGGIATRIKHUYENMAI
	IF @MAVOUCHER = 'NONE'
	BEGIN
	UPDATE HoaDon SET TongTien = @TONGTIEN WHERE IDHoaDon = @IDHoaDon
	END
	ELSE
	BEGIN
	UPDATE HoaDon SET TongTien = @TONGTHANHTIEN WHERE IDHoaDon = @IDHoaDon
	END
END


GO


IF OBJECT_ID ('XOA1SANPHAM') IS NOT NULL
BEGIN
DROP PROCEDURE XOA1SANPHAM
END
GO
CREATE PROC XOA1SANPHAM
@IDCHITIETSANPHAM VARCHAR(10),
@IDCHITIETHOADON INT
AS
BEGIN
DECLARE @SLXOA INT
DECLARE @SLTRONGKHO INT

SELECT @SLXOA = SOLUONG FROM ChiTietHoaDon WHERE IDChiTietHoaDon = @IDCHITIETHOADON
SELECT @SLTRONGKHO = SOLUONG FROM ChiTietSanPham WHERE IDChiTietSanPham = @IDCHITIETSANPHAM
IF EXISTS (SELECT TOP 1 @IDChiTietSanPham FROM ChiTietHoaDon where IDChiTietHoaDon= @IDCHITIETHOADON)
BEGIN
DELETE FROM ChiTietHoaDon WHERE IDChiTietHoaDon = @IDCHITIETHOADON
UPDATE ChiTietSanPham SET SoLuong = @SLTRONGKHO + @SLXOA WHERE IDChiTietSanPham = @IDCHITIETSANPHAM
END
END

GO


IF OBJECT_ID ('THEMNHANH') IS NOT NULL
BEGIN
DROP PROCEDURE THEMNHANH
END
GO
CREATE PROC THEMNHANH
@TENKH NVARCHAR(100),
@SDT VARCHAR(10)
AS
DECLARE @NextCode CHAR(6);
BEGIN
SELECT @NextCode = MAX(IDKhachHang) FROM KhachHang;
IF (@NextCode IS NULL)
begin
    SET @NextCode = 'KH001';
	end
ELSE
begin
    SET @NextCode = 'KH' + RIGHT('000' + CAST(SUBSTRING(@NextCode, 3, 3) AS INT) + 1, 3);
INSERT INTO KhachHang(IDKhachHang, TenKhachHang, SoDienThoai, NgayTao,NgaySua,TrangThai)
VALUES (@NextCode, @TENKH,@SDT,GETDATE(),GETDATE(),0);
end
END

go 


CREATE PROCEDURE ThongKeHoaDonTheoThang
    @Thang INT
AS
BEGIN
    SET NOCOUNT ON;

   SELECT
		MONTH(HD.NgayTao),
        HD.IDHoaDon,
        HD.TongTien,
        HD.NgayTao
    FROM
        HoaDon HD
    WHERE
        MONTH(HD.NgayTao) = @Thang
		AND TrangThai =1
END

go


CREATE VIEW THONGKETONG
AS
SELECT
        YEAR(HD.NgayTao) AS Nam,
        MONTH(HD.NgayTao) AS Thang,
        Count(HD.IDHoaDon) AS SoLuongHoaDon,
        SUM(CTHD.SoLuong) AS TongSoLuong,
        SUM(HD.TongTien) AS TongThanhTien
    FROM
        HoaDon HD
        INNER JOIN ChiTietHoaDon CTHD ON HD.IDHoaDon = CTHD.IDHoaDon
	where 
		HD.TrangThai = 1
    GROUP BY
        YEAR(HD.NgayTao),
        MONTH(HD.NgayTao)


go

IF OBJECT_ID('XOA_CHITIETHOADON_THEO_IDHOADON') IS NOT NULL
    DROP PROCEDURE XOA_CHITIETHOADON_THEO_IDHOADON
GO

CREATE PROCEDURE XOA_CHITIETHOADON_THEO_IDHOADON
    @IDHoaDon INT
AS
BEGIN
    -- Tạo bảng tạm để lưu trữ thông tin số lượng sản phẩm cần cập nhật
    CREATE TABLE #TempChiTietHoaDon
    (
        IDChiTietSanPham VARCHAR(10),
        SoLuong INT
    )

    -- Lấy thông tin số lượng sản phẩm cần cập nhật
    INSERT INTO #TempChiTietHoaDon (IDChiTietSanPham, SoLuong)
    SELECT IDChiTietSanPham, SUM(SoLuong)
    FROM ChiTietHoaDon
    WHERE IDHoaDon = @IDHoaDon
    GROUP BY IDChiTietSanPham

    -- Xóa chi tiết hóa đơn
    DELETE FROM ChiTietHoaDon WHERE IDHoaDon = @IDHoaDon

    -- Cập nhật số lượng sản phẩm trong bảng ChiTietSanPham
    UPDATE CTSP
    SET CTSP.SoLuong = CTSP.SoLuong + TCH.SoLuong
    FROM ChiTietSanPham CTSP
    INNER JOIN #TempChiTietHoaDon TCH ON CTSP.IDChiTietSanPham = TCH.IDChiTietSanPham
	WHERE CTSP.IDChiTietSanPham = TCH.IDChiTietSanPham
    -- Xóa bảng tạm
    DROP TABLE #TempChiTietHoaDon
END