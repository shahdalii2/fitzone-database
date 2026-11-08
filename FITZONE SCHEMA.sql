CREATE DATABASE FITNESS_ZONE ;
GO;
USE FITNESS_ZONE;
GO;

CREATE TABLE MembershipPlan (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(100) NOT NULL,
    DurationMonths INT NOT NULL,
    MonthlyFee DECIMAL(10,2) NOT NULL,

    CHECK (DurationMonths > 0),
    CHECK (MonthlyFee >= 0)
);
SELECT * FROM MembershipPlan; 

CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    HireDate DATE NOT NULL,
    Specialty VARCHAR(100)
);
SELECT * FROM Trainer;

CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    RoomName VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,

    CHECK (Capacity > 0)
);
SELECT * FROM Room;

CREATE TABLE Certification (
    CertificationCode INT PRIMARY KEY,
    CertificationName VARCHAR(100) NOT NULL,
    IssuingOrganization VARCHAR(100) NOT NULL
);
SELECT * FROM Certification;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    PlanID INT NOT NULL,

    FOREIGN KEY (PlanID) REFERENCES MembershipPlan(PlanID)
);
SELECT * FROM Member;

CREATE TABLE FitnessClass (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL,
    DifficultyLevel VARCHAR(30) NOT NULL,
    ClassDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    MaxCapacity INT NOT NULL,
    TrainerID INT NOT NULL,
    RoomNumber INT NOT NULL,

    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),

    CHECK (MaxCapacity > 0)
);
SELECT * FROM FitnessClass;

CREATE TABLE Registration (
    MemberID INT NOT NULL,
    ClassID INT NOT NULL,
    RegistrationDate DATE NOT NULL,
    RegistrationStatus VARCHAR(30) NOT NULL,

    PRIMARY KEY (MemberID, ClassID),

    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ClassID) REFERENCES FitnessClass(ClassID)
);
SELECT * FROM Registration;

CREATE TABLE TrainerCertification (
    TrainerID INT NOT NULL,
    CertificationCode INT NOT NULL,
    DateEarned DATE NOT NULL,

    PRIMARY KEY (TrainerID, CertificationCode),

    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    FOREIGN KEY (CertificationCode) REFERENCES Certification(CertificationCode)
);
SELECT * FROM TrainerCertification;

INSERT INTO MembershipPlan
(PlanID, PlanName, DurationMonths, MonthlyFee)
VALUES
(1, 'Basic', 1, 500),
(2, 'Premium', 3, 1200),
(3, 'VIP', 12, 4000);

INSERT INTO Trainer
(TrainerID, FirstName, LastName, PhoneNumber, HireDate, Specialty)
VALUES
(1, 'Ahmed', 'Ali', '01012345678', '2023-01-15', 'Bodybuilding'),
(2, 'Sara', 'Mohamed', '01112345678', '2022-06-10', 'Yoga'),
(3, 'Omar', 'Hassan', '01212345678', '2024-03-20', 'Cardio');

INSERT INTO Room
(RoomNumber, RoomName, Capacity)
VALUES
(101, 'Main Hall', 30),
(102, 'Yoga Room', 20),
(103, 'Cardio Room', 25);

INSERT INTO Certification
(CertificationCode, CertificationName, IssuingOrganization)
VALUES
(1001, 'Personal Training', 'ACE'),
(1002, 'Yoga Instructor', 'Yoga Alliance'),
(1003, 'Fitness Nutrition', 'NASM');

INSERT INTO Member
(MemberID, FirstName, LastName, DateOfBirth, PhoneNumber, Street, City, PlanID)
VALUES
(1, 'Mona', 'Ali', '2000-05-10', '01098765432', 'Nasr City', 'Cairo', 1),
(2, 'Nada', 'Ahmed', '1998-08-15', '01198765432', 'Heliopolis', 'Cairo', 2),
(3, 'Youssef', 'Mohamed', '1995-12-20', '01298765432', 'Dokki', 'Giza', 3),
(4, 'Salma', 'Hassan', '2001-03-25', '01598765432', 'Maadi', 'Cairo', 1);

INSERT INTO FitnessClass
(ClassID, ClassName, DifficultyLevel, ClassDate, StartTime, MaxCapacity, TrainerID, RoomNumber)
VALUES
(1, 'Strength Training', 'Advanced', '2026-11-05', '10:00:00', 20, 1, 101),
(2, 'Yoga Session', 'Beginner', '2026-11-06', '12:00:00', 15, 2, 102),
(3, 'Cardio Workout', 'Intermediate', '2026-11-07', '16:00:00', 20, 3, 103);

INSERT INTO Registration
(MemberID, ClassID, RegistrationDate, RegistrationStatus)
VALUES
(1, 1, '2026-11-01', 'Confirmed'),
(2, 2, '2026-11-01', 'Confirmed'),
(3, 1, '2026-11-02', 'Pending'),
(4, 3, '2026-11-02', 'Confirmed'),
(1, 2, '2026-11-03', 'Confirmed');

INSERT INTO TrainerCertification
(TrainerID, CertificationCode, DateEarned)
VALUES
(1, 1001, '2022-05-10'),
(2, 1002, '2021-08-15'),
(3, 1003, '2023-02-20'),
(1, 1003, '2024-01-10');

SELECT * FROM MembershipPlan;
SELECT * FROM Trainer;
SELECT * FROM Room;
SELECT * FROM Certification;
SELECT * FROM Member;
SELECT * FROM FitnessClass;
SELECT * FROM Registration;
SELECT * FROM TrainerCertification;

