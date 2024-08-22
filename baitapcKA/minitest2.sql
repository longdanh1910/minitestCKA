create database quanlyTour;
use quanlyTour;
CREATE TABLE City (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO City (id, name) VALUES (1, 'Hà Nội'),(2, 'TP Hồ Chí Minh'),(3, 'Đà Nẵng'),(4, 'Huế'), (5, 'Hội An');
CREATE TABLE Destination (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    average_price DECIMAL(10, 2),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);
INSERT INTO Destination (id, name, description, average_price, city_id) 
VALUES (1, 'Vịnh Hạ Long', 'Danh lam thắng cảnh nổi tiếng', 5000000, 1),(2, 'Bà Nà Hills', 'Khu du lịch nổi tiếng', 4000000, 3),
 (3, 'Đại Nội Huế', 'Di tích lịch sử văn hóa', 3000000, 4),
 (4, 'Phố cổ Hội An', 'Di sản văn hóa thế giới', 3500000, 5),
 (5, 'Đầm Sen', 'Khu vui chơi giải trí lớn', 2500000, 2);
CREATE TABLE Client (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    identification_number VARCHAR(20),
    birth_year INT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

INSERT INTO Client (id, name, identification_number, birth_year, city_id)
VALUES (1, 'Nguyễn Danh Long', '123456789', 2000, 1), (2, 'Trần Thị Bằng', '987654321', 1985, 2),
 (3, 'Lê Văn Chuyên', '456789123', 2004, 3), (4, 'Vũ Bắc Kỳ', '654321987', 2000, 4),
 (5, 'Hoàng Văn Bảo', '789123456', 1992, 5),(6, 'Phạm Đức Duy', '321987654', 2000, 1), 
 (7, 'Đỗ Văn G', '147258369', 1980, 2),(8, 'Phan Thị Hằng', '369258147', 1983, 3),
 (9, 'Bùi Văn Bường', '258369147', 1994, 4),(10, 'Nguyễn Minh Tuấn', '369147258', 2002, 5);
 CREATE TABLE Category (
    id INT PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL
);
INSERT INTO Category (id, code, name) VALUES (1, 'C001', 'Tour Nghỉ Dưỡng'),(2, 'C002', 'Tour Khám Phá');

CREATE TABLE Tour (
    id INT PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    category_id INT,
    destination_price DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    destination_id int,
    foreign key (destination_id) references destination(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);
INSERT INTO Tour (id, code, category_id, destination_price,destination_id, start_date, end_date)
VALUES (1, 'T001', 1, 5000000,1, '2024-08-01', '2024-08-05'), (2, 'T002', 2, 4000000,2, '2024-08-10', '2024-08-15'),
(3, 'T003', 1, 3000000,3, '2024-08-20', '2024-08-25'), (4, 'T004', 2, 3500000,4, '2024-09-01', '2024-09-05'),
 (5, 'T005', 1, 2500000,5, '2024-09-10', '2024-09-15'), (6, 'T006', 2, 4000000,1, '2024-09-20', '2024-09-25'),
 (7, 'T007', 1, 5000000,2, '2024-10-01', '2024-10-05'),(8, 'T008', 2, 3000000,3, '2024-10-10', '2024-10-15'),
 (9, 'T009', 1, 3500000,4, '2024-10-20', '2024-10-25'), (10, 'T010', 2, 2500000,5, '2024-11-01', '2024-11-05'),
 (11, 'T011', 1, 4000000,1, '2024-11-10', '2024-11-15'),(12, 'T012', 2, 5000000,5, '2024-11-20', '2024-11-25'),(13, 'T013', 1, 3000000,1, '2024-12-01', '2024-12-05'),
 (14, 'T014', 2, 3500000,2, '2024-12-10', '2024-12-15'),(15, 'T015', 1, 2500000,3, '2024-12-20', '2024-12-25');
 
 CREATE TABLE `Order` (
    id INT PRIMARY KEY,
    tour_id INT,
    client_id INT,
    status VARCHAR(20),
    FOREIGN KEY (tour_id) REFERENCES Tour(id),
    FOREIGN KEY (client_id) REFERENCES Client(id)
);
INSERT INTO `Order` (id, tour_id, client_id, status)
VALUES (1, 1, 1, 'Pending'), (2, 2, 2, 'Confirmed'),(3, 3, 3, 'Pending'), (4, 4, 4, 'Cancelled'), (5, 5, 5, 'Confirmed'),
(6, 6, 6, 'Pending'), (7, 7, 7, 'Confirmed'), (8, 8, 8, 'Cancelled'), (9, 9, 9, 'Pending'), (10, 10, 10, 'Confirmed');

-- Thống kê số lượng tour của các thành phố	
select c.name as city_name,count(t.id) as tour_count
from tour t
join destination d on t.destination_id = d.id
join city c on d.city_id = c.id
group by c.name;
-- Tính số tour có ngày bắt đầu trong tháng 8 năm 2024 ( dùng count) 
select count(*) as tour_count
from tour
where start_date >= '2024-08-01' and start_date <= '2024-08-31';
-- Tính số tour có ngày kết thúc trong tháng 12 năm 2024
SELECT 
    COUNT(*) AS tour_count
FROM
    Tour
WHERE
    end_date >= '2024-12-01'
        AND end_date <= '2024-12-31';

