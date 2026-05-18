-- ============================================================
-- QUELIFE Animal Shelter Organization
-- Sample Data Insertion - 10 records per table
-- ============================================================

-- ─── FACILITY ────────────────────────────────────────────────
INSERT INTO FACILITY VALUES (1,  'QUELIFE Madison',     'Wisconsin, Madison',     4, 3, 'Yes', 'Yes');
INSERT INTO FACILITY VALUES (2,  'QUELIFE Chicago',     'Illinois, Chicago',      3, 2, 'Yes', 'Yes');
INSERT INTO FACILITY VALUES (3,  'QUELIFE St. Louis',   'Missouri, St. Louis',    2, 2, 'No',  'Yes');
INSERT INTO FACILITY VALUES (4,  'QUELIFE Billings',    'Montana, Billings',      3, 1, 'Yes', 'No');
INSERT INTO FACILITY VALUES (5,  'QUELIFE Los Angeles', 'California, Los Angeles',5, 4, 'Yes', 'Yes');
INSERT INTO FACILITY VALUES (6,  'QUELIFE Houston',     'Texas, Houston',         4, 3, 'Yes', 'Yes');
INSERT INTO FACILITY VALUES (7,  'QUELIFE Las Vegas',   'Nevada, Las Vegas',      2, 2, 'No',  'Yes');
INSERT INTO FACILITY VALUES (8,  'QUELIFE Milwaukee',   'Wisconsin, Milwaukee',   3, 2, 'Yes', 'Yes');
INSERT INTO FACILITY VALUES (9,  'QUELIFE Springfield', 'Illinois, Springfield',  2, 1, 'No',  'No');
INSERT INTO FACILITY VALUES (10, 'QUELIFE Sacramento',  'California, Sacramento', 3, 2, 'Yes', 'Yes');

-- ─── ANIMAL ──────────────────────────────────────────────────
INSERT INTO ANIMAL VALUES (1,  'Buddy',   'Dog', 'Labrador',       DATE '2020-03-15', DATE '2022-01-10', 'Stray',           'Healthy',         1);
INSERT INTO ANIMAL VALUES (2,  'Whiskers','Cat', 'Siamese',        DATE '2019-07-22', DATE '2021-06-05', 'Owner Surrender',  'Healthy',         2);
INSERT INTO ANIMAL VALUES (3,  'Max',     'Dog', 'German Shepherd',DATE '2018-11-01', DATE '2023-02-20', 'Rescue',           'Under Treatment', 3);
INSERT INTO ANIMAL VALUES (4,  'Luna',    'Cat', 'Persian',        DATE '2021-04-10', DATE '2022-09-14', 'Stray',            'Healthy',         4);
INSERT INTO ANIMAL VALUES (5,  'Charlie', 'Dog', 'Beagle',         DATE '2020-08-30', DATE '2023-03-01', 'Owner Surrender',  'Healthy',         5);
INSERT INTO ANIMAL VALUES (6,  'Tweety',  'Bird','Parakeet',       DATE '2022-01-05', DATE '2023-05-18', 'Rescue',           'Healthy',         6);
INSERT INTO ANIMAL VALUES (7,  'Rocky',   'Dog', 'Bulldog',        DATE '2019-06-12', DATE '2022-11-07', 'Transfer',         'Sick',            7);
INSERT INTO ANIMAL VALUES (8,  'Cleo',    'Cat', 'Bengal',         DATE '2021-09-25', DATE '2023-01-30', 'Born in Shelter',  'Healthy',         1);
INSERT INTO ANIMAL VALUES (9,  'Daisy',   'Dog', 'Golden Retriever',DATE '2020-12-03',DATE '2023-07-12', 'Stray',            'Injured',         2);
INSERT INTO ANIMAL VALUES (10, 'Oliver',  'Cat', 'Maine Coon',     DATE '2018-03-17', DATE '2021-04-22', 'Owner Surrender',  'Healthy',         3);

-- ─── ADOPTER ─────────────────────────────────────────────────
INSERT INTO ADOPTER VALUES (1,  'Alice Johnson',  '123 Maple St, Madison, WI',     '608-555-0101', 'alice@email.com',    2, 'Approved');
INSERT INTO ADOPTER VALUES (2,  'Brian Smith',    '456 Oak Ave, Chicago, IL',       '312-555-0202', 'brian@email.com',    0, 'Pending');
INSERT INTO ADOPTER VALUES (3,  'Carol Davis',    '789 Pine Rd, Houston, TX',       '713-555-0303', 'carol@email.com',    1, 'Approved');
INSERT INTO ADOPTER VALUES (4,  'David Lee',      '321 Elm St, Las Vegas, NV',      '702-555-0404', 'david@email.com',    0, 'Rejected');
INSERT INTO ADOPTER VALUES (5,  'Emma Brown',     '654 Cedar Ln, Los Angeles, CA',  '213-555-0505', 'emma@email.com',     3, 'Approved');
INSERT INTO ADOPTER VALUES (6,  'Frank Wilson',   '987 Birch Blvd, Billings, MT',   '406-555-0606', 'frank@email.com',    0, 'Pending');
INSERT INTO ADOPTER VALUES (7,  'Grace Martinez', '147 Walnut Dr, St. Louis, MO',   '314-555-0707', 'grace@email.com',    1, 'Approved');
INSERT INTO ADOPTER VALUES (8,  'Henry Taylor',   '258 Spruce Way, Milwaukee, WI',  '414-555-0808', 'henry@email.com',    2, 'Approved');
INSERT INTO ADOPTER VALUES (9,  'Isla Anderson',  '369 Ash Ct, Sacramento, CA',     '916-555-0909', 'isla@email.com',     0, 'Pending');
INSERT INTO ADOPTER VALUES (10, 'Jack Thomas',    '741 Poplar Pl, Springfield, IL', '217-555-1010', 'jack@email.com',     0, 'Rejected');

-- ─── EMPLOYEE ────────────────────────────────────────────────
INSERT INTO EMPLOYEE VALUES (1,  'Sarah Connor',  'Shelter Manager',       1, 'Bachelor''s',  'Animal Care',    'No',  '608-555-1001', 55000);
INSERT INTO EMPLOYEE VALUES (2,  'Tom Hardy',     'Veterinarian',          2, 'DVM',           'Veterinary',     'No',  '312-555-1002', 90000);
INSERT INTO EMPLOYEE VALUES (3,  'Lucy Liu',      'Adoption Coordinator',  3, 'Associate''s',  'Animal Welfare', 'No',  '314-555-1003', 42000);
INSERT INTO EMPLOYEE VALUES (4,  'Mike Tyson',    'Kennel Technician',     4, 'High School',   NULL,             'Yes', '406-555-1004', 32000);
INSERT INTO EMPLOYEE VALUES (5,  'Nina Patel',    'Shelter Manager',       5, 'Master''s',     'Management',     'No',  '213-555-1005', 60000);
INSERT INTO EMPLOYEE VALUES (6,  'Oscar Grant',   'Veterinarian',          6, 'DVM',           'Veterinary',     'No',  '713-555-1006', 88000);
INSERT INTO EMPLOYEE VALUES (7,  'Paula Abdul',   'Adoption Coordinator',  7, 'Bachelor''s',   'Social Work',    'No',  '702-555-1007', 40000);
INSERT INTO EMPLOYEE VALUES (8,  'Quinn Hughes',  'Kennel Technician',     1, 'High School',   NULL,             'No',  '608-555-1008', 31000);
INSERT INTO EMPLOYEE VALUES (9,  'Rachel Green',  'Shelter Manager',       2, 'Bachelor''s',   'Business Admin', 'Yes', '312-555-1009', 57000);
INSERT INTO EMPLOYEE VALUES (10, 'Sam Walton',    'Veterinarian',          3, 'DVM',           'Veterinary',     'No',  '314-555-1010', 92000);

-- ─── EMPLOYEE_HOURS ──────────────────────────────────────────
INSERT INTO EMPLOYEE_HOURS VALUES (1,  1,  DATE '2023-09-03', 8.0);
INSERT INTO EMPLOYEE_HOURS VALUES (2,  2,  DATE '2023-09-03', 7.5);
INSERT INTO EMPLOYEE_HOURS VALUES (3,  8,  DATE '2023-09-03', 9.0);
INSERT INTO EMPLOYEE_HOURS VALUES (4,  3,  DATE '2022-03-04', 6.0);
INSERT INTO EMPLOYEE_HOURS VALUES (5,  5,  DATE '2022-03-05', 8.0);
INSERT INTO EMPLOYEE_HOURS VALUES (6,  6,  DATE '2022-03-06', 7.0);
INSERT INTO EMPLOYEE_HOURS VALUES (7,  1,  DATE '2023-03-05', 6.5);
INSERT INTO EMPLOYEE_HOURS VALUES (8,  8,  DATE '2023-03-06', 5.5);
INSERT INTO EMPLOYEE_HOURS VALUES (9,  9,  DATE '2023-03-07', 4.0);
INSERT INTO EMPLOYEE_HOURS VALUES (10, 10, DATE '2023-03-08', 7.0);

-- ─── ADOPTION ────────────────────────────────────────────────
INSERT INTO ADOPTION VALUES (1, 2,  1, 3, DATE '2023-01-15', 75.00,  'Completed');
INSERT INTO ADOPTION VALUES (2, 5,  3, 7, DATE '2023-04-22', 100.00, 'Pending');
INSERT INTO ADOPTION VALUES (3, 8,  5, 1, DATE '2023-06-10', 50.00,  'Completed');
INSERT INTO ADOPTION VALUES (4, 10, 7, 3, DATE '2022-12-01', 60.00,  'Completed');
INSERT INTO ADOPTION VALUES (5, 4,  8, 5, DATE '2023-08-19', 80.00,  'Pending');

-- ─── SPONSOR ─────────────────────────────────────────────────
INSERT INTO SPONSOR VALUES (1,  'PetSmart Charities', 'PetSmart Inc.',        'petsmart@sponsor.com',  'Annual');
INSERT INTO SPONSOR VALUES (2,  'John Doe',           NULL,                   'johndoe@email.com',     'One-Time');
INSERT INTO SPONSOR VALUES (3,  'ASPCA',              'ASPCA Organization',   'aspca@sponsor.com',     'Monthly');
INSERT INTO SPONSOR VALUES (4,  'Jane Smith',         NULL,                   'janesmith@email.com',   'One-Time');
INSERT INTO SPONSOR VALUES (5,  'Purina',             'Nestle Purina PetCare','purina@sponsor.com',    'Annual');
INSERT INTO SPONSOR VALUES (6,  'Hill''s Pet',        'Hill''s Pet Nutrition','hills@sponsor.com',     'Monthly');
INSERT INTO SPONSOR VALUES (7,  'Anonymous',          NULL,                    NULL,                   'One-Time');
INSERT INTO SPONSOR VALUES (8,  'Best Friends',       'Best Friends Animal',  'bestfriends@org.com',   'Annual');
INSERT INTO SPONSOR VALUES (9,  'Robert King',        NULL,                   'robert@email.com',      'Monthly');
INSERT INTO SPONSOR VALUES (10, 'AHS',                'American Humane Soc.', 'ahs@sponsor.com',       'Annual');

-- ─── DONATION ────────────────────────────────────────────────
INSERT INTO DONATION VALUES (1,  1,  1, 5000.00,  DATE '2023-01-01', 'Animal Food');
INSERT INTO DONATION VALUES (2,  2,  2, 200.00,   DATE '2023-02-14', 'Medical Supplies');
INSERT INTO DONATION VALUES (3,  3,  3, 1500.00,  DATE '2023-03-10', 'Shelter Maintenance');
INSERT INTO DONATION VALUES (4,  4,  4, 300.00,   DATE '2023-04-05', 'Animal Care');
INSERT INTO DONATION VALUES (5,  5,  5, 3000.00,  DATE '2023-05-20', 'Animal Food');
INSERT INTO DONATION VALUES (6,  6,  6, 1000.00,  DATE '2023-06-15', 'Veterinary Equipment');
INSERT INTO DONATION VALUES (7,  7,  7, 0.00,     DATE '2023-07-04', NULL);
INSERT INTO DONATION VALUES (8,  8,  1, 2000.00,  DATE '2023-08-01', 'Infrastructure');
INSERT INTO DONATION VALUES (9,  9,  2, 500.00,   DATE '2023-09-12', 'Medical Supplies');
INSERT INTO DONATION VALUES (10, 10, 3, 4000.00,  DATE '2023-10-22', 'General Fund');

-- ─── MEDICAL_RECORD ──────────────────────────────────────────
INSERT INTO MEDICAL_RECORD VALUES (1,  1,  DATE '2023-01-10', 'Healthy',            'Vaccinations',        'Dr. Adams',   DATE '2023-07-10');
INSERT INTO MEDICAL_RECORD VALUES (2,  2,  DATE '2023-02-05', 'Minor infection',    'Antibiotics',         'Dr. Bennett', DATE '2023-03-05');
INSERT INTO MEDICAL_RECORD VALUES (3,  3,  DATE '2023-03-15', 'Leg fracture',       'Cast & Rest',         'Dr. Chen',    DATE '2023-06-15');
INSERT INTO MEDICAL_RECORD VALUES (4,  4,  DATE '2022-12-20', 'Healthy',            'Vaccinations',        'Dr. Davis',   DATE '2023-06-20');
INSERT INTO MEDICAL_RECORD VALUES (5,  5,  DATE '2023-04-08', 'Parasites',          'Deworming',           'Dr. Evans',   DATE '2023-07-08');
INSERT INTO MEDICAL_RECORD VALUES (6,  6,  DATE '2023-05-01', 'Healthy',            'Wing clipping',       'Dr. Adams',   DATE '2023-11-01');
INSERT INTO MEDICAL_RECORD VALUES (7,  7,  DATE '2023-01-25', 'Respiratory issue',  'Medication',          'Dr. Fisher',  DATE '2023-04-25');
INSERT INTO MEDICAL_RECORD VALUES (8,  8,  DATE '2023-06-14', 'Healthy',            'Routine checkup',     'Dr. Bennett', DATE '2023-12-14');
INSERT INTO MEDICAL_RECORD VALUES (9,  9,  DATE '2023-07-20', 'Sprained paw',       'Rest & Ice therapy',  'Dr. Chen',    DATE '2023-08-20');
INSERT INTO MEDICAL_RECORD VALUES (10, 10, DATE '2017-09-05', 'Dental disease',     'Dental cleaning',     'Dr. Garcia',  DATE '2018-03-05');

-- ─── SUPPLIER ────────────────────────────────────────────────
INSERT INTO SUPPLIER VALUES (1,  'PetFoodCo',      '800-555-2001', 'Animal Food');
INSERT INTO SUPPLIER VALUES (2,  'MedVet Supply',  '800-555-2002', 'Medical Supplies');
INSERT INTO SUPPLIER VALUES (3,  'CleanPaws',      '800-555-2003', 'Cleaning Supplies');
INSERT INTO SUPPLIER VALUES (4,  'ShelterBuild',   '800-555-2004', 'Infrastructure');
INSERT INTO SUPPLIER VALUES (5,  'ToyPets Inc.',   '800-555-2005', 'Animal Toys');
INSERT INTO SUPPLIER VALUES (6,  'BioLabSupply',   '800-555-2006', 'Medical Supplies');
INSERT INTO SUPPLIER VALUES (7,  'NutriPet',       '800-555-2007', 'Animal Food');
INSERT INTO SUPPLIER VALUES (8,  'SafeKennel Co.', '800-555-2008', 'Kennel Equipment');
INSERT INTO SUPPLIER VALUES (9,  'VaxWorld',       '800-555-2009', 'Vaccines');
INSERT INTO SUPPLIER VALUES (10, 'EcoClean',       '800-555-2010', 'Cleaning Supplies');

-- ─── FACILITY_SUPPLIER ───────────────────────────────────────
INSERT INTO FACILITY_SUPPLIER VALUES (1, 1, DATE '2023-01-15');
INSERT INTO FACILITY_SUPPLIER VALUES (1, 2, DATE '2023-02-10');
INSERT INTO FACILITY_SUPPLIER VALUES (2, 3, DATE '2023-01-20');
INSERT INTO FACILITY_SUPPLIER VALUES (3, 1, DATE '2023-03-05');
INSERT INTO FACILITY_SUPPLIER VALUES (4, 4, DATE '2023-04-01');
INSERT INTO FACILITY_SUPPLIER VALUES (5, 5, DATE '2023-05-10');
INSERT INTO FACILITY_SUPPLIER VALUES (6, 6, DATE '2023-06-15');
INSERT INTO FACILITY_SUPPLIER VALUES (7, 7, DATE '2020-09-01');
INSERT INTO FACILITY_SUPPLIER VALUES (8, 8, DATE '2023-08-20');
INSERT INTO FACILITY_SUPPLIER VALUES (9, 9, DATE '2023-09-11');

COMMIT;
