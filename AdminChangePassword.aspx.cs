using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Linq;

namespace WebApplication5
{
    public partial class AdminChangePassword : Page
    {
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            // Ensure all fields are filled
            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(oldPassword) || string.IsNullOrWhiteSpace(newPassword))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate password strength
            string passwordCheckResult = IsValidPassword(newPassword);
            if (passwordCheckResult != "Valid")
            {
                lblMessage.Text = passwordCheckResult;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Travel1;Integrated Security=True;Pooling=False";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Get the stored password hash
                    string checkQuery = "SELECT Password FROM Admins WHERE Username = @Username";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@Username", username);
                        object storedHashObj = checkCmd.ExecuteScalar();

                        if (storedHashObj == null)
                        {
                            lblMessage.Text = "Invalid username.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        string storedHash = storedHashObj.ToString();

                        // Verify old password
                        if (!VerifyPassword(oldPassword, storedHash))
                        {
                            lblMessage.Text = "Incorrect old password.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        // Hash the new password
                        string hashedNewPassword = HashPassword(newPassword);

                        // Update password in the database
                        string updateQuery = "UPDATE Admins SET Password = @NewPassword WHERE Username = @Username";
                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                        {
                            updateCmd.Parameters.AddWithValue("@Username", username);
                            updateCmd.Parameters.AddWithValue("@NewPassword", hashedNewPassword);
                            updateCmd.ExecuteNonQuery();
                        }

                        lblMessage.Text = "Password changed successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // ✅ Validates password strength
        private string IsValidPassword(string password)
        {
            if (password.Length < 8)
                return "Password must be at least 8 characters long.";

            if (!System.Text.RegularExpressions.Regex.IsMatch(password, @"[A-Z]"))
                return "Password must contain at least one uppercase letter.";

            if (!System.Text.RegularExpressions.Regex.IsMatch(password, @"[a-z]"))
                return "Password must contain at least one lowercase letter.";

            if (!System.Text.RegularExpressions.Regex.IsMatch(password, @"\d"))
                return "Password must contain at least one number.";

            if (!System.Text.RegularExpressions.Regex.IsMatch(password, @"[@$!%*?&]"))
                return "Password must contain at least one special character (@$!%*?&).";

            return "Valid";
        }

        // ✅ Hash password using PBKDF2 (secure)
        private string HashPassword(string password)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[16];
                rng.GetBytes(salt);

                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000))
                {
                    byte[] hash = pbkdf2.GetBytes(32);
                    return Convert.ToBase64String(salt) + ":" + Convert.ToBase64String(hash);
                }
            }
        }

        // ✅ Verify password using PBKDF2 hash
        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string[] parts = storedHash.Split(':');
            if (parts.Length != 2) return false;

            byte[] salt = Convert.FromBase64String(parts[0]);
            byte[] storedHashBytes = Convert.FromBase64String(parts[1]);

            using (var pbkdf2 = new Rfc2898DeriveBytes(enteredPassword, salt, 10000))
            {
                byte[] enteredHash = pbkdf2.GetBytes(32);
                return enteredHash.SequenceEqual(storedHashBytes);
            }
        }
    }
}
