-- ============================================================
-- QUELIFE Animal Shelter Organization
-- Database Schema - Oracle SQL
-- ============================================================

-- Drop tables in reverse dependency order (if re-running)
DROP TABLE FACILITY_SUPPLIER CASCADE CONSTRAINTS;
DROP TABLE MEDICAL_RECORD    CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_HOURS    CASCADE CONSTRAINTS;
DROP TABLE DONATION          CASCADE CONSTRAINTS;
DROP TABLE ADOPTION          CASCADE CONSTRAINTS;
DROP TABLE ANIMAL            CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE          CASCADE CONSTRAINTS;
DROP TABLE ADOPTER           CASCADE CONSTRAINTS;
DROP TABLE SPONSOR           CASCADE CONSTRAINTS;
DROP TABLE SUPPLIER          CASCADE CONSTRAINTS;
DROP TABLE FACILITY          CASCADE CONSTRAINTS;

-- ─── FACILITY ────────────────────────────────────────────────
CREATE TABLE FACILITY (
    Facility_ID       NUMBER(5)     PRIMARY KEY,
    Facility_Name     VARCHAR2(100) NOT NULL,
    Location          VARCHAR2(100) NOT NULL,
    Num_Play_Areas    NUMBER(3)     DEFAULT 0,
    Health_Care_Units NUMBER(3)     DEFAULT 0,
    Office_Space      CHAR(3)       CHECK (Office_Space IN ('Yes','No')),
    Temp_Control      CHAR(3)       CHECK (Temp_Control IN ('Yes','No'))
);

-- ─── ANIMAL ──────────────────────────────────────────────────
CREATE TABLE ANIMAL (
    Animal_ID         NUMBER(5)     PRIMARY KEY,
    Animal_Name       VARCHAR2(100),
    Species           VARCHAR2(50)  NOT NULL,
    Breed             VARCHAR2(100),
    Date_of_Birth     DATE,
    Acquisition_Date  DATE          NOT NULL,
    Acquisition_Mode  VARCHAR2(50)  CHECK (Acquisition_Mode IN ('Rescue','Stray','Owner Surrender','Transfer','Born in Shelter')),
    Health_Status     VARCHAR2(50)  CHECK (Health_Status IN ('Healthy','Sick','Injured','Under Treatment','Deceased','Adopted')),
    Facility_ID       NUMBER(5)     NOT NULL,
    CONSTRAINT fk_animal_facility FOREIGN KEY (Facility_ID) REFERENCES FACILITY(Facility_ID)
);

-- ─── ADOPTER ─────────────────────────────────────────────────
CREATE TABLE ADOPTER (
    Adopter_ID           NUMBER(5)     PRIMARY KEY,
    Adopter_Name         VARCHAR2(100) NOT NULL,
    Address              VARCHAR2(200),
    Phone                VARCHAR2(15)  UNIQUE,
    Email                VARCHAR2(100) UNIQUE,
    Previous_Adoptions   NUMBER(3)     DEFAULT 0,
    Approval_Status      VARCHAR2(20)  CHECK (Approval_Status IN ('Pending','Approved','Rejected'))
);

-- ─── EMPLOYEE ────────────────────────────────────────────────
CREATE TABLE EMPLOYEE (
    Employee_ID      NUMBER(5)     PRIMARY KEY,
    Employee_Name    VARCHAR2(100) NOT NULL,
    Role             VARCHAR2(100) NOT NULL,
    Facility_ID      NUMBER(5)     NOT NULL,
    Education        VARCHAR2(100),
    Certification    VARCHAR2(100),
    Criminal_Record  CHAR(3)       CHECK (Criminal_Record IN ('Yes','No')) DEFAULT 'No',
    Contact          VARCHAR2(15),
    Salary           NUMBER(10,2)  CHECK (Salary > 0),
    CONSTRAINT fk_employee_facility FOREIGN KEY (Facility_ID) REFERENCES FACILITY(Facility_ID)
);

-- ─── EMPLOYEE_HOURS (Payroll Log) ────────────────────────────
CREATE TABLE EMPLOYEE_HOURS (
    Log_ID       NUMBER(7)  PRIMARY KEY,
    Employee_ID  NUMBER(5)  NOT NULL,
    Work_Date    DATE       NOT NULL,
    Hours_Worked NUMBER(4,2) CHECK (Hours_Worked >= 0),
    CONSTRAINT fk_hours_employee FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

-- ─── ADOPTION ────────────────────────────────────────────────
CREATE TABLE ADOPTION (
    Adoption_ID      NUMBER(5)     PRIMARY KEY,
    Animal_ID        NUMBER(5)     NOT NULL UNIQUE,
    Adopter_ID       NUMBER(5)     NOT NULL,
    Employee_ID      NUMBER(5),
    Adoption_Date    DATE          NOT NULL,
    Adoption_Fee     NUMBER(8,2)   DEFAULT 0 CHECK (Adoption_Fee >= 0),
    Follow_Up_Status VARCHAR2(20)  CHECK (Follow_Up_Status IN ('Pending','Completed','Not Required')),
    CONSTRAINT fk_adoption_animal   FOREIGN KEY (Animal_ID)   REFERENCES ANIMAL(Animal_ID),
    CONSTRAINT fk_adoption_adopter  FOREIGN KEY (Adopter_ID)  REFERENCES ADOPTER(Adopter_ID),
    CONSTRAINT fk_adoption_employee FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

-- ─── SPONSOR ─────────────────────────────────────────────────
CREATE TABLE SPONSOR (
    Sponsor_ID        NUMBER(5)     PRIMARY KEY,
    Sponsor_Name      VARCHAR2(100) NOT NULL,
    Org_Name          VARCHAR2(100),
    Contact_Info      VARCHAR2(100),
    Sponsorship_Type  VARCHAR2(50)  CHECK (Sponsorship_Type IN ('One-Time','Monthly','Annual','In-Kind'))
);

-- ─── DONATION ────────────────────────────────────────────────
CREATE TABLE DONATION (
    Donation_ID   NUMBER(7)     PRIMARY KEY,
    Sponsor_ID    NUMBER(5)     NOT NULL,
    Facility_ID   NUMBER(5)     NOT NULL,
    Amount        NUMBER(10,2)  CHECK (Amount >= 0),
    Donation_Date DATE          NOT NULL,
    Purpose       VARCHAR2(200),
    CONSTRAINT fk_donation_sponsor  FOREIGN KEY (Sponsor_ID)  REFERENCES SPONSOR(Sponsor_ID),
    CONSTRAINT fk_donation_facility FOREIGN KEY (Facility_ID) REFERENCES FACILITY(Facility_ID)
);

-- ─── MEDICAL_RECORD ──────────────────────────────────────────
CREATE TABLE MEDICAL_RECORD (
    Record_ID    NUMBER(7)     PRIMARY KEY,
    Animal_ID    NUMBER(5)     NOT NULL,
    Checkup_Date DATE          NOT NULL,
    Diagnosis    VARCHAR2(200),
    Treatment    VARCHAR2(200),
    Vet_Name     VARCHAR2(100),
    Next_Appt    DATE,
    CONSTRAINT fk_medical_animal FOREIGN KEY (Animal_ID) REFERENCES ANIMAL(Animal_ID)
);

-- ─── SUPPLIER ────────────────────────────────────────────────
CREATE TABLE SUPPLIER (
    Supplier_ID  NUMBER(5)     PRIMARY KEY,
    Supplier_Name VARCHAR2(100) NOT NULL,
    Contact      VARCHAR2(100),
    Item_Type    VARCHAR2(100)
);

-- ─── FACILITY_SUPPLIER (Bridge Table - M:N) ──────────────────
CREATE TABLE FACILITY_SUPPLIER (
    Facility_ID  NUMBER(5) NOT NULL,
    Supplier_ID  NUMBER(5) NOT NULL,
    Supply_Date  DATE      NOT NULL,
    CONSTRAINT pk_fac_sup   PRIMARY KEY (Facility_ID, Supplier_ID),
    CONSTRAINT fk_fs_facility FOREIGN KEY (Facility_ID) REFERENCES FACILITY(Facility_ID),
    CONSTRAINT fk_fs_supplier FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER(Supplier_ID)
);

COMMIT;
