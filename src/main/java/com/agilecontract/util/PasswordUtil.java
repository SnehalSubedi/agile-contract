package com.agilecontract.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Utility class for handling password hashing and verification.
 * <p>
 * This class provides methods for hashing passwords using SHA-256
 * and verifying plaintext passwords against hashed values.
 * </p>
 */
public class PasswordUtil {

    public PasswordUtil() {
        // Default constructor
    }

    /**
     * Hashes a password using the SHA-256 algorithm.
     * 
     * @param password the plaintext password to hash
     * @return the hashed password in hexadecimal format
     */
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Hashing algorithm not found.", e);
        }
    }

    /**
     * Verifies if the given plaintext password matches the hashed password.
     * 
     * @param plaintextPassword the plaintext password to verify
     * @param hashedPassword    the previously hashed password
     * @return true if the passwords match, false otherwise
     */
    public boolean verifyPassword(String plaintextPassword, String hashedPassword) {
        String hashedInput = hashPassword(plaintextPassword);
        return hashedInput.equals(hashedPassword);
    }
}
