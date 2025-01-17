﻿------TẠO CSDL
CREATE DATABASE QLBH
USE QLBH
------TẠO BẢNG
IF OBJECT_ID('MATHANG') IS NOT NULL
DROP TABLE MATHANG
GO 
CREATE TABLE MATHANG(
MSMH VARCHAR(20) NOT NULL,
TENBANG NVARCHAR(10) NULL,
DONGIA MONEY NULL,
DONVITINH NVARCHAR(10) NULL,
CONSTRAINT PK_MATHANG PRIMARY KEY (MSMH)
)

IF OBJECT_ID('KHACHHANG') IS NOT NULL
DROP TABLE KHACHHANG
GO 
CREATE TABLE KHACHHANG(
MAKH VARCHAR(10) NOT NULL,
TENKH NVARCHAR(10) NULL,
DIACHI NVARCHAR(50) NULL,
CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
)



IF OBJECT_ID('PHIEUNHAP') IS NOT NULL
DROP TABLE PHIEUNHAP
GO
CREATE TABLE PHIEUNHAP(
SOPN VARCHAR(10) NOT NULL,
NGAYLAP DATETIME NULL,
MAKH VARCHAR(10) NULL,
KHOHANG NVARCHAR(20) NULL,
CONSTRAINT  PK_PHIEUNHAP PRIMARY KEY(SOPN),
CONSTRAINT  FK_PHIEUNHAP_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG
)



IF OBJECT_ID('CTNHAP') IS NOT NULL 
DROP TABLE CTNHAP 
GO
CREATE TABLE CTNHAP(
SOPN VARCHAR(10) NOT NULL,
MSMH VARCHAR(20) NOT NULL,
SOLUONG INT NULL,
CONSTRAINT FK_CTNHAP_PHIEUNHAP FOREIGN KEY (SOPN)  REFERENCES PHIEUNHAP,
CONSTRAINT FK_CTNHAP_MATHANG FOREIGN KEY (MSMH)  REFERENCES MATHANG,
CONSTRAINT PK_CTNHAP PRIMARY KEY(SOPN,MSMH)
)
DELETE FROM MATHANG
INSERT INTO MATHANG VALUES 
('MH01','SAMSUNG',10000000,N'CHIẾC'),
('MH02','IPHONE',17000000,N'CHIẾC'),
('MH03','VERTU',1000000,N'CHIẾC'),
('MH04','OPPO',16000000,N'CHIẾC'),
('MH05','TV',60000000,N'CHIẾC')

DELETE FROM KHACHHANG
INSERT INTO KHACHHANG VALUES
('KH01',N'MỸ',N'CHÀ VINH'),
('KH02',N'VIỆT',N'VŨNG TẦU'),
('KH03',N'VŨ',N'THÁI NGUYÊN'),
('KH04',N'NAM',N'LONG AN'),
('KH05',N'VIỆT',N'HẠ LONG')


DELETE FROM PHIEUNHAP 
INSERT INTO PHIEUNHAP VALUES 
('SP01','7/2/2022','KH01','THANH XUÂN'),
('SP02','1/5/2022','KH02','CẦU GIẤY'),
('SP03','8/7/2022','KH03','PHÚC DIỄN'),
('SP04','2/1/2022','KH04','LONG BIÊN'),
('SP05','1/5/2022','KH05','QUẢNG NGÃI')

DELETE FROM CTNHAP 
INSERT INTO CTNHAP VALUES
('SP01','MH01',1),
('SP02','MH02',4),
('SP03','MH03',2),
('SP04','MH04',8),
('SP05','MH05',2)
SELECT * FROM MATHANG
SELECT * FROM KHACHHANG
SELECT * FROM PHIEUNHAP
SELECT * FROM CTNHAP
