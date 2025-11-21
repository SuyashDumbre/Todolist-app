#To-Do List Web Application

This project is a fully functional To-Do List web application developed using ASP.NET Web Forms, C#, and SQL Server.
It provides a complete end-to-end task management system with login, registration, task CRUD operations, priority labeling, and filtering features.
The application demonstrates strong understanding of full-stack workflows, session handling, UI/UX design, and database integration.

1. Overview

This application allows users to:

Create a personal account

Log in securely

Add, edit, update, and delete tasks

Categorize tasks by priority

Mark tasks as completed or pending

Filter tasks based on their status

View clean tabular representation of tasks with automatic numbering

Log out safely with session clearance

The project is built with a focus on clarity, user experience, and practical real-world functionality.

2. Features
2.1 User Authentication

Dedicated registration page with validation

Secure login form using session variables

Only authenticated users can access the main task page

Session-based access protection using:

if (Session["UserID"] == null) Response.Redirect("login.aspx");


Logout function that clears all user-specific session data

2.2 Task Management (CRUD Operations)

Each task entry supports:

Creation (Title, Description, Priority)

Inline editing using GridView edit mode

Deletion with confirmation

Updating of completion status

Automatic refresh after each operation

All database queries use parameterized commands for security.

2.3 Priority System

Each task contains one of three priority values:

High

Medium

Low

The UI uses visual badges to clearly distinguish priority levels.
During editing, a dropdown menu allows easy modification of the priority.

2.4 Task Filters

Users can filter tasks with one click:

Show All

Show Completed

Show Pending

Filtering is managed through ViewState["CurrentFilter"] to maintain state across postbacks.

2.5 User Interface and Experience

The interface is crafted with a clean, modern aesthetic:

Balanced color palette consistent throughout the application

Rounded card structure for main container

Responsive layout with mobile-friendly adaption

Styled input fields, dropdowns, and buttons

GridView enhanced with hover effects, alternating row colors, and professional spacing

Dedicated logout button placed in the top-right corner

Clear separation between sections for readability

3. Technology Stack
Frontend

ASP.NET Web Forms

HTML5

CSS3

Google Fonts (Baloo 2)

Backend

C#

ASP.NET WebForms Page Lifecycle

Parameterized SQL commands

Database

SQL Server Express or LocalDB

A normalized schema containing two core tables: Users and Tasks

4. Database Design
4.1 Users Table
Column	Type	Description
UserID	INT (Identity)	Primary key
Name	NVARCHAR	User’s full name
Email	NVARCHAR	User’s email (unique)
Password	NVARCHAR	User’s password
4.2 Tasks Table
Column	Type	Description
TaskID	INT (Identity)	Primary key
Title	NVARCHAR	Task title
Description	NVARCHAR	Task details
Priority	NVARCHAR	High / Medium / Low
IsCompleted	BIT	Completion status
CreatedDate	DATETIME	Timestamp of task creation
UserID	INT (Foreign Key)	Linked to Users table
5. How to Run the Project
Step 1: Clone the Repository
git clone https://github.com/yourusername/your-repo-name.git

Step 2: Open the Solution

Launch Visual Studio

Open the .sln file included in the repository

Build the solution

Step 3: Configure the Database

Create a SQL Server database named todoapp

Run the SQL script provided in the repository (contains schema and table creation)

Update the connection string in Web.config if your server name differs

Step 4: Run the Application

Press F5 in Visual Studio

Register a new user

Log in and begin adding tasks

6. Project Structure
Root Folder
│
├── register.aspx
├── login.aspx
├── Managetask.aspx
├── register.aspx.cs
├── login.aspx.cs
├── Managetask.aspx.cs
├── Web.config
└── Database Script (optional)

7. Key Learning Outcomes

This project demonstrates:

Building multi-page ASP.NET WebForms applications

Managing user sessions

Handling SQL Server queries securely

Implementing GridView with editing, updating, deleting

Maintaining ViewState and managing postbacks

Designing professional UI layouts without external CSS frameworks

Using C# for backend logic and event handling
