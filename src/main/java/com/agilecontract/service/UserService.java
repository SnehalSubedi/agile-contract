package com.agilecontract.service;

import com.agilecontract.Model.User;
import jakarta.servlet.http.Part;
import java.sql.*;
import java.util.ArrayList;

public class UserService {
    private Connection conn;

    public UserService(Connection conn) {
        this.conn = conn;
    }

    // Add new user (Negotiator or Admin)
    public boolean addUser(User user) {
        String sql = "INSERT INTO users (Username, PasswordHash, FullName, Email, ContactNumber, Role, image_path) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPasswordHash()); // You should hash this before sending to DAO
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getContactNumber());
            stmt.setString(6, user.getRole());
            stmt.setString(7, user.getImagePath());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            // Use logging instead of printStackTrace in production
            e.printStackTrace();
            return false;
        }
    }

    // Check if username already exists
    public boolean usernameExists(String username) {
        String sql = "SELECT UserID FROM users WHERE Username = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // true if found
        } catch (SQLException e) {
            // Use logging instead of printStackTrace in production
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all contract negotiators from the database
    public ArrayList<User> getAllNegotiators() throws SQLException {
        ArrayList<User> negotiators = new ArrayList<>();

        String query = "SELECT UserID, FullName, Email, ContactNumber FROM users WHERE Role = 'ContractNegotiator' ORDER BY FullName";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setContactNumber(rs.getString("ContactNumber"));
                negotiators.add(user);
            }
        } catch (SQLException e) {
            // Use logging instead of printStackTrace in production
            e.printStackTrace();
            throw new SQLException("Error retrieving contract negotiators", e);
        }

        return negotiators;
    }

    // Utility method to get file extension
    public static String getFileExtension(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                if (fileName.contains(".")) {
                    return fileName.substring(fileName.lastIndexOf(".")).toLowerCase(); // Ensures extension is in
                                                                                        // lowercase
                }
            }
        }
        return "";
    }
 // Add these methods to your UserService class

 // Get user by ID
 public User getUserById(int userId) throws SQLException {
     String sql = "SELECT * FROM users WHERE UserID = ?";
     try (PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setInt(1, userId);
         ResultSet rs = stmt.executeQuery();
         if (rs.next()) {
             User user = new User();
             user.setId(rs.getInt("UserID"));
             user.setUsername(rs.getString("Username"));
             user.setFullName(rs.getString("FullName"));
             user.setEmail(rs.getString("Email"));
             user.setContactNumber(rs.getString("ContactNumber"));
             user.setRole(rs.getString("Role"));
             user.setImagePath(rs.getString("image_path"));
             user.setPasswordHash(rs.getString("PasswordHash"));
             return user;
         }
         return null;
     } catch (SQLException e) {
         e.printStackTrace();
         throw new SQLException("Error retrieving user by ID", e);
     }
 }

 // Update user information
 public boolean updateUser(User user) throws SQLException {
     String sql = "UPDATE users SET Username = ?, FullName = ?, Email = ?, ContactNumber = ?, Role = ?, image_path = ?, PasswordHash = ? WHERE UserID = ?";
     try (PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setString(1, user.getUsername());
         stmt.setString(2, user.getFullName());
         stmt.setString(3, user.getEmail());
         stmt.setString(4, user.getContactNumber());
         stmt.setString(5, user.getRole());
         stmt.setString(6, user.getImagePath());
         stmt.setString(7, user.getPasswordHash());
         stmt.setInt(8, user.getId());

         int rows = stmt.executeUpdate();
         return rows > 0;
     } catch (SQLException e) {
         e.printStackTrace();
         throw new SQLException("Error updating user", e);
     }
 }

 // Check if email already exists (for another user)
 public boolean emailExists(String email) throws SQLException {
     String sql = "SELECT UserID FROM users WHERE Email = ?";
     try (PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setString(1, email);
         ResultSet rs = stmt.executeQuery();
         return rs.next(); // true if found
     } catch (SQLException e) {
         e.printStackTrace();
         throw new SQLException("Error checking email existence", e);
     }
 }

 // Check if email exists for another user (used during updates)
 public boolean emailExistsForOtherUser(String email, int userId) throws SQLException {
     String sql = "SELECT UserID FROM users WHERE Email = ? AND UserID != ?";
     try (PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setString(1, email);
         stmt.setInt(2, userId);
         ResultSet rs = stmt.executeQuery();
         return rs.next(); // true if found
     } catch (SQLException e) {
         e.printStackTrace();
         throw new SQLException("Error checking email existence for other user", e);
     }
 }
}
