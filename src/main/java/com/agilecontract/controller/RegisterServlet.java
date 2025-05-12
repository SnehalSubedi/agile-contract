package com.agilecontract.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.agilecontract.service.RegisterService;
import com.agilecontract.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1MB
    maxFileSize = 5 * 1024 * 1024,     // 5MB
    maxRequestSize = 10 * 1024 * 1024  // 10MB
)
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("signuperror", null); // Clear any existing errors
        request.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contact");
        Part filePart = request.getPart("profileImage");

        // Basic null/empty checks
        if (ValidationUtil.isNullOrEmpty(username) || ValidationUtil.isNullOrEmpty(password) ||
            ValidationUtil.isNullOrEmpty(fullName) || ValidationUtil.isNullOrEmpty(email) ||
            ValidationUtil.isNullOrEmpty(contactNumber) || filePart == null || filePart.getSize() == 0) {
            request.setAttribute("signuperror", "All fields are required.");
            forwardToSignup(request, response);
            return;
        }

        // Validate image file
        String fileName = filePart.getSubmittedFileName();
        if (!ValidationUtil.isValidImageFile(fileName)) {
            request.setAttribute("signuperror", "Invalid image format. Only JPG, JPEG, PNG, or GIF allowed.");
            forwardToSignup(request, response);
            return;
        }

        if (!ValidationUtil.isValidImageSize(filePart.getSize())) {
            request.setAttribute("signuperror", "Image size must be between 1KB and 5MB.");
            forwardToSignup(request, response);
            return;
        }

        // Validate other fields
        if (!ValidationUtil.isValidUsername(username)) {
            request.setAttribute("signuperror", "Username must be 1-15 letters, no numbers or symbols.");
            forwardToSignup(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            request.setAttribute("signuperror", "Password must be at least 7 characters long.");
            forwardToSignup(request, response);
            return;
        }

        if (!ValidationUtil.isValidFullName(fullName)) {
            request.setAttribute("signuperror", "Full name must contain 1-3 words using letters only.");
            forwardToSignup(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("signuperror", "Please enter a valid email address.");
            forwardToSignup(request, response);
            return;
        }

        if (!ValidationUtil.isValidContactNumber(contactNumber)) {
            request.setAttribute("signuperror", "Contact number must start with 97 or 98 and be 10 digits.");
            forwardToSignup(request, response);
            return;
        }

        try {
            boolean success = registerService.registerUser(
                username, password, fullName, email, contactNumber, filePart, getServletContext());

            if (success) {
                response.sendRedirect("login");
            } else {
                request.setAttribute("signuperror", "Registration failed. Username or Email may already exist.");
                forwardToSignup(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("signuperror", "Database error occurred. Please try again.");
            forwardToSignup(request, response);
        }
    }

    private void forwardToSignup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(request, response);
    }
}