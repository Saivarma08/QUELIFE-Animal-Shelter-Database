-- ============================================================
-- QUELIFE Animal Shelter Organization
-- SELECT Queries
-- ============================================================

-- Q1: List the total number of dogs ready for adoption by location
SELECT F.Location, COUNT(A.Animal_ID) AS Total_Dogs
FROM ANIMAL A
JOIN FACILITY F ON A.Facility_ID = F.Facility_ID
WHERE A.Species = 'Dog'
  AND A.Health_Status = 'Healthy'
  AND A.Animal_ID NOT IN (SELECT Animal_ID FROM ADOPTION)
GROUP BY F.Location
ORDER BY Total_Dogs DESC;


-- Q2: Find animal shelter locations without cats available for adoption
SELECT F.Facility_Name, F.Location
FROM FACILITY F
WHERE F.Facility_ID NOT IN (
    SELECT DISTINCT A.Facility_ID
    FROM ANIMAL A
    WHERE A.Species = 'Cat'
      AND A.Health_Status = 'Healthy'
      AND A.Animal_ID NOT IN (SELECT Animal_ID FROM ADOPTION)
)
ORDER BY F.Location;


-- Q3: Find the employee(s) that worked the most hours on September 3, 2023,
--     in a Wisconsin shelter
SELECT E.Employee_Name, EH.Hours_Worked, F.Location
FROM EMPLOYEE E
JOIN EMPLOYEE_HOURS EH ON E.Employee_ID = EH.Employee_ID
JOIN FACILITY F        ON E.Facility_ID = F.Facility_ID
WHERE EH.Work_Date = DATE '2023-09-03'
  AND F.Location LIKE 'Wisconsin%'
  AND EH.Hours_Worked = (
      SELECT MAX(EH2.Hours_Worked)
      FROM EMPLOYEE_HOURS EH2
      JOIN EMPLOYEE E2 ON EH2.Employee_ID = E2.Employee_ID
      JOIN FACILITY F2 ON E2.Facility_ID  = F2.Facility_ID
      WHERE EH2.Work_Date = DATE '2023-09-03'
        AND F2.Location LIKE 'Wisconsin%'
  );


-- Q4: List shelters that have more employees than animals hosted
SELECT F.Facility_Name, F.Location,
       COUNT(DISTINCT E.Employee_ID) AS Num_Employees,
       COUNT(DISTINCT A.Animal_ID)   AS Num_Animals
FROM FACILITY F
LEFT JOIN EMPLOYEE E ON F.Facility_ID = E.Facility_ID
LEFT JOIN ANIMAL   A ON F.Facility_ID = A.Facility_ID
GROUP BY F.Facility_ID, F.Facility_Name, F.Location
HAVING COUNT(DISTINCT E.Employee_ID) > COUNT(DISTINCT A.Animal_ID)
ORDER BY F.Location;


-- Q5: Print payroll from March 4, 2022 to March 10, 2022
--     (employee name, hours worked, total salary)
SELECT E.Employee_Name,
       SUM(EH.Hours_Worked)                             AS Total_Hours,
       ROUND(SUM(EH.Hours_Worked) * (E.Salary / 2080), 2) AS Total_Pay
FROM EMPLOYEE E
JOIN EMPLOYEE_HOURS EH ON E.Employee_ID = EH.Employee_ID
WHERE EH.Work_Date BETWEEN DATE '2022-03-04' AND DATE '2022-03-10'
GROUP BY E.Employee_ID, E.Employee_Name, E.Salary
ORDER BY Total_Pay DESC;
