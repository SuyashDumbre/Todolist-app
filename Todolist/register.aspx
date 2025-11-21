<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Todolist.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@600&display=swap" rel="stylesheet" />
    <style>
        /* Full-page background */
        body {
            font-family: 'Baloo 2', sans-serif;
            background: linear-gradient(135deg, #e5f3fa, #f7f9fc);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Card */
        .register-container {
            background-color: #ffffff;
            padding: 32px 34px 30px;
            border-radius: 20px;
            box-shadow: 0 14px 40px rgba(15, 23, 42, 0.15);
            width: 380px;
            border: 1px solid #e4e7ec;
        }

        .register-container h2 {
            text-align: center;
            color: #0b658c;
            margin-bottom: 6px;
            font-size: 30px;
            letter-spacing: 0.5px;
        }

        .register-subtitle {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 22px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            font-size: 15px;
            color: #0b658c;
            margin-bottom: 6px;
        }

        /* Textboxes */
        .input-text,
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px 14px;
            font-size: 14px;
            border: 1.8px solid #d0d5dd;
            border-radius: 12px;
            background-color: #f9fafb;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
            box-sizing: border-box;
        }

        .input-text:focus,
        .form-group input:focus {
            border-color: #0b658c;
            outline: none;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(11, 101, 140, 0.18);
        }

        /* Button */
        .register-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #0b658c, #1293b8);
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 999px;
            cursor: pointer;
            margin-top: 10px;
            transition: transform 0.12s ease, box-shadow 0.15s ease, opacity 0.15s ease;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .register-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(11, 101, 140, 0.35);
            opacity: 0.97;
        }

        .register-btn:active {
            transform: translateY(0);
            box-shadow: none;
        }

        /* Message */
        .message {
            text-align: center;
            margin-top: 14px;
            font-size: 13px;
            color: #e11d48;
        }

        @media (max-width: 480px) {
            .register-container {
                width: 90%;
                padding: 24px 18px 22px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Register</h2>
            <div class="register-subtitle">
                Create your account to start managing tasks.
            </div>

            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-text" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="register-btn" />

            <asp:Label ID="label1" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
