# 📝 ASP.NET To-Do List Web Application

A complete **task management system** built using **ASP.NET Web Forms**, **C#**, and **SQL Server**, designed to practice real-world **full-stack development**, **authentication**, **CRUD operations**, and **GridView-based UI**.  
This project showcases strong understanding of **web development**, **database connectivity**, and **clean UI design** without external libraries.

---

## 📌 1. Project Description

This To-Do List web application allows users to **register**, **log in**, and manage their daily tasks in a clean and structured way.  
It uses **session-based authentication**, **SQL Server database**, and **ADO.NET** for secure data handling.

The app follows a real production-style workflow:

- Multi-page architecture  
- Separation of ASPX pages + C# code-behind  
- Layered user flow (Login → Dashboard → Task CRUD)  
- Task table with priority, status & timestamps  

---

## 🚀 2. Features

### 🔐 User Authentication
- User Registration  
- Secure Login using SQL Server  
- Session management (`Session["UserID"]`, `Session["Email"]`, etc.)  
- Protected pages – only logged-in users can access task management  
- Proper logout with session clear & redirect  

### 🗂️ Task Management (CRUD)
- ➕ Add new tasks  
- 📝 Edit & update tasks inline in GridView  
- ❌ Delete tasks with confirmation  
- 📄 Display tasks filtered by logged-in user  
- 🔁 Automatic data refresh after each operation  

### 🎯 Task Priority & Status
- Priority options: **High / Medium / Low**  
- Status options: **Pending / Completed** (optional implementation)  

### 🎨 Modern UI
- Pure CSS — no Bootstrap  
- Clean, centered layout with card-style container  
- Responsive max-width for better readability  
- Consistent typography and button styles  

---

## ⚙️ 3. How the Project Works

### 🔸 Workflow Overview

1. **User Registration**
   - User fills registration form (Name, Email, Password)  
   - Data saved to `Users` table  
   - Redirected to login with success message  

2. **User Login**
   - User enters email & password  
   - Credentials are validated against `Users` table  
   - On success → Session created and user redirected to **Manage Tasks** page  

3. **Manage Tasks (Logged-in Only)**
   - Page loads tasks filtered by `UserID` from session  
   - Tasks displayed in a **GridView**  
   - User can:
     - Add new task (title, description, priority)  
     - Edit and update existing task  
     - Delete task  

4. **Logout**
   - Session is cleared  
   - User is redirected back to login page  
   - Protected pages cannot be accessed without logging in again  

---

## 🗄️ 4. Database Setup & SQL Scripts (SQL Server)

Below are the **exact SQL queries** to create the database and tables for this project.

### 4.1 Create Database

```sql
-- Create database for the To-Do application
CREATE DATABASE todoapp;
GO

-- Select the database
USE todoapp;
GO
```

### 4.2 Create `Users` Table

```sql
-- Create Users table to store registered users
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO
```

### 4.3 Create `Tasks` Table

```sql
-- Create Tasks table to store user tasks
CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    TaskTitle NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500) NULL,
    Priority NVARCHAR(20) NOT NULL,    -- e.g., 'High', 'Medium', 'Low'
    Status NVARCHAR(20) NOT NULL DEFAULT 'Pending', -- e.g., 'Pending', 'Completed'
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DueDate DATETIME NULL,

    CONSTRAINT FK_Tasks_Users FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
```

### 4.4 (Optional) Insert Sample Data

```sql
-- Insert a sample user
INSERT INTO Users (Name, Email, Password)
VALUES ('Test User', 'testuser@example.com', 'test123');

-- Insert some sample tasks for the sample user
INSERT INTO Tasks (UserID, TaskTitle, Description, Priority, Status, DueDate)
VALUES 
(1, 'Complete ASP.NET To-Do App', 'Finish all CRUD operations and UI design', 'High', 'Pending', GETDATE() + 2),
(1, 'Review SQL Scripts', 'Check all database scripts for errors', 'Medium', 'Pending', GETDATE() + 3),
(1, 'Update README', 'Add proper documentation in GitHub', 'Low', 'Pending', NULL);
GO
```

---

## 🧩 5. Technologies Used

- **ASP.NET Web Forms (.aspx + code-behind)**  
- **C#**  
- **SQL Server**  
- **ADO.NET** (`SqlConnection`, `SqlCommand`, `SqlDataAdapter`, `DataTable`)  
- **GridView** (Edit, Update, Delete, RowCommand events)  
- **Session Handling** (`Session`, `Response.Redirect`)  
- **CSS** for custom styling  

---

## 🛠️ 6. CRUD Operations Implemented

### ✔ Create (INSERT)
- New users during **registration**  
- New tasks from **Add Task** form  
- Uses **parameterized queries** to avoid SQL injection  

```csharp
string query = "INSERT INTO Tasks (UserID, TaskTitle, Description, Priority) " +
               "VALUES (@UserID, @TaskTitle, @Description, @Priority)";
```

### ✔ Read (SELECT)
- Fetch currently logged-in user’s tasks:  

```sql
SELECT TaskID, TaskTitle, Description, Priority, Status, CreatedAt, DueDate
FROM Tasks
WHERE UserID = @UserID
ORDER BY CreatedAt DESC;
```

- Data is loaded using `SqlDataAdapter` and bound to GridView:

```csharp
SqlDataAdapter da = new SqlDataAdapter(cmd);
DataTable dt = new DataTable();
da.Fill(dt);
gvTasks.DataSource = dt;
gvTasks.DataBind();
```

### ✔ Update (UPDATE)
- Inline editing in GridView (RowEditing → RowUpdating)  
- Update title, description, priority, and status  

```csharp
string updateQuery = @"UPDATE Tasks
                       SET TaskTitle = @TaskTitle,
                           Description = @Description,
                           Priority = @Priority,
                           Status = @Status,
                           DueDate = @DueDate
                       WHERE TaskID = @TaskID AND UserID = @UserID";
```

### ✔ Delete (DELETE)
- Delete task from GridView RowDeleting / Command event  

```csharp
string deleteQuery = "DELETE FROM Tasks WHERE TaskID = @TaskID AND UserID = @UserID";
```

### ✔ Connection String Handling

```csharp
string connStr = @"Data Source=DESKTOP-XXXX\SQLEXPRESS;Initial Catalog=todoapp;Integrated Security=True";
using (SqlConnection conn = new SqlConnection(connStr))
{
    conn.Open();
    // Execute commands here
}
```

---

## 📘 7. Key Learning Outcomes

This project demonstrates and reinforces:

- ✅ Building **multi-page ASP.NET Web Forms** applications (Login, Register, Manage Tasks, Master Page)  
- ✅ Implementing **secure user authentication** with SQL Server + sessions  
- ✅ Designing and managing **relational database schema** (Users & Tasks)  
- ✅ Writing **professional SQL scripts**:
  - `CREATE DATABASE`
  - `CREATE TABLE` with primary keys and foreign keys  
  - `UNIQUE` constraint on Email  
  - `DEFAULT` values and `IDENTITY` columns  
- ✅ Implementing full **CRUD operations**:
  - `INSERT` → Add user / task  
  - `SELECT` → Display only logged-in user’s tasks  
  - `UPDATE` → Edit task details via GridView  
  - `DELETE` → Remove tasks safely  
- ✅ Using **parameterized queries** to prevent SQL injection  
- ✅ Managing **connection strings** and `SqlConnection`, `SqlCommand`, `SqlDataAdapter`  
- ✅ Working with **GridView events**:
  - `RowEditing`, `RowUpdating`, `RowCancelingEdit`, `RowDeleting`  
- ✅ Understanding **ASP.NET page lifecycle** for proper data binding  
- ✅ Using **Session** objects to secure pages and personalize user data  
- ✅ Creating **responsive, clean UI** using only CSS (no frameworks)  
- ✅ Following a **real-world full-stack workflow** from database → backend → frontend → deployment-ready code  


---

## 🏁 9. How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone <your_repository_link_here>
```

### 2️⃣ Open in Visual Studio

- Open the `.sln` file in **Visual Studio**  
- Restore any missing NuGet packages if required  

### 3️⃣ Configure the Database

1. Open **SQL Server Management Studio (SSMS)**  
2. Run the SQL script from Section **4** (Database Setup & SQL Scripts)  
3. Confirm that:
   - Database name is `todoapp`  
   - Tables `Users` and `Tasks` are created successfully  

4. Update the **connection string** in your Web.config or code-behind to match your SQL Server instance:

```xml
<connectionStrings>
  <add name="TodoConnectionString"
       connectionString="Data Source=DESKTOP-XXXX\SQLEXPRESS;Initial Catalog=todoapp;Integrated Security=True"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

### 4️⃣ Run the Application

- Set the start page to `Login.aspx`  
- Press **F5** or click **Start** in Visual Studio  
- Register a new user and start managing tasks 🎯  

---

