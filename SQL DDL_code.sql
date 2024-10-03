create database CrimeReportingSystem
go
use CrimeReportingSystem
go

CREATE TABLE Victims (
    VictimID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10),
    ContactInformation NVARCHAR(255)
);

CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10),
    ContactInformation NVARCHAR(255)
);

CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY IDENTITY,
    AgencyName NVARCHAR(100) NOT NULL,
    Jurisdiction NVARCHAR(100),
    ContactInformation NVARCHAR(255)
);

CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BadgeNumber NVARCHAR(50) UNIQUE,
    Rank NVARCHAR(50),
    ContactInformation NVARCHAR(255),
    AgencyID INT FOREIGN KEY REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY IDENTITY,
    IncidentType NVARCHAR(50),
    IncidentDate DATETIME NOT NULL,
    Location GEOGRAPHY,
    Description NVARCHAR(255),
    Status NVARCHAR(50),
    VictimID INT FOREIGN KEY REFERENCES Victims(VictimID),
    SuspectID INT FOREIGN KEY REFERENCES Suspects(SuspectID),
    AgencyID INT FOREIGN KEY REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY IDENTITY,
    Description NVARCHAR(255),
    LocationFound NVARCHAR(255),
    IncidentID INT FOREIGN KEY REFERENCES Incidents(IncidentID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY IDENTITY,
    IncidentID INT FOREIGN KEY REFERENCES Incidents(IncidentID),
    ReportingOfficer INT FOREIGN KEY REFERENCES Officers(OfficerID),
    ReportDate DATETIME,
    ReportDetails NVARCHAR(MAX),
    Status NVARCHAR(50)
);
