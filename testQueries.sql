
INSERT INTO MemberAccountInformation (Email, Password, LoyaltyPoints) 
VALUES ('sameer.naoroz@gmail.com', 'stmoh', 10);

INSERT INTO AdminLoginInfo (Email, Password, Role) 
VALUES ('admin@gmail.com', 'poland', 'Manager');

INSERT INTO AdminRole (Role, EditAccess) 
VALUES ('Manager', TRUE);

INSERT INTO Member (Name, Email) 
VALUES ('Sameer Ahmadzai Dough', 'sameer.naoroz@gmail.com');

INSERT INTO AdminInfo (Name, Email) 
VALUES ('Mohammad Stateieh', 'admin@gmail.com');

INSERT INTO Trainer (Name, Specialization, Availability) 
VALUES ('Luka Grahek Smith', 'Baskkentball', TRUE);

INSERT INTO Room (Capacity) 
VALUES (20);

INSERT INTO EquipmentInformation (Type, MaintenanceSchedule, LastCheckUp) 
VALUES ('Treadmill', '2023-12-01', '2023-06-01');

INSERT INTO FitnessClass (ClassName, TrainerID, RoomID) 
VALUES ('Yoga Basics', 1, 1);

INSERT INTO FitnessClassSchedule (ClassID, ScheduledTime) 
VALUES (1, '2023-12-10 10:00:00');

INSERT INTO MemberHealthMetrics (MemberID, Weight, Height, BodyFatPercentage) 
VALUES (1, 70, 1.75, 15);

INSERT INTO MemberFitnessGoals (MemberID, FitnessGoal) 
VALUES (1, 'Increase Strength');

INSERT INTO TrainerRegularClients (TrainerID, MemberID) 
VALUES (1, 1);

INSERT INTO BillingInfo (MemberID, Date, ServiceType) 
VALUES (1, '2023-12-01', 'Yoga Class');

INSERT INTO ServiceBillingInfo (ServiceType, Price, PointsAwarded) 
VALUES ('Yoga Class', 50, 5);

INSERT INTO PersonalTrainingSession (MemberID, TrainerID) 
VALUES (1, 1);

INSERT INTO PersonalTrainingInfo (SessionID, ProgressNotes, BillingID, ScheduledTime) 
VALUES (1, 'Good progress in flexibility', 1, '2023-12-10 11:00:00');

INSERT INTO FitnessClassAttendingMembers (ClassID, MemberID) 
VALUES (1, 1);

INSERT INTO EquipmentUsageSchedule (EquipmentID, UsageTime) 
VALUES (1, '1 hour');

INSERT INTO EquipmentTypeInformation (Type, RecommendedCheckUp) 
VALUES ('Treadmill', '6 months');

UPDATE MemberAccountInformation 
SET LoyaltyPoints = 20 
WHERE Email = 'sameer.naoroz@gmail.com';

UPDATE AdminLoginInfo 
SET Password = 'newpassword' 
WHERE Email = 'admin@gmail.com';

UPDATE Trainer 
SET Availability = FALSE 
WHERE Name = 'Luka Grahek Smith';

UPDATE Room 
SET Capacity = 25 
WHERE RoomID = 1;

UPDATE EquipmentInformation 
SET LastCheckUp = '2023-07-01' 
WHERE EquipmentID = 1;

DELETE FROM FitnessClassAttendingMembers 
WHERE ClassID = 1 AND MemberID = 1;

DELETE FROM PersonalTrainingInfo 
WHERE SessionID = 1;

DELETE FROM PersonalTrainingSession 
WHERE SessionID = 1;

DELETE FROM BillingInfo 
WHERE BillingID = 1;

DELETE FROM MemberFitnessGoals 
WHERE MemberID = 1;

SELECT * 
FROM MemberAccountInformation;

SELECT Email, Role 
FROM AdminLoginInfo 
WHERE Role = 'Manager';

SELECT Name, Specialization 
FROM Trainer 
WHERE Availability = TRUE;

SELECT RoomID, Capacity 
FROM Room;

SELECT Type, MaintenanceSchedule, LastCheckUp 
FROM EquipmentInformation 
WHERE LastCheckUp > '2023-06-01';