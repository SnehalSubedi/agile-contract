package com.agilecontract.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.agilecontract.config.DbConfig;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;
import com.agilecontract.util.*;

public class RegisterService {

    public boolean registerUser(String username, String password, String fullName, String email, String contactNumber,
            Part profileImagePart, ServletContext context) throws IOException, SQLException {

        try (Connection conn = DbConfig.getConnection()) {

            // Check if username or email already exists
            String checkQuery = "SELECT COUNT(*) FROM users WHERE Username = ? OR Email = ?";
            try (PreparedStatement checkPs = conn.prepareStatement(checkQuery)) {
                checkPs.setString(1, username.trim());
                checkPs.setString(2, email.trim());
                ResultSet rs = checkPs.executeQuery();

                if (rs.next() && rs.getInt(1) > 0) {
                    return false; // Username or email already exists
                }
            }

            // Save profile image
            String fileName = ImageUtil.saveProfileImage(context, profileImagePart, "negotiator");
            if (fileName == null) {
                return false; // Image upload failed
            }

            // Hash password
            String passwordHash = "";
            try {
                passwordHash = PasswordUtil.hashPassword(password.trim());
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            // Insert new user
            String insertQuery = "INSERT INTO users (Username, PasswordHash, FullName, Email, ContactNumber, Role, image_path) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement insertPs = conn.prepareStatement(insertQuery)) {
                insertPs.setString(1, username.trim());
                insertPs.setString(2, passwordHash);
                insertPs.setString(3, fullName.trim());
                insertPs.setString(4, email.trim());
                insertPs.setString(5, contactNumber.trim());
                insertPs.setString(6, "ContractNegotiator");
                insertPs.setString(7, fileName);

                int result = insertPs.executeUpdate();
                return result > 0;
            }
        }
    }
}
