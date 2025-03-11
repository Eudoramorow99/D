<%@ Page Title="Travel Package List" Language="C#" MasterPageFile="~/Amasterbase.Master" AutoEventWireup="true" CodeBehind="TravelPackageList.aspx.cs" Inherits="WebApplication5.TravelPackageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Travel Package List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e2e2e2;
        }
        img {
            max-width: 100px;
            height: auto;
        }
        .btn-delete, .btn-edit {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            margin-right: 5px;
            width: 50px;
            text-align: center;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            opacity: 0.8;
        }
        .btn-edit {
            background-color: #1a75cf;
        }
        .btn-edit:hover {
            background-color: #1f86e5;
            opacity: 1;
        }
        .btn-approved-bookings {
            display: inline-block;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            position: absolute;
            top: 10px;
            right: 20px;
            font-weight: bold;
        }
        .btn-approved-bookings:hover {
            opacity: 0.8;
        }
        .auto-style1 { width: 32px; }
        .auto-style3 { width: 49px; }
        .auto-style4 { width: 53px; }
        .auto-style5 { width: 62px; }
        .auto-style6 { width: 79px; }
        .auto-style7 { width: 67px; }
        .auto-style8 { width: 83px; }
        .auto-style9 { width: 40px; }
        .auto-style10 { width: 73px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="PackageInsert.aspx" class="btn-approved-bookings">Insert Packages</a> 
        <h1>Available Travel Packages</h1>
        <table>
            <thead>
                <tr>
                    <th>Package Type</th>
                    <th>Package Name</th>
                    <th>Departure Location</th>
                    <th>Destination</th>
                    <th>Duration</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="PackageTableBody" runat="server">
                <!-- Travel package records will be rendered here -->
            </tbody>
        </table>
    </div>
</asp:Content>
