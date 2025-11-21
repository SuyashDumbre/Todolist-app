
---
# 📝 ASP.NET To-Do List Web Application

This project is a fully functional **To-Do List Web App** built using **ASP.NET Web Forms**, **C#**, and **SQL Server**.  
It includes user authentication, task management, priority labels, filtering features, and a polished, responsive UI.  
The application demonstrates strong full-stack development skills, session handling, UI/UX, and SQL integration.

---

## 📌 1. Overview

This application allows users to:

- Create an account  
- Log in securely  
- Add, edit, update, and delete tasks  
- Assign priority levels  
- Mark tasks as completed or pending  
- Filter tasks by status  
- View tasks with automatic serial numbering  
- Log out safely  

The project focuses on clean UI, smooth UX, and practical functionality.

---

## ⚙️ 2. Features

### 🔐 2.1 User Authentication
- Registration and login system  
- Session-based security  
- Only authenticated users can access the task dashboard  
- Logout clears session and redirects to login

---

### 📋 2.2 Task Management (CRUD)
- Add new tasks  
- Edit tasks within GridView  
- Delete tasks with confirmation  
- Update task completion  
- Data refreshes immediately after each action  
- Uses parameterized SQL commands (secure)

---

### 🎨 2.3 Priority System
Each task has one of three priorities:

- 🔴 **High**  
- 🟠 **Medium**  
- 🟢 **Low**  

Priority badges improve readability and task visibility.

---

### 🔎 2.4 Task Filters
Quick filters allow users to:

- 📋 Show All Tasks  
- ✔️ Show Completed  
- ⏳ Show Pending  

State is preserved using ViewState.

---

### 💎 2.5 Modern UI/UX
A clean and professional interface featuring:

- Consistent color scheme  
- Gradient action buttons  
- Rounded card layout  
- Styled inputs and dropdowns  
- Responsive design for mobile  
- Hover effects on rows  
- Logout button at the top-right  
- Priority badges  
- Clear sections and spacing  

---

## 🧰 3. Technology Stack

### 🌐 Frontend
- ASP.NET Web Forms  
- HTML5  
- CSS3  
- Google Fonts (Baloo 2)

### 🖥️ Backend
- C#  
- ASP.NET WebForms lifecycle  
- Session handling  
- Secure SQL queries

### 🗄️ Database
- SQL Server Express  
- Tables: **Users**, **Tasks**

---

## 🗃️ 4. Database Design

### 👤 4.1 Users Table
| Column   | Type            | Description      |
|----------|------------------|------------------|
| UserID   | INT (Identity)   | Primary key      |
| Name     | NVARCHAR         | Full name        |
| Email    | NVARCHAR         | Unique email     |
| Password | NVARCHAR         | User password    |

---

### 📝 4.2 Tasks Table
| Column       | Type              | Description                |
|--------------|-------------------|----------------------------|
| TaskID       | INT (Identity)    | Primary key                |
| Title        | NVARCHAR          | Task title                 |
| Description  | NVARCHAR          | Task description           |
| Priority     | NVARCHAR          | High/Medium/Low            |
| IsCompleted  | BIT               | Completion status          |
| CreatedDate  | DATETIME          | Created timestamp          |
| UserID       | INT (Foreign Key) | References Users table     |

---

## ▶️ 5. How to Run

### 1️⃣ Clone the Repository
git clone https://github.com/yourusername/your-repo-name.git

markdown
Copy code

### 2️⃣ Open in Visual Studio
- Open `.sln` file  
- Build the solution  

### 3️⃣ Configure SQL Server
- Create database: **todoapp**  
- Run SQL script (create Users & Tasks tables)  
- Update connection string if required  

### 4️⃣ Run the Application
- Press **F5**  
- Register a new user  
- Login and manage tasks  

---

## 📂 6. Project Structure
Root Folder
│
├── register.aspx
├── register.aspx.cs
├── login.aspx
├── login.aspx.cs
├── Managetask.aspx
├── Managetask.aspx.cs
├── Web.config
└── Database Script

yaml
Copy code

---

## 📘 7. Key Learning Outcomes

This project demonstrates:

- Multi-page ASP.NET development  
- Secure authentication with sessions  
- Working with SQL Server from C#  
- GridView operations (Insert,Edit, Update, Delete)  
- State management using ViewState  
- Designing UI without external libraries (pure CSS)  
- Full-stack development workflow  

---



