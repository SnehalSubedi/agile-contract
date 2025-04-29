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
}
