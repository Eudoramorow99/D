<%@ Page Title="Package Search" Language="C#" MasterPageFile="~/masterbase.Master" AutoEventWireup="true" CodeBehind="PackageSearch.aspx.cs" Inherits="WebApplication5.PackageSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* General Container Styles */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        /* Search Panel Styles */
        .search-panel {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .search-panel h3 {
            width: 100%;
            margin-bottom: 20px;
            color: #333;
        }

        /* Form Control Styles */
        .form-control {
            flex: 1;
            min-width: 200px; /* Ensure a minimum width for responsiveness */
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #0c3b66;
            outline: none;
            box-shadow: 0 0 5px rgba(12, 59, 102, 0.5);
        }

        /* Button Styles */
        .button {
            background-color: #0c3b66;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .button:hover {
            background-color: #093f6a;
        }

        /* Error Label Styles */
        .error-label {
            width: 100%;
            margin-top: 10px;
            font-size: 14px;
        }

        /* Results Panel Styles */
        .results-panel {
            margin-top: 30px;
            gap: 20px;
        }

        /* Card Styles */
        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
            display: flex; /* Use flexbox to arrange image and body side by side */
        }

        .card-img-top {
            width: 40%;
            height: auto;
        }

        .card-body {
            padding: 15px;
            width: 60%;
        }

        .card-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 14px;
            color: #555;
        }

        .card-text strong {
            color: #0c3b66;
        }

        .card-body .button {
            margin-top: 15px;
        }
         

    </style>

    <br />
    <div class="container">
        <!-- Search Form -->
        <asp:Panel ID="SearchPanel" runat="server" CssClass="search-panel">
            <h3>Search for Packages</h3>
            <asp:DropDownList ID="ddlDepartureLocation" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Departure" Value="" />
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Destination" Value="" />
            </asp:DropDownList>
            <asp:DropDownList ID="ddlPackageType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Package" Value="" />
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click" />
            <asp:Label ID="lblError" runat="server" CssClass="error-label" ForeColor="Red" Visible="False" />
        </asp:Panel>

        <!-- Search Results -->
        <asp:Panel ID="ResultsPanel" runat="server" CssClass="results-panel">
            <asp:Repeater ID="rptPackages" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <asp:Image ID="cardImgTop" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' CssClass="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("PackageName") %></h5>
                            <p class="card-text">
                                <strong>Departure:</strong> <%# Eval("DepartureLocation") %><br />
                                <strong>Destination:</strong> <%# Eval("Destination") %><br />
                                <strong>Package Type:</strong> <%# Eval("PackageType") %><br />
                                <strong>Duration:</strong> <%# Eval("Duration") %><br />
                                <strong>Price:</strong> <%# Eval("Price", "{0:N0} MMK") %><br />
                                <strong>Number of People:</strong> <%# Eval("NumberOfPeople") %><br />
                                <strong>Accommodation:</strong> <%# Eval("AccommodationDetails") %><br />
                                <strong>Meals:</strong> <%# Eval("MealsDetails") %><br />
                                <strong>Transportation:</strong> <%# Eval("TransportationDetails") %><br />
                                <strong>Activities:</strong> <%# Eval("ActivitiesDetails") %><br />
                                <strong>Special Features:</strong> <%# Eval("Description") %>
                            </p>
                            <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CommandArgument='<%# Eval("PackageID") %>' OnClick="btnBookNow_Click" CssClass="button" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>
</asp:Content>
