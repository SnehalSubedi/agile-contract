package com.agilecontract.util;

import jakarta.servlet.http.HttpSession;

import com.agilecontract.Model.User;

/**
 * Utility class for handling session operations.
 * <p>
 * Provides methods to set and get user-related session attributes.
 * </p>
 */
public class SessionUtil {

    public SessionUtil() {
        // Default constructor
    }

    public static void setUserSession(HttpSession session, User user) {
        session.setAttribute("username", user.getUsername());
        session.setAttribute("role", user.getRole());
        session.setAttribute("userId", user.getId());
        session.setAttribute("user", user);
        System.out.println(user.getImagePath());
        session.setAttribute("image_path", user.getImagePath());

    }
}
