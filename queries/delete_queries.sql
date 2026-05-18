-- ============================================================
-- QUELIFE Animal Shelter Organization
-- DELETE Queries
-- ============================================================

-- D1: Delete old medical records (older than 5 years)
DELETE FROM MEDICAL_RECORD
WHERE Checkup_Date < ADD_MONTHS(SYSDATE, -60);


-- D2: Delete adoption records of rejected adopters
DELETE FROM ADOPTION
WHERE Adopter_ID IN (
    SELECT Adopter_ID
    FROM ADOPTER
    WHERE Approval_Status = 'Rejected'
);


-- D3: Delete adopters with 'Rejected' status and no adoptions
DELETE FROM ADOPTER
WHERE Approval_Status = 'Rejected'
  AND Adopter_ID NOT IN (SELECT DISTINCT Adopter_ID FROM ADOPTION);


-- D4: Delete animals that have passed away (Deceased)
DELETE FROM MEDICAL_RECORD
WHERE Animal_ID IN (
    SELECT Animal_ID FROM ANIMAL WHERE Health_Status = 'Deceased'
);

DELETE FROM ANIMAL
WHERE Health_Status = 'Deceased';


-- D5: Delete supplier records if they haven't supplied in over 2 years
DELETE FROM SUPPLIER
WHERE Supplier_ID NOT IN (
    SELECT DISTINCT Supplier_ID
    FROM FACILITY_SUPPLIER
    WHERE Supply_Date >= ADD_MONTHS(SYSDATE, -24)
);


-- D6: Remove abandoned donation records with $0 amount
DELETE FROM DONATION
WHERE Amount = 0;


COMMIT;
