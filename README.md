# ASP.NET To-Do List Web Application

This project is a fully functional To-Do List web application developed using **ASP.NET Web Forms**, **C#**, and **SQL Server**.  
It provides a complete end-to-end task management system with login, registration, task CRUD operations, priority labeling, and filtering features.  
The application demonstrates strong understanding of full-stack workflows, session handling, UI/UX design, and database integration.

---

## 1. Overview

This application allows users to:

- Create a personal account  
- Log in securely  
- Add, edit, update, and delete tasks  
- Categorize tasks by priority  
- Mark tasks as completed or pending  
- Filter tasks based on their status  
- View clean tabular representation of tasks with automatic numbering  
- Log out securely with session clearance  

The project is built with a focus on clarity, user experience, and practical real-world functionality.

---

## 2. Features

### 2.1 User Authentication
- Dedicated registration page  
- Secure login using session variables  
- Protected pages (only logged-in users can access tasks)  
- Session-based access validation  
- Logout functionality that clears session and redirects to login

---

### 2.2 Task Management (CRUD Operations)
The task module provides:

- Creating tasks (title, description, priority)  
- Inline editing through GridView  
- Updating completion status  
- Deleting tasks  
- Automatic refresh after each change  

All database operations use **parameterized SQL commands** for safety.

---

### 2.3 Priority System
Each task includes a priority level:

- High  
- Medium  
- Low  

The UI shows corresponding colored badges.  
Dropdown selection is available during editing.

---

### 2.4 Task Filters
Users can filter tasks quickly by:

- Show All  
- Completed  
- Pending  

Filtering works via `ViewState["CurrentFilter"]` ensuring state persistence across postbacks.

---

### 2.5 User Interface and Experience

The application includes a clean and modern layout:

- Consistent color palette  
- Gradient action buttons  
- Rounded card layout for main container  
- Styled form inputs and dropdowns  
- Responsive layout for mobile devices  
- Hover effects and alternating row colors in GridView  
- Logout button placed at the top-right  
- Priority badges for easy visibility  

---

## 3. Technology Stack

### Frontend
- ASP.NET Web Forms  
- HTML5  
- CSS3  
- Google Fonts (Baloo 2)

### Backend
- C#  
- ASP.NET Web Forms Lifecycle  
- Session management  
- Parameterized SQL queries  

### Database
- SQL Server Express / LocalDB  
- Normalized table design: Users & Tasks

---

## 4. Database Design

### 4.1 Users Table
| Column   | Type            | Description          |
|----------|------------------|----------------------|
| UserID   | INT (Identity)   | Primary key          |
| Name     | NVARCHAR         | Full name            |
| Email    | NVARCHAR         | Unique email         |
| Password | NVARCHAR         | User password        |

---

### 4.2 Tasks Table
| Column       | Type              | Description                          |
|--------------|-------------------|--------------------------------------|
| TaskID       | INT (Identity)    | Primary key                          |
| Title        | NVARCHAR          | Task title                           |
| Description  | NVARCHAR          | Task details                         |
| Priority     | NVARCHAR          | High / Medium / Low                  |
| IsCompleted  | BIT               | Completion status                    |
| CreatedDate  | DATETIME          | Timestamp of task creation           |
| UserID       | INT (Foreign Key) | References Users table               |

---

## 5. How to Run the Project

### Step 1: Clone the Repository
