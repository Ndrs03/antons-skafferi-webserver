
CREATE TABLE IF NOT EXISTS Person
(
    PersonID INT AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    PRIMARY KEY (PersonID)
);

CREATE TABLE IF NOT EXISTS Employee
(
    EmployeeID INT AUTO_INCREMENT NOT NULL,
    PersonID INT NOT NULL,
    HiringDate DATE NOT NULL,
    Salary INT NOT NULL,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    UNIQUE (PersonID)
);

CREATE TABLE IF NOT EXISTS Role
(
    RoleID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Discription TEXT NOT NULL,
    HierarchyLevel INT NOT NULL,
    EmployeeID INT NOT NULL,
    PRIMARY KEY (RoleID),
    UNIQUE (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Lunch
(
    LunchID INT AUTO_INCREMENT NOT NULL,
    Date DATE NOT NULL,
    MenueItemID INT NOT NULL,
    PRIMARY KEY (LunchID),
    UNIQUE (MenueItemID)
);

CREATE TABLE IF NOT EXISTS DinnerMenu
(
    DinnerItemID INT AUTO_INCREMENT NOT NULL,
    MenuItemID INT NOT NULL,
    Price INT NOT NULL,
    PRIMARY KEY (DinnerItemID),
    UNIQUE (MenuItemID)
);

CREATE TABLE IF NOT EXISTS Ingredients
(
    IngredientID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (IngredientID)
);

CREATE TABLE IF NOT EXISTS Tables
(
    TableNumber INT AUTO_INCREMENT NOT NULL,
    RoomForPeople INT NOT NULL,
    PRIMARY KEY (TableNumber)
);

CREATE TABLE IF NOT EXISTS Orders
(
    OrderID INT AUTO_INCREMENT NOT NULL,
    TableNumber INT NOT NULL,
    EmployeeID INT NOT NULL,
    Date DATE NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TableNumber) REFERENCES Tables(TableNumber),
    UNIQUE (TableNumber),
    UNIQUE (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Shift
(
    ScheduleID INT AUTO_INCREMENT NOT NULL,
    EmployeeID INT NOT NULL,
    ShiftDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    PRIMARY KEY (ScheduleID),
    UNIQUE (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Bookings
(
    BookingID INT AUTO_INCREMENT NOT NULL,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    PersonID INT NOT NULL,
    TableNumber INT NOT NULL,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (TableNumber) REFERENCES Tables(TableNumber),
    UNIQUE (PersonID),
    UNIQUE (TableNumber)
);

CREATE TABLE IF NOT EXISTS Events
(
    EventID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTIme TIME NOT NULL,
    PRIMARY KEY (EventID)
);

CREATE TABLE IF NOT EXISTS Works_As
(
    EmployeeID INT NOT NULL,
    RoleID INT NOT NULL,
    PRIMARY KEY (EmployeeID, RoleID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

CREATE TABLE IF NOT EXISTS Works_At
(
    ScheduleID INT NOT NULL,
    EmployeeID INT NOT NULL,
    PRIMARY KEY (ScheduleID, EmployeeID),
    FOREIGN KEY (ScheduleID) REFERENCES Shift(ScheduleID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Food
(
    MenuItemID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    TimeToMake TIME NOT NULL,
    DinnerItemID INT NOT NULL,
    PRIMARY KEY (MenuItemID),
    FOREIGN KEY (DinnerItemID) REFERENCES DinnerMenu(DinnerItemID)
);

CREATE TABLE IF NOT EXISTS For_Lunch
(
    Price INT NOT NULL,
    MenuItemID INT NOT NULL,
    LunchID INT NOT NULL,
    PRIMARY KEY (MenuItemID, LunchID),
    FOREIGN KEY (MenuItemID) REFERENCES Food(MenuItemID),
    FOREIGN KEY (LunchID) REFERENCES Lunch(LunchID)
);

CREATE TABLE IF NOT EXISTS Contains
(
    MenuItemID INT NOT NULL,
    IngredientID INT NOT NULL,
    PRIMARY KEY (MenuItemID, IngredientID),
    FOREIGN KEY (MenuItemID) REFERENCES Food(MenuItemID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

CREATE TABLE Food_Order
(
    MenuItemID INT NOT NULL,
    OrderID INT NOT NULL,
    PRIMARY KEY (MenuItemID, OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES Food(MenuItemID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);