package com.agilecontract.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.agilecontract.service.RegisterService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("error", null); // Clear any existing errors
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

        if (isNullOrEmpty(username) || isNullOrEmpty(password) || isNullOrEmpty(fullName) ||
                isNullOrEmpty(email) || isNullOrEmpty(contactNumber) || filePart == null) {
            request.setAttribute("signuperror", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(request, response);
            return;
        }

        try {
            boolean success = registerService.registerUser(username, password, fullName, email, contactNumber, filePart,
                    getServletContext());
            if (success) {
                response.sendRedirect("login");
            } else {
                request.setAttribute("signuperror", "Registration failed. Username or Email may already exist.");
                request.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("signuperror", "Database error occurred.");
            request.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(request, response);
        }
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
