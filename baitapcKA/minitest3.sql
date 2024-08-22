CREATE DATABASE QuanLiKho;
USE QuanLiKho;
CREATE TABLE VatTu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ma_vat_tu VARCHAR(50) NOT NULL,
    ten_vat_tu VARCHAR(255) NOT NULL,
    don_vi_tinh VARCHAR(50),
    gia_tien DECIMAL(10, 2)
);
CREATE TABLE TonKho (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vat_tu_id INT NOT NULL,
    so_luong_dau INT,
    tong_so_luong_nhap INT,
    tong_so_luong_xuat INT,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
CREATE TABLE NhaCungCap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ma_nha_cung_cap VARCHAR(50) NOT NULL,
    ten_nha_cung_cap VARCHAR(255) NOT NULL,
    dia_chi VARCHAR(255),
    so_dien_thoai VARCHAR(20)
);
CREATE TABLE DonDatHang (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ma_don VARCHAR(50) NOT NULL,
    ngay_dat_hang DATE,
    nha_cung_cap_id INT,
    FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);
CREATE TABLE PhieuNhap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    so_phieu_nhap VARCHAR(50) NOT NULL,
    ngay_nhap DATE,
    don_hang_id INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id)
);
CREATE TABLE PhieuXuat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE,
    ten_khach_hang VARCHAR(255)
);
CREATE TABLE CTDonHang (
    id INT PRIMARY KEY AUTO_INCREMENT,
    don_hang_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_dat INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
CREATE TABLE CTPhieuNhap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phieu_nhap_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_nhap INT,
    don_gia_nhap DECIMAL(10, 2),
    ghi_chu TEXT,
    FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
CREATE TABLE CTPhieuXuat (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phieu_xuat_id INT NOT NULL,
    vat_tu_id INT NOT NULL,
    so_luong_xuat INT,
    don_gia_xuat DECIMAL(10, 2),
    ghi_chu TEXT,
    FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
INSERT INTO VatTu (ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien) VALUES
('VT001', 'Xi măng', 'Bao', 75000),
('VT002', 'Gạch đỏ', 'Viên', 5000),
('VT003', 'Thép', 'Kg', 15000),
('VT004', 'Cát vàng', 'Khối', 120000),
('VT005', 'Sơn tường', 'Thùng', 450000);
INSERT INTO TonKho (vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat) VALUES
(1, 100, 500, 300),
(2, 200, 1000, 700),
(3, 50, 400, 200),
(4, 75, 600, 400),
(5, 30, 200, 100),
(1, 150, 300, 150),
(2, 180, 800, 650),
(3, 60, 500, 250),
(4, 90, 700, 450),
(5, 40, 300, 200);
INSERT INTO NhaCungCap (ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) VALUES
('NCC001', 'Công ty Vật liệu Xây dựng ABC', 'Hà Nội', '0123456789'),
('NCC002', 'Công ty VLXD XYZ', 'TP. Hồ Chí Minh', '0987654321'),
('NCC003', 'Công ty VLXD Nam Định', 'Nam Định', '0345678901');
INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id) VALUES
('DH001', '2024-08-10', 1),
('DH002', '2024-08-15', 2),
('DH003', '2024-08-20', 3);
INSERT INTO PhieuNhap (so_phieu_nhap, ngay_nhap, don_hang_id) VALUES
('PN001', '2024-08-11', 1),
('PN002', '2024-08-16', 2),
('PN003', '2024-08-21', 3);
INSERT INTO PhieuXuat (ngay_xuat, ten_khach_hang) VALUES
('2024-08-12', 'Nguyễn Văn A'),
('2024-08-17', 'Trần Thị B'),
('2024-08-22', 'Lê Văn C');
INSERT INTO CTDonHang (don_hang_id, vat_tu_id, so_luong_dat) VALUES
(1, 1, 100),
(1, 2, 200),
(2, 3, 150),
(2, 4, 50),
(3, 5, 30),
(3, 1, 75);
INSERT INTO CTPhieuNhap (phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
(1, 1, 100, 74000, 'Giao hàng đúng hạn'),
(1, 2, 200, 4950, 'Hàng chất lượng tốt'),
(2, 3, 150, 14800, 'Giao sớm hơn dự kiến'),
(2, 4, 50, 118000, 'Hàng đạt tiêu chuẩn'),
(3, 5, 30, 445000, 'Hàng nhập từ nhà cung cấp uy tín'),
(3, 1, 75, 74500, 'Chất lượng xi măng tốt');
INSERT INTO CTPhieuXuat (phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu) VALUES
(1, 1, 50, 76000, 'Xuất cho công trình A'),
(1, 2, 100, 5100, 'Xuất cho công trình B'),
(2, 3, 80, 15500, 'Xuất cho công trình C'),
(2, 4, 30, 125000, 'Xuất cho công trình D'),
(3, 5, 20, 470000, 'Xuất cho công trình E'),
(3, 1, 40, 76500, 'Xuất cho công trình F');

--  Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
SELECT 
    PN.so_phieu_nhap,
    VT.ma_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    (CTPN.so_luong_nhap * CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id;
-- Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT AS
SELECT 
    PN.so_phieu_nhap,
    VT.ma_vat_tu,
    VT.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    (CTPN.so_luong_nhap*CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id;
-- Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT 
    PN.so_phieu_nhap,
    PN.ngay_nhap,
    DDH.ma_don,
    VT.ma_vat_tu,
    VT.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    (CTPN.so_luong_nhap*CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id
JOIN 
    DonDatHang DDH ON PN.don_hang_id=DDH.id;
-- Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT
    PN.so_phieu_nhap,
    PN.ngay_nhap,
    DDH.ma_don,
    DDH.nha_cung_cap_id,
    VT.ma_vat_tu,
    VT.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    (CTPN.so_luong_nhap*CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id
JOIN 
    DonDatHang DDH ON PN.don_hang_id=DDH.id;

-- Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
SELECT
    PN.so_phieu_nhap,
    VT.ma_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    (CTPN.so_luong_nhap*CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id
WHERE 
    CTPN.so_luong_nhap > 5;
-- Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
-- Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
   PN.so_phieu_nhap,
   VT.ma_vat_tu,
   VT.ten_vat_tu,
   CTPN.so_luong_nhap,
   CTPN.don_gia_nhap,
   (CTPN.so_luong_nhap*CTPN.don_gia_nhap) AS thanh_tien_nhap
FROM 
    CTPhieuNhap CTPN
JOIN 
    PhieuNhap PN ON CTPN.phieu_nhap_id = PN.id
JOIN 
    VatTu VT ON CTPN.vat_tu_id = VT.id
WHERE
    VT.don_vi_tinh ='Bộ';
--  Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
SELECT
    PX.id,
    VT.ma_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat,
    (CTPX.so_luong_xuat * CTPX.don_gia_xuat) AS thanh_tien_xuat
FROM 
    CTPhieuXuat CTPX
JOIN 
    PhieuXuat PX ON CTPX.phieu_xuat_id = PX.id
JOIN 
    VatTu VT ON CTPX.vat_tu_id = VT.id;
-- Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT AS
SELECT 
    PX.id,
    VT.ma_vat_tu,
    VT.ten_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat
FROM 
    CTPhieuXuat CTPX
JOIN 
    PhieuXuat PX ON CTPX.phieu_xuat_id = PX.id
JOIN 
    VatTu VT ON CTPX.vat_tu_id = VT.id;
-- Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT
    PX.id,
    PX.ten_khach_hang,
    VT.ma_vat_tu,
    VT.ten_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat
FROM 
    CTPhieuXuat CTPX
JOIN 
    PhieuXuat PX ON CTPX.phieu_xuat_id = PX.id
JOIN 
    VatTu VT ON CTPX.vat_tu_id = VT.id;
-- Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
DELIMITER $$

CREATE PROCEDURE sp_TongSoLuongCuoiVatTu (
    IN p_ma_vat_tu VARCHAR(50),
    OUT p_tong_so_luong_cuoi INT
)
BEGIN
    SELECT 
        tong_so_luong_nhap - tong_so_luong_xuat AS tong_so_luong_cuoi
    INTO 
        p_tong_so_luong_cuoi
    FROM 
        TonKho
    WHERE 
        ma_vat_tu = p_ma_vat_tu;
END $$

DELIMITER ;
-- Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
DELIMITER $$
CREATE PROCEDURE sp_TongTienXuatVatTu(
	IN p_ma_vat_tu VARCHAR(50),
    OUT p_tong_tien_xuat DECIMAL(18,2)
)
BEGIN
    SELECT 
        SUM(so_luong_xuat * don_gia_xuat) AS tong_tien_xuat
    INTO 
        p_tong_tien_xuat
    FROM 
        CTPhieuXuat
    JOIN 
        VatTu ON CTPhieuXuat.vat_tu_id = VatTu.id
    WHERE 
        VatTu.ma_vat_tu = p_ma_vat_tu;
END $$

DELIMITER ;
-- tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
DELIMITER $$
CREATE PROCEDURE sp_TongSoLuongDatHang(
    IN p_don_hang_id INT,
    OUT p_tong_so_luong_dat DECIMAL(10,2)
)
BEGIN
     SELECT 
         SUM(so_luong_dat) AS so_luong_dat
      INTO 
          p_tong_so_luong_dat
      FROM 
          CTDonHang
	  WHERE
          don_hang_id = p_don_hang_id;
END $$
DELIMITER ;
-- Tạo SP dùng để thêm một đơn đặt hàng.
DELIMITER $$
CREATE PROCEDURE p_them_DonDatHang(
	
     IN p_ma_don VARCHAR(50),
     IN p_ngay_dat_hang DATE,
     IN P_nha_cung_cap_id INT
)
BEGIN
     INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id) 
     VALUES(p_ma_don,p_ngay_dat_hang,p_nha_cung_cap_id);
END $$
DELIMITER ;
    
--  Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
DELIMITER $$

CREATE PROCEDURE p_them_CTDonDatHang(
    IN p_don_hang_id INT,    
    IN p_vat_tu_id INT,      
    IN p_so_luong_dat INT    
)
BEGIN
    
    INSERT INTO CTDonHang (don_hang_id, vat_tu_id, so_luong_dat)
    VALUES (p_don_hang_id, p_vat_tu_id, p_so_luong_dat);
END $$

DELIMITER ;
-- Tại SP dùng để xoá 1 nhà cung cấp theo id. Trong đó:
-- Tất cả những khoá ngoại đến nhà cung cấp chuyển thành null
-- Xoá nhà cung cấp.
DELIMITER $$

CREATE PROCEDURE p_xoa_nha_cung_cap (
    IN p_nha_cung_cap_id INT
)
BEGIN
    UPDATE DonDatHang
    SET nha_cung_cap_id = NULL
    WHERE nha_cung_cap_id = p_nha_cung_cap_id;

    DELETE FROM NhaCungCap
    WHERE id = p_nha_cung_cap_id;
END $$

DELIMITER ;
CALL p_xoa_nha_cung_cap(1)