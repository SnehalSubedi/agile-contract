package com.agilecontract.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Invalidate the session
        HttpSession session = request.getSession(false); // Get existing session, don't create a new one
        if (session != null) {
            session.invalidate();
        }

        // 2. Remove all cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setValue(""); // Clear the cookie value
                cookie.setPath("/"); // Very important! Set path
                cookie.setMaxAge(0); // Expire the cookie immediately
                response.addCookie(cookie);
            }
        }

        // 3. Redirect to login page or home page
        response.sendRedirect("login"); // Adjust the path if needed
    }
}
