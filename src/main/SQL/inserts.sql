-- Insert data into Person table
INSERT INTO Person (FirstName, LastName, DateOfBirth, Email, PhoneNumber)
VALUES ('Alice', 'Johnson', '1985-03-15', 'alice.johnson@example.com', '5551234567'),
       ('Bob', 'Brown', '1978-07-22', 'bob.brown@example.com', '5559876543');

-- Insert data into Employee table
INSERT INTO Employee (PersonID, HiringDate, Salary)
VALUES (1, '2019-05-01', 45000),
       (2, '2018-11-15', 55000);

-- Insert data into Role table
INSERT INTO Role (Name, Discription, HierarchyLevel, EmployeeID)
VALUES ('Waiter', 'Serves food', 3, 1),
       ('Sous Chef', 'Assists the chef', 2, 2);

-- Insert data into Lunch table
INSERT INTO Lunch (Date, MenueItemID)
VALUES ('2023-02-01', 1),
       ('2023-02-02', 2);

-- Insert data into DinnerMenu table
INSERT INTO DinnerMenu (MenuItemID, Price)
VALUES (1, 30),
       (2, 35);

-- Insert data into Ingredients table
INSERT INTO Ingredients (Name)
VALUES ('Basil'),
       ('Garlic');

-- Insert data into Tables table
INSERT INTO Tables (RoomForPeople)
VALUES (2),
       (8);

-- Insert data into Orders table
INSERT INTO Orders (TableNumber, EmployeeID, Date)
VALUES (1, 1, '2023-02-01'),
       (2, 2, '2023-02-02');

-- Insert data into Shift table
INSERT INTO Shift (EmployeeID, ShiftDate, StartTime, EndTime)
VALUES (1, '2023-02-01', '08:00', '16:00'),
       (2, '2023-02-02', '09:00', '17:00');

-- Insert data into Bookings table
INSERT INTO Bookings (Date, StartTime, EndTime, PersonID, TableNumber)
VALUES ('2023-02-01', '10:00', '12:00', 1, 1),
       ('2023-02-02', '11:00', '13:00', 2, 2);

-- Insert data into Events table
INSERT INTO Events (Name, Description, Date, StartTime, EndTIme)
VALUES ('Conference', 'Tech Conference', '2023-02-01', '14:00', '16:00'),
       ('Workshop', 'Cooking Workshop', '2023-02-02', '15:00', '17:00');

-- Insert data into Works_As table
INSERT INTO Works_As (EmployeeID, RoleID)
VALUES (1, 1),
       (2, 2);

-- Insert data into Works_At table
INSERT INTO Works_At (ScheduleID, EmployeeID)
VALUES (1, 1),
       (2, 2);

-- Insert data into Food table
INSERT INTO Food (Name, Description, TimeToMake, DinnerItemID)
VALUES ('Salad', 'Fresh garden salad', '00:15:00', 1),
       ('Soup', 'Hearty vegetable soup', '00:20:00', 2);

-- Insert data into For_Lunch table
INSERT INTO For_Lunch (Price, MenuItemID, LunchID)
VALUES (8, 1, 1),
       (9, 2, 2);

-- Insert data into Contains table (Food and Ingredients)
INSERT INTO Contains (MenuItemID, IngredientID)
VALUES (1, 1),
       (1, 2),
       (2, 1);

-- Insert data into Food_Order table
INSERT INTO Food_Order (MenuItemID, OrderID)
VALUES (1, 1),
       (2, 2);