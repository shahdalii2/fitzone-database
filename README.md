# FitZone Fitness Center Database

Database design project: ERD, relational mapping, and SQL schema.

## Contents
- `fitzone_schema.sql`: SQL Server script (CREATE TABLE + sample data)
- `erd.png`: conceptual ERD

## Tables
MembershipPlan, Member, Trainer, Room, Certification,
FitnessClass, Registration, TrainerCertification

## Design notes
- Member and FitnessClass are many-to-many, resolved by Registration
- Trainer and Certification are many-to-many, resolved by TrainerCertification
- Constraints used: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK
