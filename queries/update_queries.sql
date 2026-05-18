-- ============================================================
-- QUELIFE Animal Shelter Organization
-- UPDATE Queries
-- ============================================================

-- U1: Update health status of animals with upcoming medical appointments
--     (next appointment within 30 days) to 'Under Treatment'
UPDATE ANIMAL
SET Health_Status = 'Under Treatment'
WHERE Animal_ID IN (
    SELECT Animal_ID
    FROM MEDICAL_RECORD
    WHERE Next_Appt BETWEEN SYSDATE AND SYSDATE + 30
)
AND Health_Status != 'Deceased';


-- U2: Increase adoption fee by 10% for animals younger than 1 year
UPDATE ADOPTION
SET Adoption_Fee = ROUND(Adoption_Fee * 1.10, 2)
WHERE Animal_ID IN (
    SELECT Animal_ID
    FROM ANIMAL
    WHERE MONTHS_BETWEEN(SYSDATE, Date_of_Birth) < 12
);


-- U3: Update approval status to 'Approved' for adopters who have
--     successfully adopted before (Previous_Adoptions > 0)
UPDATE ADOPTER
SET Approval_Status = 'Approved'
WHERE Previous_Adoptions > 0
  AND Approval_Status = 'Pending';


-- U4: Update employee role for those who have completed new certifications
UPDATE EMPLOYEE
SET Role = 'Senior Veterinarian'
WHERE Certification = 'Veterinary'
  AND Role = 'Veterinarian'
  AND Education = 'DVM';


-- U5: Update donation purpose for anonymous donations ($0 or NULL purpose)
UPDATE DONATION
SET Purpose = 'General Fund'
WHERE (Purpose IS NULL OR Purpose = '')
  AND Sponsor_ID IN (SELECT Sponsor_ID FROM SPONSOR WHERE Sponsor_Name = 'Anonymous');


-- U6: Mark animals as 'Adopted' if they have an adoption record
UPDATE ANIMAL
SET Health_Status = 'Adopted'
WHERE Animal_ID IN (SELECT Animal_ID FROM ADOPTION);


-- U7: Increase salaries by 23% for employees who worked more than 5 hours
--     between March 4, 2023 and March 10, 2023
UPDATE EMPLOYEE
SET Salary = ROUND(Salary * 1.23, 2)
WHERE Employee_ID IN (
    SELECT Employee_ID
    FROM EMPLOYEE_HOURS
    WHERE Work_Date BETWEEN DATE '2023-03-04' AND DATE '2023-03-10'
    GROUP BY Employee_ID
    HAVING SUM(Hours_Worked) > 5
);


-- U8: Delete employees with criminal records working in Illinois locations
DELETE FROM EMPLOYEE
WHERE Criminal_Record = 'Yes'
  AND Facility_ID IN (
      SELECT Facility_ID
      FROM FACILITY
      WHERE Location LIKE 'Illinois%'
  );

COMMIT;
