#Simple Query
select * from patient
where patient_id='P001';

#Retrieve all patients along with their assigned doctors:(Join Query)
SELECT Patient.Patient_id, Patient.Name AS Patient_Name,  Doctor.Doctor_name
FROM Patient
INNER JOIN Doctor ON Patient.doctor_id = Doctor.Doctor_id;

#Count the number of appointments for each doctor:(aggregate query)
SELECT doctor_id, COUNT(*) AS num_appointments
FROM Appointment
GROUP BY doctor_id;

#Retrieve the details of patients who have appointments on a specific date(Join Query)
SELECT Appointment.*, Patient.Name AS Patient_Name, Patient.Gender, Patient.DOB
FROM Appointment
INNER JOIN Patient ON Appointment.Patient_id = Patient.Patient_id
WHERE A_date = '2024-03-15';



# patient with their doctor name and department name(Join)
SELECT 
    Patient.Patient_id,  Patient.Name AS Patient_Name, Patient.DOB, Patient.Gender,
    Doctor.Doctor_id, Doctor.Doctor_name, 
    Doctor.specialization,department.d_id, 
    department.d_name AS department_name
FROM 
    Patient
INNER JOIN 
    Doctor ON Patient.doctor_id = Doctor.Doctor_id
INNER JOIN 
    department ON department.d_id = (
        SELECT 
            d_id 
        FROM 
            Doctor AS d 
        WHERE 
            d.Doctor_id = Patient.doctor_id
    );

# retrieve the names of patients who have appointments for a specific type of appointment (e.g., "Consultation")
# Subquery
SELECT Name
FROM Patient
WHERE Patient_id IN (
    SELECT Patient_id
    FROM Appointment
    WHERE A_type = 'Consultation'
);

#Correlated Query getting the patient name with the earliest appointment
SELECT Name
FROM Patient p
WHERE DOB = (
    SELECT MIN(DOB)
    FROM Patient
);

#exist/Not exist  query that checks if there are any doctors who are not assigned to any research project
SELECT Doctor_name
FROM Doctor d
WHERE NOT EXISTS (
    SELECT 1
    FROM Research_Project rp
    WHERE rp.lead_doctor = d.Doctor_id
);


#Set Operations query to retrieve the names of patients who have appointments and the names of doctors who are assigned to treatment plans
SELECT Name
FROM Patient p
WHERE EXISTS (
    SELECT 1
    FROM Appointment a
    WHERE a.Patient_id = p.Patient_id
)
UNION
SELECT Doctor_name
FROM Doctor d
WHERE EXISTS (
    SELECT 1
    FROM Treatment t
    WHERE t.M_id = d.Doctor_id
);



# Subqueries in select
SELECT m.M_name, subquery.treatment_count
FROM Medication m,
    (SELECT M_id, COUNT(*) AS treatment_count
     FROM Treatment
     GROUP BY M_id) AS subquery
WHERE m.M_id = subquery.M_id;







SELECT Patient_id, Name, Gender, Contact, Address
FROM Patient
WHERE DOB >= '1980-01-01' AND DOB <= '1990-12-31';












