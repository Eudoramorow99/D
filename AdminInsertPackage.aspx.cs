using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace WebApplication5
{
    public partial class AdminInsertPackage : System.Web.UI.Page
    {
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Gather input data
                    string packageName = txtPackageName.Text.Trim();
                    string departureLocation = ddlDepartureLocation.SelectedValue;
                    string destination = ddlDestination.SelectedValue;
                    string packageType = ddlPackageType.SelectedValue;
                    DateTime startDate = DateTime.Parse(txtStartDate.Text);
                    DateTime endDate = DateTime.Parse(txtEndDate.Text);
                    decimal price = decimal.Parse(txtPrice.Text);
                    string description = txtDescription.Text.Trim();
                    string imageUrl = UploadImage();

                    if (imageUrl != null)
                    {
                        // Retrieve connection string from Web.config
                        string connectionString = ConfigurationManager.ConnectionStrings["Travel1"].ConnectionString;

                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            string query = "INSERT INTO TravelPackages (PackageName, DepartureLocation, Destination, PackageType, StartDate, EndDate, Price, Description, ImageUrl) VALUES (@PackageName, @DepartureLocation, @Destination, @PackageType, @StartDate, @EndDate, @Price, @Description, @ImageUrl)";
                            SqlCommand cmd = new SqlCommand(query, conn);

                            cmd.Parameters.AddWithValue("@PackageName", packageName);
                            cmd.Parameters.AddWithValue("@DepartureLocation", departureLocation);
                            cmd.Parameters.AddWithValue("@Destination", destination);
                            cmd.Parameters.AddWithValue("@PackageType", packageType);
                            cmd.Parameters.AddWithValue("@StartDate", startDate);
                            cmd.Parameters.AddWithValue("@EndDate", endDate);
                            cmd.Parameters.AddWithValue("@Price", price);
                            cmd.Parameters.AddWithValue("@Description", description);
                            cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            // Provide user feedback
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Package inserted successfully!');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Image upload failed.');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception and provide user feedback
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }

        private string UploadImage()
        {
            if (fuImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                    string filePath = Server.MapPath("~/Images/" + fileName);
                    fuImage.SaveAs(filePath);
                    return "~/Images/" + fileName;
                }
                catch (Exception ex)
                {
                    // Log the exception and handle the error
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error uploading image: " + ex.Message + "');", true);
                    return null;
                }
            }
            return null;
        }
    }
}
