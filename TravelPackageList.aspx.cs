using System;
using System.Data.SqlClient;
using System.Text;

namespace WebApplication5
{
    public partial class TravelPackageList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPackageData();
            }
        }

        private void LoadPackageData()
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";
            string query = "SELECT PackageID, PackageType, PackageName, DepartureLocation, Destination, Duration, Price, ImageUrl FROM TravelPackages";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                StringBuilder sb = new StringBuilder();

                while (reader.Read())
                {
                    sb.Append("<tr>");
                    sb.AppendFormat("<td>{0}</td>", reader["PackageType"]);
                    sb.AppendFormat("<td>{0}</td>", reader["PackageName"]);
                    sb.AppendFormat("<td>{0}</td>", reader["DepartureLocation"]);
                    sb.AppendFormat("<td>{0}</td>", reader["Destination"]);
                    sb.AppendFormat("<td>{0}</td>", reader["Duration"]);
                    sb.AppendFormat("<td>{0:C}</td>", reader["Price"]);

                    sb.AppendFormat("<td><img src='{0}' alt='Package Image'/></td>", reader["ImageUrl"]);
                    sb.AppendFormat("<td><a href='TravelPackageList.aspx?delete={0}' class='btn-delete'>Delete</a> | <a href='EditPackage.aspx?packageId={0}' class='btn-edit'>Edit</a></td>", reader["PackageID"]);
                    sb.Append("</tr>");
                }

                reader.Close();
                PackageTableBody.InnerHtml = sb.ToString();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            string packageIdToDelete = Request.QueryString["delete"];
            if (!string.IsNullOrEmpty(packageIdToDelete))
            {
                DeletePackage(packageIdToDelete);
                // Reload the package data after deletion
                LoadPackageData();
            }
        }

        private void DeletePackage(string packageId)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";
            string query = "DELETE FROM TravelPackages WHERE PackageID = @PackageID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PackageID", packageId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
