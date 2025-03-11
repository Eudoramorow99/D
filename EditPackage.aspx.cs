using System;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication5
{
    public partial class EditPackage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string packageId = Request.QueryString["packageId"];
                if (!string.IsNullOrEmpty(packageId))
                {
                    LoadPackageData(packageId);
                }
            }
        }

        private void LoadPackageData(string packageId)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";
            string query = "SELECT PackageType, PackageName, DepartureLocation, Destination, Duration, Price, NumberOfPeople, AccommodationDetails, MealsDetails, TransportationDetails, ActivitiesDetails, ImageUrl, Description FROM TravelPackages WHERE PackageID = @PackageID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PackageID", packageId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtPackageType.Text = reader["PackageType"].ToString();
                    txtPackageName.Text = reader["PackageName"].ToString();
                    txtDepartureLocation.Text = reader["DepartureLocation"].ToString();
                    txtDestination.Text = reader["Destination"].ToString();
                    txtDuration.Text = reader["Duration"].ToString();
                    txtPrice.Text = Convert.ToDecimal(reader["Price"]).ToString("N2");
                    txtNumberOfPeople.Text = reader["NumberOfPeople"].ToString();
                    txtAccommodationDetails.Text = reader["AccommodationDetails"].ToString();
                    txtMealsDetails.Text = reader["MealsDetails"].ToString();
                    txtTransportationDetails.Text = reader["TransportationDetails"].ToString();
                    txtActivitiesDetails.Text = reader["ActivitiesDetails"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtImageURL.Text = reader["ImageUrl"].ToString();
                    packageImage.Src = reader["ImageUrl"].ToString(); // Display current image
                }
                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string packageId = Request.QueryString["packageId"];
            if (!string.IsNullOrEmpty(packageId))
            {
                string newImageUrl = txtImageURL.Text; // Default to current image URL
                if (fuNewImage.HasFile)
                {
                    // Save the new image file and get its URL
                    string imageFolder = Server.MapPath("~/images/");
                    string imageName = Path.GetFileName(fuNewImage.PostedFile.FileName);
                    string imagePath = Path.Combine(imageFolder, imageName);
                    fuNewImage.SaveAs(imagePath);
                    newImageUrl = "~/images/" + imageName;
                }

                UpdatePackageData(packageId, newImageUrl);
                Response.Redirect("PackageList.aspx");
            }
        }

        private void UpdatePackageData(string packageId, string imageUrl)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";
            string query = "UPDATE TravelPackages SET PackageType=@PackageType, PackageName=@PackageName, DepartureLocation=@DepartureLocation, Destination=@Destination, Duration=@Duration, Price=@Price, NumberOfPeople=@NumberOfPeople, AccommodationDetails=@AccommodationDetails, MealsDetails=@MealsDetails, TransportationDetails=@TransportationDetails, ActivitiesDetails=@ActivitiesDetails, ImageUrl=@ImageUrl, Description=@Description WHERE PackageID=@PackageID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PackageID", packageId);
                cmd.Parameters.AddWithValue("@PackageType", txtPackageType.Text);
                cmd.Parameters.AddWithValue("@PackageName", txtPackageName.Text);
                cmd.Parameters.AddWithValue("@DepartureLocation", txtDepartureLocation.Text);
                cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text);
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text));
                cmd.Parameters.AddWithValue("@NumberOfPeople", txtNumberOfPeople.Text);
                cmd.Parameters.AddWithValue("@AccommodationDetails", txtAccommodationDetails.Text);
                cmd.Parameters.AddWithValue("@MealsDetails", txtMealsDetails.Text);
                cmd.Parameters.AddWithValue("@TransportationDetails", txtTransportationDetails.Text);
                cmd.Parameters.AddWithValue("@ActivitiesDetails", txtActivitiesDetails.Text);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
