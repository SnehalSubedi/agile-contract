package com.agilecontract.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;
import com.agilecontract.util.ImageUtil;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public class ProfileService {

    private static final String UPLOAD_DIR = "images/users";

    public User fetchUserFromDB(int userId) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            String query = "SELECT * FROM users WHERE UserID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("username"),
                        "hidden", // You might want to encrypt this or handle it securely
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("contactNumber"),
                        rs.getString("role"),
                        rs.getString("image_path"),
                        rs.getString("passwordHash"));
            }
        }
        return null;
    }

    public boolean updateProfile(User user, String fullName, String email, String contactNumber) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            String query = "UPDATE users SET fullName=?, email=?, contactNumber=? WHERE UserID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, contactNumber);
            ps.setInt(4, user.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public boolean updateProfileImage(User user, Part filePart, ServletContext context, String uploadBasePath)
            throws SQLException, IOException {
        if (filePart == null || filePart.getSubmittedFileName() == null || filePart.getSubmittedFileName().isEmpty()) {
            return false;
        }

        // Call the ImageUtil to handle the profile image update
        ImageUtil imageUtil = new ImageUtil();
        String newFileName = imageUtil.updateProfileImage(context, filePart, user.getImagePath(), uploadBasePath);

        // Update the database with the new image path
        try (Connection conn = DbConfig.getConnection()) {
            String query = "UPDATE users SET image_path=? WHERE UserID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newFileName);
            ps.setInt(2, user.getId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                user.setImagePath(newFileName); // Update the user object with the new image path
                return true;
            }
        }
        return false;
    }
}
