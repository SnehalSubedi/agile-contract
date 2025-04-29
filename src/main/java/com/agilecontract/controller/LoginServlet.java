package com.agilecontract.controller;

import com.agilecontract.Model.User;
import com.agilecontract.service.LoginService;
import com.agilecontract.util.PasswordUtil;
import com.agilecontract.util.SessionUtil;
import com.agilecontract.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LoginService loginService = new LoginService();
    private PasswordUtil passwordUtil = new PasswordUtil();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
        String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";

        // Validate fields
        if (ValidationUtil.isNullOrEmpty(username) || ValidationUtil.isNullOrEmpty(password)) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        // Hash the password
        String hashedPassword = passwordUtil.hashPassword(password);

        // Authenticate user
        try {
            User user = loginService.authenticateUser(username, hashedPassword);

            if (user != null) {
                HttpSession session = request.getSession();
                SessionUtil.setUserSession(session, user);

                // Redirect based on role
                if ("Admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/Admin-Dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Home");
                }
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}
