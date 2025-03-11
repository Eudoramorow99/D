using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;

namespace WebApplication5
{
    public partial class ApprovedPackageBooking : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"
    SELECT 
        BookingID,
        Name,
        Email,
        Phone,
        PackageName,
        DepartureLocation,
        Destination,
        BookingDate,
        Price,
        BookDate
    FROM PackageBookings
    WHERE Status = 'Approved'
    ORDER BY BookingID DESC";

                    using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        StringBuilder sb = new StringBuilder();
                        foreach (DataRow row in dt.Rows)
                        {
                            sb.AppendFormat("<tr id='row-{0}'>", row["BookingID"]);
                            sb.AppendFormat("<td>{0}</td>", row["BookingID"]);
                            sb.AppendFormat("<td>{0}</td>", row["Name"]);
                            sb.AppendFormat("<td>{0}</td>", row["Email"]);
                            sb.AppendFormat("<td>{0}</td>", row["Phone"]);
                            sb.AppendFormat("<td>{0}</td>", row["PackageName"]);
                            sb.AppendFormat("<td>{0} - {1}</td>", row["DepartureLocation"], row["Destination"]);
                            sb.AppendFormat("<td>{0:N2} MMK</td>", row["Price"]);
                            sb.AppendFormat("<td>{0:yyyy-MM-dd}</td>", row["BookingDate"]); // Format date
                            sb.AppendFormat("<td>{0}</td>", row["BookDate"]);
                            sb.AppendFormat("<td><a href='PackageBookingDetail.aspx?id={0}' class='btn-detail'>Detail</a><a href='ApprovedPackageBooking.aspx?action=delete&id={0}' class='btn-delete' onclick='return confirmDeletion();'>Delete</a></td>", row["BookingID"]);
                            sb.Append("</tr>");
                        }

                        bookingsTableBody.Text = sb.ToString(); // Use Literal control
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception (implement logging as needed)
                // Display an error message to the user
                bookingsTableBody.Text = "<tr><td colspan='10'>An error occurred while loading bookings. Please try again later.</td></tr>";
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // Handle delete action based on query parameters
            string action = Request.QueryString["action"];
            string id = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(action) && !string.IsNullOrEmpty(id))
            {
                int bookingId;
                if (int.TryParse(id, out bookingId))
                {
                    if (action.ToLower() == "delete")
                    {
                        DeleteBooking(bookingId);
                        // Reload the bookings after deletion
                        LoadBookings();
                    }
                }
            }
        }

        private void DeleteBooking(int bookingId)
        {
            try
            {
                string query = "DELETE FROM PackageBookings WHERE BookingID = @BookingID";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookingID", bookingId);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception (implement logging as needed)
                // Display an error message to the user
            }
        }
    }
}
