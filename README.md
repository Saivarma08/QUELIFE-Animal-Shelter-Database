# QUELIFE Animal Shelter — Database Management System

A relational database system for the **QUELIFE Animal Shelter Organization**, which operates across 7 U.S. states: Wisconsin, Illinois, Missouri, Montana, California, Texas, and Nevada.

Built with **Oracle Database** and **SQL Developer**.

---

## Overview

QUELIFE manages animal rescue, shelter, adoption, medical care, staff, and financial sponsorships. This database centralizes all operations across all facilities, enabling efficient tracking, reporting, and data integrity.

---

## Entity Model

| Entity | Description |
|--------|-------------|
| **Facility** | Shelter locations across 7 states |
| **Animal** | Animals in shelter care |
| **Adopter** | Individuals applying to adopt |
| **Adoption** | Adoption event records |
| **Employee** | Shelter staff and veterinarians |
| **Employee_Hours** | Payroll / work-hour logs |
| **Sponsor** | Individuals or organizations that fund shelters |
| **Donation** | Donation records linked to sponsors and facilities |
| **Medical_Record** | Veterinary checkup and treatment history |
| **Supplier** | Vendors supplying food, medicine, equipment |
| **Facility_Supplier** | Bridge table (M:N between Facility and Supplier) |

---

## Project Structure

```
QUELIFE-DB/
├── schema/
│   └── create_tables.sql       # DDL — all CREATE TABLE statements with constraints
├── data/
│   └── insert_data.sql         # 10 sample records per table
├── queries/
│   ├── select_queries.sql      # Required SELECT queries
│   ├── update_queries.sql      # UPDATE + DELETE (business-rule queries)
│   └── delete_queries.sql      # DELETE queries
├── normalization/
│   └── normalization_notes.md  # FDs and BCNF/3NF analysis
└── docs/
    ├── Part1 FDB.pdf           # Project description & entity design
    ├── FDB part2.pdf           # ER model & relationships
    ├── FDB_Part3(Team7).pdf    # Schema creation & insert queries
    ├── FDB part4.pdf           # Required queries (SELECT/UPDATE/DELETE)
    └── Part6_FDB.pdf           # Normalization & BCNF analysis
```

---

## Key Queries

| Query | Description |
|-------|-------------|
| Dogs available by location | Lists adoptable dogs grouped by shelter location |
| Shelters without cats | Finds locations with no adoptable cats |
| Top working employee | Employee with most hours on a given date in a given state |
| Understaffed shelters | Shelters where employees outnumber housed animals |
| Payroll report | Hours worked and pay per employee for a date range |
| Salary update | 23% raise for employees working 5+ hours in a week |
| Health status sync | Auto-marks adopted animals, flags upcoming appointments |

---

## How to Run

1. Open **Oracle SQL Developer** and connect to your database
2. Run `schema/create_tables.sql` to create all tables
3. Run `data/insert_data.sql` to populate with sample data
4. Run any query file from the `queries/` folder

---

## Normalization

All tables are normalized to **BCNF** or **3NF**. See [`normalization/normalization_notes.md`](normalization/normalization_notes.md) for the full functional dependency analysis.

---

## Author

**Sai Varma Challagali** — [GitHub](https://github.com/Saivarma08)
