<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Todolist.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-card {
            max-width: 450px;
            margin: 60px auto;
            padding: 40px 30px;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            font-family: 'Baloo 2', sans-serif;
        }

        .login-card h2 {
            text-align: center;
            color: #0b658c;
            font-size: 36px;
            margin-bottom: 35px;
        }

        .form-row {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-row label {
            font-size: 20px;
            color: #0b658c;
            min-width: 100px;
        }

        .form-row input[type="text"],
        .form-row input[type="password"] {
            flex: 1;
            width: 100%;
            padding: 10px 15px;
            font-size: 16px;
            border: 2px solid #ddd;
            border-radius: 12px;
            transition: border-color 0.3s ease;
        }

        .form-row input:focus {
            border-color: #0b658c;
            outline: none;
        }

        .forgot-link {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .forgot-link a {
            font-size: 14px;
            text-decoration: none;
            color: #0b658c;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            background-color: #0b658c;
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #084c6b;
        }

        .extra-links {
            margin-top: 15px;
            text-align: center;
        }

        .extra-links a {
            text-decoration: none;
            color: #0b658c;
            font-size: 14px;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }

        .error-message {
            margin-top: 10px;
            color: red;
            text-align: center;
            font-size: 14px;
        }
    </style>

    <div class="login-card">
        <h2>Login</h2>

        <div class="form-row">
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" />
        </div>

        <div class="form-row">
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </div>

        <div class="forgot-link">
            <a href="#">Forgot Password?</a>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login" />
        <asp:Label ID="label1" runat="server" CssClass="error-message" />

        <div class="extra-links">
            Don’t have an account? <a href="register.aspx">Sign Up</a>
        </div>
    </div>
</asp:Content>
