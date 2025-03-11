<%@ Page Title="" Language="C#" MasterPageFile="~/Amasterbase.Master" AutoEventWireup="true" CodeBehind="ApprovedPackageBooking.aspx.cs" Inherits="WebApplication5.ApprovedPackageBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         table {
            width: 1250px;
            border-collapse: collapse;
            margin-top: 130px;
            margin-left: 260px;
        }

        .btn-detail, .btn-delete {
            padding: 5px 10px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 5px;
            font-weight: bold;
        }

        .btn-detail {
            background-color: #007bff;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-detail:hover, .btn-delete:hover {
            opacity: 0.8;
        }

        

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        img {
            max-width: 100px;
            height: auto;
        }

        /* Button to navigate to AdminApproveBookings.aspx */
        .btn-admin-approve {
             display: inline-block;
            padding: 8px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            position: absolute;
            margin-top: -50px;
            right: 20px;
            font-weight: bold;
        }

        .btn-admin-approve:hover {
            opacity: 0.8;
        }

        .auto-style2 {
            width: 96px;
        }
        .auto-style3 {
            width: 81px;
        }
         .auto-style4 {
             width: 147px;
         }
         .auto-style5 {
             width: 95px;
         }
         .auto-style6 {
             width: 84px;
         }
    </style>
    <script type="text/javascript">
        function confirmDeletion() {
            return confirm("Are you sure you want to delete this booking?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <!-- Button to navigate to AdminApproveBookings.aspx -->
    <a href="AdminApprovePackageBookings.aspx" class="btn-admin-approve">Go to Admin Approval Page</a>

    <table id="bookingsTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th class="auto-style5">Phone</th>
                <th class="auto-style6">Package</th>
                <th class="auto-style3">Route</th>
                <th class="auto-style4">Date</th>
                <th class="auto-style2">Price</th>
                <th>E-Receipt</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <asp:Literal ID="bookingsTableBody" runat="server"></asp:Literal>
        </tbody>
    </table>
</asp:Content>
