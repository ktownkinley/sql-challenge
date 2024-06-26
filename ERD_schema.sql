DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS DepartmentEmployees;
DROP TABLE IF EXISTS DepartmentManagers;
DROP TABLE IF EXISTS Salaries;

CREATE TABLE Titles (
    TitleID VARCHAR(30) NOT NULL,
    Title VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        TitleID
     )
);

CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    EmployeeTitleID VARCHAR(30) NOT NULL,
    BirthDate date NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Sex VARCHAR(1) NOT NULL,
    HireDate date NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        EmployeeID
     )
);

CREATE TABLE Departments (
    DepartmentID VARCHAR(30) NOT NULL,
    DepartmentName VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        DepartmentID
     )
);

CREATE TABLE DepartmentEmployees (
    EmployeeID int NOT NULL,
    DepartmentID VARCHAR(30) NOT NULL
);

CREATE TABLE DepartmentManagers (
	DepartmentID VARCHAR(30) NOT NULL,
    EmployeeID int NOT NULL
);

CREATE TABLE Salaries (
    EmployeeID int NOT NULL,
    Salary money NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_EmployeeTitleID FOREIGN KEY(EmployeeTitleID)
REFERENCES Titles (TitleID);

ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employees (EmployeeID);

ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_DepartmentID FOREIGN KEY(DepartmentID)
REFERENCES Departments (DepartmentID);

ALTER TABLE DepartmentManagers ADD CONSTRAINT fk_DepartmentManagers_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employees (EmployeeID);

ALTER TABLE DepartmentManagers ADD CONSTRAINT fk_DepartmentManagers_DepartmentID FOREIGN KEY(DepartmentID)
REFERENCES Departments (DepartmentID);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employees (EmployeeID);
