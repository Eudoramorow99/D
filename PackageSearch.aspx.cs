using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web;

namespace WebApplication5
{
    public partial class PackageSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate dropdowns
                LoadDropdowns();

                // Hide results and error labels initially
                rptPackages.Visible = false;
                lblError.Visible = false;
            }
        }

        private void LoadDropdowns()
        {
            DataTable dtDepartureLocations = GetDropdownData("SELECT DISTINCT DepartureLocation FROM TravelPackages ORDER BY DepartureLocation");
            DataTable dtDestinations = GetDropdownData("SELECT DISTINCT Destination FROM TravelPackages ORDER BY Destination");
            DataTable dtPackageTypes = GetDropdownData("SELECT DISTINCT PackageType FROM TravelPackages ORDER BY PackageType");

            ddlDepartureLocation.DataSource = dtDepartureLocations;
            ddlDepartureLocation.DataTextField = "DepartureLocation";
            ddlDepartureLocation.DataValueField = "DepartureLocation";
            ddlDepartureLocation.DataBind();
            ddlDepartureLocation.Items.Insert(0, new ListItem("Select Departure", ""));

            ddlDestination.DataSource = dtDestinations;
            ddlDestination.DataTextField = "Destination";
            ddlDestination.DataValueField = "Destination";
            ddlDestination.DataBind();
            ddlDestination.Items.Insert(0, new ListItem("Select Destination", ""));

            ddlPackageType.DataSource = dtPackageTypes;
            ddlPackageType.DataTextField = "PackageType";
            ddlPackageType.DataValueField = "PackageType";
            ddlPackageType.DataBind();
            ddlPackageType.Items.Insert(0, new ListItem("Select Package", ""));
        }

        private DataTable GetDropdownData(string query)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string departureLocation = ddlDepartureLocation.SelectedValue;
            string destination = ddlDestination.SelectedValue;
            string packageType = ddlPackageType.SelectedValue;

            lblError.Visible = false;

            if (string.IsNullOrWhiteSpace(departureLocation) ||
                string.IsNullOrWhiteSpace(destination) ||
                string.IsNullOrWhiteSpace(packageType))
            {
                lblError.Text = "Please fill in all search criteria.";
                lblError.Visible = true;
                return;
            }

            try
            {
                DataTable dtPackages = GetPackages(departureLocation, destination, packageType);

                if (dtPackages.Rows.Count > 0)
                {
                    rptPackages.DataSource = dtPackages;
                    rptPackages.DataBind();
                    rptPackages.Visible = true;
                }
                else
                {
                    rptPackages.Visible = false;
                    lblError.Text = "No packages found matching your criteria.";
                    lblError.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Log the exception here if needed
                lblError.Text = "An error occurred while searching for packages. Please try again later.";
                lblError.Visible = true;
            }
        }

        private DataTable GetPackages(string departureLocation, string destination, string packageType)
        {
            string query = "SELECT PackageID, PackageName, ImageUrl, DepartureLocation, Destination, PackageType, Duration, Price, NumberOfPeople, AccommodationDetails, MealsDetails, TransportationDetails, ActivitiesDetails, Description " +
                           "FROM TravelPackages " +
                           "WHERE DepartureLocation = @DepartureLocation " +
                           "AND Destination = @Destination " +
                           "AND PackageType = @PackageType";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DepartureLocation", departureLocation);
                    cmd.Parameters.AddWithValue("@Destination", destination);
                    cmd.Parameters.AddWithValue("@PackageType", packageType);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string packageID = btn.CommandArgument;

            // Redirect to booking page with the selected package ID
            Response.Redirect($"PackageBook.aspx?PackageID={HttpUtility.UrlEncode(packageID)}");
        }
    }
}
