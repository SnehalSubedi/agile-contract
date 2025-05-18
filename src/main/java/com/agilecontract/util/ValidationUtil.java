package com.agilecontract.util;

import java.util.regex.Pattern;

/**
 * Utility class for validating user input.
 */
public class ValidationUtil {

    // Patterns
    private static final Pattern FULL_NAME_PATTERN = Pattern.compile("^[A-Za-z]+(?: [A-Za-z]+){0,2}$");
    private static final Pattern CONTACT_PATTERN = Pattern.compile("^(97|98)[0-9]{8}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[\\w.-]+@[\\w.-]+\\.\\w{2,}$");
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z]{1,15}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^.{7,}$"); // At least 7 characters
    private static final Pattern IMAGE_FILE_PATTERN = Pattern.compile("(?i)\\.(jpg|jpeg|png|gif)$");

    // Constants for max lengths
    private static final int MAX_USERNAME_LENGTH = 15;
    private static final int MAX_FULLNAME_LENGTH = 50;
    private static final int MAX_EMAIL_LENGTH = 100;
    private static final int MAX_PASSWORD_LENGTH = 100;
    private static final int MAX_CONTACT_LENGTH = 10;
    private static final long MAX_IMAGE_SIZE = 5 * 1024 * 1024; // 5MB

    public static boolean isNullOrEmpty(String input) {
        return input == null || input.trim().isEmpty();
    }

    public static boolean isValidFullName(String fullName) {
        return !isNullOrEmpty(fullName) && 
               FULL_NAME_PATTERN.matcher(fullName).matches() &&
               fullName.length() <= MAX_FULLNAME_LENGTH;
    }

    public static boolean isValidContactNumber(String contact) {
        return !isNullOrEmpty(contact) && 
               CONTACT_PATTERN.matcher(contact).matches() &&
               contact.length() == MAX_CONTACT_LENGTH;
    }

    public static boolean isValidEmail(String email) {
        return !isNullOrEmpty(email) && 
               EMAIL_PATTERN.matcher(email).matches() &&
               email.length() <= MAX_EMAIL_LENGTH;
    }

    public static boolean isValidUsername(String username) {
        return !isNullOrEmpty(username) && 
               USERNAME_PATTERN.matcher(username).matches() &&
               username.length() <= MAX_USERNAME_LENGTH;
    }

    public static boolean isValidPassword(String password) {
        return !isNullOrEmpty(password) && 
               PASSWORD_PATTERN.matcher(password).matches() &&
               password.length() <= MAX_PASSWORD_LENGTH;
    }

    public static boolean isValidImageFile(String fileName) {
        if (isNullOrEmpty(fileName)) {
            return false;
        }
        return IMAGE_FILE_PATTERN.matcher(fileName).find();
    }

    public static boolean isValidImageSize(long fileSize) {
        return fileSize > 0 && fileSize <= MAX_IMAGE_SIZE;
    }
}
