-- MemberAccountInformation table
CREATE TABLE MemberAccountInformation (
    Email TEXT PRIMARY KEY,
    Password TEXT NOT NULL,
    LoyaltyPoints INTEGER DEFAULT 0
);

-- Member table
CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL REFERENCES MemberAccountInformation(Email)
);




-- AdminRole table
CREATE TABLE AdminRole (
    Role TEXT NOT NULL,
    EditAccess BOOLEAN NOT NULL
);

-- Trainer table
CREATE TABLE Trainer (
    TrainerID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Specialization TEXT,
    Availability BOOLEAN NOT NULL
);

-- Room table
CREATE TABLE Room (
    RoomID SERIAL PRIMARY KEY,
    Capacity INTEGER NOT NULL
);

-- EquipmentInformation table
CREATE TABLE EquipmentInformation (
    EquipmentID SERIAL PRIMARY KEY,
    Type TEXT NOT NULL,
    MaintenanceSchedule DATE NOT NULL,
    LastCheckUp DATE NOT NULL
);

-- FitnessClass table
CREATE TABLE FitnessClass (
    ClassID SERIAL PRIMARY KEY,
    ClassName TEXT NOT NULL,
    TrainerID INTEGER REFERENCES Trainer(TrainerID),
    RoomID INTEGER REFERENCES Room(RoomID)
);

-- FitnessClassSchedule table
CREATE TABLE FitnessClassSchedule (
    ClassID INTEGER REFERENCES FitnessClass(ClassID),
    ScheduledTime TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- MemberHealthMetrics table
CREATE TABLE MemberHealthMetrics (
    MemberID INTEGER PRIMARY KEY REFERENCES Member(MemberID),
    Weight NUMERIC,
    Height NUMERIC,
    BodyFatPercentage NUMERIC
);

-- MemberFitnessGoals table
CREATE TABLE MemberFitnessGoals (
    MemberID INTEGER REFERENCES Member(MemberID),
    FitnessGoal TEXT
);

-- TrainerRegularClients table
CREATE TABLE TrainerRegularClients (
    TrainerID INTEGER REFERENCES Trainer(TrainerID),
    MemberID INTEGER REFERENCES Member(MemberID)
);

-- BillingInfo table
CREATE TABLE BillingInfo (
    BillingID SERIAL PRIMARY KEY,
    MemberID INTEGER REFERENCES Member(MemberID),
    Date DATE NOT NULL,
    ServiceType TEXT NOT NULL
);

-- ServiceBillingInfo table
CREATE TABLE ServiceBillingInfo (
    ServiceType TEXT PRIMARY KEY,
    Price NUMERIC NOT NULL,
    PointsAwarded INTEGER NOT NULL
);

-- PersonalTrainingSession table
CREATE TABLE PersonalTrainingSession (
    SessionID SERIAL PRIMARY KEY,
    MemberID INTEGER REFERENCES Member(MemberID),
    TrainerID INTEGER REFERENCES Trainer(TrainerID)
);

-- PersonalTrainingInfo table
CREATE TABLE PersonalTrainingInfo (
    SessionID INTEGER PRIMARY KEY REFERENCES PersonalTrainingSession(SessionID),
    ProgressNotes TEXT,
    BillingID INTEGER REFERENCES BillingInfo(BillingID),
    ScheduledTime TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- FitnessClassAttendingMembers table (junction table for many-to-many relationship)
CREATE TABLE FitnessClassAttendingMembers (
    ClassID INTEGER REFERENCES FitnessClass(ClassID),
    MemberID INTEGER REFERENCES Member(MemberID),
    PRIMARY KEY (ClassID, MemberID)
);

-- AdminLoginInfo table
CREATE TABLE AdminLoginInfo (
    Email TEXT PRIMARY KEY,
    Password TEXT NOT NULL,
    Role TEXT NOT NULL
);

-- EquipmentUsageSchedule table
CREATE TABLE EquipmentUsageSchedule (
    EquipmentID INTEGER PRIMARY KEY REFERENCES EquipmentInformation(EquipmentID),
    UsageTime INTERVAL NOT NULL
);

-- EquipmentTypeInformation table
CREATE TABLE EquipmentTypeInformation (
    Type TEXT PRIMARY KEY,
    RecommendedCheckUp INTERVAL NOT NULL
);

-- AdminInfo table
CREATE TABLE AdminInfo (
    StaffID SERIAL PRIMARY KEY ,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL REFERENCES AdminLoginInfo(Email)
);