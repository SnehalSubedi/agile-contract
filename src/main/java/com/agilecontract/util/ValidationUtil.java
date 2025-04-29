package com.agilecontract.util;

/**
 * Utility class for validating user input.
 * <p>
 * Provides methods to check if fields are empty or meet certain conditions.
 * </p>
 */
public class ValidationUtil {

    public ValidationUtil() {
        // Default constructor
    }

    public static boolean isNullOrEmpty(String input) {
        return input == null || input.trim().isEmpty();
    }
}
