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

@WebServlet("/AddNegotiatorServlet")
@MultipartConfig
public class AddNegotiatorServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Forward request to JSP page using RequestDispatcher
	    request.getRequestDispatcher("WEB-INF/pages/admin/add-negotiator.jsp").forward(request, response);
	}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordHash = PasswordUtil.hashPassword(password); // Hash the password
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");

        // Force role as "ContractNegotiator"
        String role = "ContractNegotiator";

        // Handle image upload using ImageUtil
        Part filePart = request.getPart("image");
        String imagePath = ImageUtil.saveProfileImage(getServletContext(), filePart, "negotiator");

        try (Connection conn = DbConfig.getConnection()) {
            UserService userService = new UserService(conn);
            if (userService.usernameExists(username)) {
                request.setAttribute("message", "Username already exists.");
                request.getRequestDispatcher("WEB-INF/pages/admin/add-negotiator.jsp").forward(request, response);
            } else {
                // Create a new user with the hashed password
                User user = new User(username, password, fullName, email, contactNumber, role, passwordHash);
                user.setImagePath(imagePath);

                boolean success = userService.addUser(user);
                if (success) {
                    response.sendRedirect("/agile-contract/Admin-Dashboard");
                } else {
                    request.setAttribute("message", "Error adding user.");
                    request.getRequestDispatcher("WEB-INF/pages/admin/add-negotiator.jsp").forward(request, response);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
