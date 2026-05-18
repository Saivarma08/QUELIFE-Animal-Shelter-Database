# Normalization Notes — QUELIFE Database

All relations are normalized to **BCNF** (Boyce-Codd Normal Form) or **3NF**.

---

## Entities & Functional Dependencies

### 1. Facility — BCNF
**FD:** `Facility_ID → Name, Location, PlayAreas, HealthCareUnits, OfficeSpace, TempControl`
All non-key attributes depend solely on the primary key. ✅

### 2. Animal — BCNF
**FDs:**
- `Animal_ID → Name, Species, Breed, DOB, AcquisitionDate, AcquisitionMode, HealthStatus, Facility_ID`
- `(Species, Breed) → TypicalHealthRisks` *(moved to a separate lookup table to maintain BCNF)*

### 3. Adopter — BCNF
**FD:** `Adopter_ID → Name, Address, Phone, Email, PreviousAdoptions, ApprovalStatus` ✅

### 4. Adoption — BCNF
**FDs:**
- `Adoption_ID → Animal_ID, Adopter_ID, AdoptionDate, Fee, FollowUpStatus, Employee_ID`
- `Animal_ID → Adoption_ID` *(one-to-one relationship enforced via UNIQUE constraint)*

### 5. Employee — BCNF
**FDs:**
- `Employee_ID → Name, Role, Facility_ID, Education, Certification, CriminalRecord, Contact, Salary`
- `(Education, Certification) → Role` *(determinant is a candidate key in context)* ✅

### 6. Sponsor — BCNF
**FD:** `Sponsor_ID → Name, OrgName, ContactInfo, SponsorshipType` ✅

### 7. Donation — BCNF
**FD:** `Donation_ID → Sponsor_ID, Facility_ID, Amount, Date, Purpose` ✅

### 8. Medical_Record — BCNF
**FDs:**
- `Record_ID → Animal_ID, CheckupDate, Diagnosis, Treatment, VetName, NextAppt`
- `(Animal_ID, CheckupDate) → Diagnosis, Treatment, VetName, NextAppt` *(composite candidate key)* ✅

### 9. Supplier — BCNF
**FD:** `Supplier_ID → Name, Contact, ItemType` ✅

### 10. Facility_Supplier (Bridge Table) — BCNF
**FD:** `(Facility_ID, Supplier_ID) → SupplyDate`
Composite primary key; all attributes depend on full key. ✅

---

## Relationships After Normalization

| Relationship | Type | FK |
|---|---|---|
| Facility → Animal | 1:M | Animal.Facility_ID |
| Animal → Medical_Record | 1:M | Medical_Record.Animal_ID |
| Animal → Adoption | 1:1 | Adoption.Animal_ID (UNIQUE) |
| Adopter → Adoption | 1:M | Adoption.Adopter_ID |
| Employee → Adoption | 1:M | Adoption.Employee_ID |
| Facility → Employee | 1:M | Employee.Facility_ID |
| Sponsor → Donation | 1:M | Donation.Sponsor_ID |
| Facility → Donation | 1:M | Donation.Facility_ID |
| Facility ↔ Supplier | M:N | FACILITY_SUPPLIER bridge table |

---

## Benefits of Normalization
- Eliminates redundancy across all tables
- Ensures data integrity via PK/FK constraints
- Simplifies updates — change data in one place
- Improves query performance with clean, indexed keys
