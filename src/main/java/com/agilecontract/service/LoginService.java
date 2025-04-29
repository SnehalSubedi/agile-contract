package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;

/**
 * Service class for handling login operations.
 * <p>
 * Interacts with the database to authenticate users.
 * </p>
 */
public class LoginService {

    public LoginService() {
        // Default constructor
    }

    public User authenticateUser(String username, String hashedPassword) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ? AND PasswordHash = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("username"),
                        null, // raw password is not available
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("contactNumber"),
                        rs.getString("role"),
                        rs.getString("image_path"),
                        rs.getString("passwordHash"));
            } else {
                return null;
            }
        }
    }
}
