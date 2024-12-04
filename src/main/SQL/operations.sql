-- Select all data from Person table
SELECT * FROM Person;

-- Select all data from Employee table
SELECT * FROM Employee;

-- Select all data from Role table
SELECT * FROM Role;

-- Select all data from Lunch table
SELECT * FROM Lunch;

-- Select all data from DinnerMenu table
SELECT * FROM DinnerMenu;

-- Select all data from Ingredients table
SELECT * FROM Ingredients;

-- Select all data from Tables table
SELECT * FROM Tables;

-- Select all data from Orders table
SELECT * FROM Orders;

-- Select all data from Shift table
SELECT * FROM Shift;

-- Select all data from Bookings table
SELECT * FROM Bookings;

-- Select all data from Events table
SELECT * FROM Events;

-- Select all data from Works_As table
SELECT * FROM Works_As;

-- Select all data from Works_At table
SELECT * FROM Works_At;

-- Select all data from Food table
SELECT * FROM Food;

-- Select all data from For_Lunch table
SELECT * FROM For_Lunch;

-- Select all data from Contains table
SELECT * FROM Contains;

-- Select all data from Food_Order table
SELECT * FROM Food_Order;

-- Count the number of employees
SELECT COUNT(*) AS NumberOfEmployees FROM Employee;

-- Get the average salary of employees
SELECT AVG(Salary) AS AverageSalary FROM Employee;

-- Get the total number of bookings
SELECT COUNT(*) AS TotalBookings FROM Bookings;

-- Get the details of all events happening on a specific date
SELECT * FROM Events WHERE Date = '2023-01-01';

-- Get the details of all shifts for a specific employee
SELECT * FROM Shift WHERE EmployeeID = 1;

-- Get the details of all orders for a specific table
SELECT * FROM Orders WHERE TableNumber = 1;

-- Get the details of all food items in a specific order
SELECT Food.Name, Food.Description, Food.TimeToMake
FROM Food
         JOIN Food_Order ON Food.MenuItemID = Food_Order.MenuItemID
WHERE Food_Order.OrderID = 1;

-- Get the details of all ingredients for a specific food item
SELECT Ingredients.Name
FROM Ingredients
         JOIN Contains ON Ingredients.IngredientID = Contains.IngredientID
WHERE Contains.MenuItemID = 1;