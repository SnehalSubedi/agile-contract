package com.agilecontract.controller.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.agilecontract.service.UserService;
import com.agilecontract.util.PasswordUtil;
import com.agilecontract.util.ImageUtil;
import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;

@WebServlet("/EditNegotiatorServlet")
@MultipartConfig
public class EditNegotiatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DbConfig.getConnection()) {
            int negotiatorId = Integer.parseInt(request.getParameter("id"));
            UserService userService = new UserService(conn);
            User negotiator = userService.getUserById(negotiatorId);
            
            if (negotiator != null) {
                request.setAttribute("negotiator", negotiator);
                request.getRequestDispatcher("WEB-INF/pages/admin/edit-negotiator.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Negotiator not found");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving negotiator data");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int negotiatorId = Integer.parseInt(request.getParameter("negotiatorId"));
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String role = request.getParameter("role");

        try (Connection conn = DbConfig.getConnection()) {
            UserService userService = new UserService(conn);
            User existingUser = userService.getUserById(negotiatorId);
            
            if (existingUser == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Negotiator not found");
                return;
            }

            // Check if username is being changed to one that already exists
            if (!existingUser.getUsername().equals(username) && userService.usernameExists(username)) {
                request.setAttribute("userNameError", "Username already exists");
                request.setAttribute("negotiator", existingUser);
                request.getRequestDispatcher("WEB-INF/pages/admin/edit-negotiator.jsp").forward(request, response);
                return;
            }

            // Check if email is being changed to one that already exists
            if (!existingUser.getEmail().equals(email) && userService.emailExists(email)) {
                request.setAttribute("emailError", "Email already exists");
                request.setAttribute("negotiator", existingUser);
                request.getRequestDispatcher("WEB-INF/pages/admin/edit-negotiator.jsp").forward(request, response);
                return;
            }

            // Handle password update (only if new password provided)
            String passwordHash = existingUser.getPasswordHash();
            if (password != null && !password.isEmpty()) {
                passwordHash = PasswordUtil.hashPassword(password);
            }

            // Handle image upload
            Part filePart = request.getPart("image");
            String imagePath = existingUser.getImagePath();
            
            if (filePart != null && filePart.getSize() > 0) {
            	System.out.print("Something is in fileparttt");
                imagePath = ImageUtil.saveProfileImage(getServletContext(), filePart, "negotiator");
            }

            // Update user details
            User updatedUser = new User(
                negotiatorId,
                username,
                password, // Raw password (not used for storage)
                fullName,
                email,
                contactNumber,
                role,
                imagePath,
                passwordHash // Hashed password for storage
            );

            boolean success = userService.updateUser(updatedUser);
            if (success) {
            	String successMessage = "Negotiator updated successfully";

                request.setAttribute("successMessage", "Negotiator updated successfully");
                request.setAttribute("negotiator", updatedUser);
                request.getRequestDispatcher("WEB-INF/pages/admin/edit-negotiator.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update negotiator");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating negotiator: " + e.getMessage());
        }
    }
}