<%@ Page Title="Edit Package" Language="C#" MasterPageFile="~/Amasterbase.Master" AutoEventWireup="true" CodeBehind="EditPackage.aspx.cs" Inherits="WebApplication5.EditPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .edit-package-form {
            margin: 20px auto;
            padding: 20px;
            max-width: 700px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
             margin-left: 600px;
            margin-top: 100px;
        }

        .edit-package-form h2 {
            text-align: center;
            color: #0c3b66;
            margin-bottom: 20px;
        }

        .edit-package-form .form-row {
            display: flex;
            margin-bottom: 15px;
        }

        .edit-package-form .form-row .form-group {
            flex: 1;
            margin-right: 15px;
        }

        .edit-package-form .form-row .form-group:last-child {
            margin-right: 0;
        }

        .edit-package-form .form-row input, 
        .edit-package-form .form-row textarea {
            width: 96%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .edit-package-form .form-row textarea {
            resize: vertical;
        }

        .btn-primary {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            margin-right: 5px;
            width: 100px;
            text-align: center;
            background-color: #1a75cf;
        }

        .btn-primary:hover {
            background-color: #1f86e5;
            opacity: 1;
        }

        .btn-secondary {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            margin-right: 5px;
            width: 200px;
            text-align: center;
            background-color: #1a75cf;
        }

        .btn-secondary:hover {
            opacity: 0.8;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit-package-form">
        <h2>Edit Package</h2>

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtPackageType" runat="server" Placeholder="Package Type"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPackageName" runat="server" Placeholder="Package Name"></asp:TextBox>
            </div>
        </div>

       

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtDepartureLocation" runat="server" Placeholder="Departure Location"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDestination" runat="server" Placeholder="Destination"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtDuration" runat="server" Placeholder="Duration"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtNumberOfPeople" runat="server" Placeholder="Number of People"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtAccommodationDetails" runat="server" Placeholder="Accommodation Details"></asp:TextBox>
            </div>
        </div>

       

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtMealsDetails" runat="server" Placeholder="Meals Details"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtTransportationDetails" runat="server" Placeholder="Transportation Details"></asp:TextBox>
            </div>
        </div>

      

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtActivitiesDetails" TextMode="MultiLine" Rows="3" runat="server" Placeholder="Activities Details"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="3" runat="server" Placeholder="Description"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:TextBox ID="txtImageURL" runat="server" Placeholder="Image URL"></asp:TextBox>
                <asp:FileUpload ID="fuNewImage" runat="server" />
            </div>
            <div class="form-group">
                <img id="packageImage" src="" style="max-width: 150px;" runat="server" />
            </div>
        </div>

        <div class="form-row">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back to Hotel List" PostBackUrl="~/PackageList.aspx" CssClass="btn-secondary" />
        </div>
    </div>
</asp:Content>
