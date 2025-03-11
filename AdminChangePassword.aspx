<%@ Page Title="" Language="C#" MasterPageFile="~/Amasterbase.Master" AutoEventWireup="true" CodeBehind="AdminChangePassword.aspx.cs" Inherits="WebApplication5.AdminChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        /* Align container properly */
        .content-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding-top: 20px; /* Adjust to avoid navbar overlap */
            margin-left:700px; /* Adjust based on sidebar width */
        }

        /* Style for the form */
        .form-panel {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .form-panel h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
            font-size: 14px;
            box-sizing: border-box;
        }

        .btn-primary {
            width: 100%;
            border-radius: 5px;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 10px;
            color: red;
            font-size: 14px;
        }
        .a{ list-style:none;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">
        <div class="form-panel">
            <h2>Change Password</h2>

            <div class="form-group">
                <label>Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Old Password:</label>
                <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>New Password:</label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn-primary" OnClick="btnChangePassword_Click" />
            <a href="AdminRegister.aspx">Add New Admin</a>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </div>
</asp:Content>
