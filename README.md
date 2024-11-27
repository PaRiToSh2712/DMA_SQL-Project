# Patient Information Management System (PIMS)

## Overview

The **Patient Information Management System (PIMS)** is an innovative solution designed to streamline and optimize the management of patient data within healthcare facilities. By centralizing patient data and automating administrative tasks, the PIMS enhances operational efficiency, improves communication among healthcare professionals, and delivers better patient outcomes.

---

## Key Features

- **Secure Storage**: Robust storage and retrieval of patient records.
- **Doctor-Patient Assignment**: Dynamic and efficient doctor-patient matching.
- **Medication & Treatment Tracking**: Comprehensive tracking for seamless care management.
- **User-Friendly Interface**: Easy navigation for healthcare professionals.
- **Reporting & Analytics**: Customizable insights for data-driven decision-making.

---

## Objectives

The system's primary goal is to enhance patient outcomes by prioritizing:
- **Data Accuracy**: Ensuring reliable and validated patient data.
- **Data Security**: Complying with healthcare regulations to protect sensitive information.
- **Accessibility**: Providing healthcare practitioners with on-the-go access to patient data.

---

## System Requirements

1. **Relationships**:
   - A patient can have multiple appointments, treatments, and prescriptions but belongs to one doctor.
   - Each department is associated with one head doctor.
   - A pharmacy may serve multiple treatments, but each treatment links to one pharmacy.

2. **Data Models**:
   - Integration of Electronic Health Records (EHRs), appointment scheduling, billing, and medical history.

3. **Scalability**:
   - Designed for modular expansion with support for additional features like mobile accessibility.

---

## Conceptual and Relational Model

### Entity-Relationship Diagram
The conceptual model includes entities like `Patient`, `Doctor`, `Medication`, `Appointment`, and their relationships, ensuring comprehensive data linkage across the system.

### Relational Model Mapping
- **Primary Keys**: Underlined.
- **Foreign Keys**: Capitalized.
  
#### Example Tables:
- **Department**: `(D_Id, HOD, D_Name)`
- **Ward**: `(Ward_Id, Ward_Name, D_Id)` → `D_Id` is a Foreign Key.
- **Patient**: `(P_Id, Name, DOB, Gender, Contact, Address, Doctor_Id, Ward_Id)` → `Doctor_Id` and `Ward_Id` are Foreign Keys.

---

## SQL Implementation

### Example Queries

1. **Retrieve all patients and their assigned doctors**:
   ```sql
   SELECT P.Name, D.Name AS DoctorName
   FROM Patient P
   JOIN Doctor D ON P.Doctor_Id = D.Doctor_Id;
