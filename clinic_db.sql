CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime TIMESTAMP,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(100),
    amount DECIMAL(10,2),
    datetime TIMESTAMP,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinics VALUES
('C1', 'Apollo Clinic', 'Hyderabad', 'Telangana', 'India'),
('C2', 'Sunshine Clinic', 'Warangal', 'Telangana', 'India'),
('C3', 'Care Clinic', 'Vijayawada', 'Andhra Pradesh', 'India'),
('C4', 'LifeCare Clinic', 'Guntur', 'Andhra Pradesh', 'India');

INSERT INTO customer VALUES
('U1', 'Mahesh Babu', '8123456790'),
('U2', 'Sravani Reddy', '9391827465'),
('U3', 'Ravi Teja', '7013928456'),
('U4', 'Pooja Sharma', '9981726354'),
('U5', 'Kiran Kumar', '8459201736'),
('U6', 'Anjali Devi', '7629810345');

INSERT INTO clinic_sales VALUES
('O1','U1','C1',5000,'2026-03-05 10:00:00','online'),
('O2','U2','C2',7000,'2026-03-10 12:00:00','offline'),
('O3','U3','C1',9000,'2026-03-15 09:00:00','online'),
('O4','U4','C3',4000,'2026-03-20 11:00:00','referral'),

('O5','U5','C4',10000,'2026-04-02 14:00:00','online'),
('O6','U1','C1',8000,'2026-04-10 16:00:00','offline'),
('O7','U2','C2',6000,'2026-04-15 18:00:00','referral'),
('O8','U6','C3',7500,'2026-04-20 13:00:00','online');

INSERT INTO expenses VALUES
('E1','C1','Medicines',2000,'2026-03-05 08:00:00'),
('E2','C2','Staff Salary',3000,'2026-03-10 08:00:00'),
('E3','C3','Equipment',1500,'2026-03-20 08:00:00'),

('E4','C1','Maintenance',2500,'2026-04-05 08:00:00'),
('E5','C2','Electricity',2000,'2026-04-10 08:00:00'),
('E6','C4','Supplies',3000,'2026-04-15 08:00:00');