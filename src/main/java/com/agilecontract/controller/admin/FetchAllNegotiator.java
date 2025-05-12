package com.agilecontract.controller.admin;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;
@WebServlet("/FetchAllNegotiator")
public class FetchAllNegotiator extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (Connection conn = DbConfig.getConnection()) {
            ArrayList<User> negotiators = getAllNegotiators(conn);
            
            request.setAttribute("negotiators", negotiators);
            System.out.print(negotiators.getFirst().getImagePath());
            request.getRequestDispatcher("WEB-INF/pages/admin/negotiators.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching negotiators: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/admin/error.jsp").forward(request, response);
        }
    }

    private ArrayList<User> getAllNegotiators(Connection conn) throws SQLException {
        ArrayList<User> negotiators = new ArrayList<>();
        String query = "SELECT UserID, FullName, Email, ContactNumber,image_path FROM users WHERE Role = 'ContractNegotiator' ORDER BY FullName";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setContactNumber(rs.getString("ContactNumber"));
                user.setImagePath(rs.getString("image_path"));

                negotiators.add(user);
            }
        }
        return negotiators;
    }
}