package com.agilecontract.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.agilecontract.Model.User;
import com.agilecontract.service.ProfileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024
        * 100)
public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProfileService profileService;

    @Override
    public void init() throws ServletException {
        profileService = new ProfileService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            User updatedUser = profileService.fetchUserFromDB(user.getId());
            if (updatedUser != null) {
                session.setAttribute("user", updatedUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load user profile.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("updateProfile".equals(action)) {
                handleUpdateProfile(request, response, user);
            } else if ("updateImage".equals(action)) {
                handleUpdateImage(request, response, user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating profile.");
            doGet(request, response);
        }
    }

    private void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException, SQLException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");

        boolean success = profileService.updateProfile(user, fullName, email, contactNumber);

        if (success) {
            user.setFullName(fullName);
            user.setEmail(email);
            user.setContactNumber(contactNumber);
            request.getSession().setAttribute("user", user);
            request.setAttribute("success", "Profile updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        doGet(request, response);
    }

    private void handleUpdateImage(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException, SQLException {

        // Ensure the file is uploaded via multipart/form-data
        Part filePart = request.getPart("profileImage");
        if (filePart == null || filePart.getSubmittedFileName() == null || filePart.getSubmittedFileName().isEmpty()) {
            request.setAttribute("error", "No image selected.");
            doGet(request, response); // Forward to a JSP or do something appropriate
            return;
        }

        // Call the ProfileService to update the image
        boolean success = profileService.updateProfileImage(user, filePart, getServletContext(),
                getServletContext().getRealPath(""));

        if (success) {
            // Set success message to display to the user
            request.setAttribute("success", "Profile image updated successfully!");
        } else {
            // Set error message if update fails
            request.setAttribute("error", "Failed to update profile image.");
        }

        // Forward the request to a JSP page or re-direct to another page
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response); // Adjust as necessary
    }

}
