package com.agilecontract.Model;

public class User {
    private int id;
    private String username;
    private String password; // Raw password (for form handling, but shouldn't be stored as plain text))
    private String fullName;
    private String email;
    private String contactNumber;
    private String role;
    private String imagePath;
    private String passwordHash; // Hashed password for storage

    // Constructor without ID for new users (stores password as plain text for
    // processing)
    public User(String username, String password, String fullName, String email, String contactNumber, String role,
            String passwordHash) {
        this.username = username;
        this.password = password; // Raw password
        this.fullName = fullName;
        this.email = email;
        this.contactNumber = contactNumber;
        this.role = role;
        this.passwordHash = passwordHash; // Store hashed password
    }

    // Constructor with ID for existing users
    public User(int id, String username, String password, String fullName, String email, String contactNumber,
            String role, String imagePath, String passwordHash) {
        this.id = id;
        this.username = username;
        this.password = password; // Raw password
        this.fullName = fullName;
        this.email = email;
        this.contactNumber = contactNumber;
        this.role = role;
        this.imagePath = imagePath;
        this.passwordHash = passwordHash; // Store hashed password
    }

    public User() {

    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password; // Raw password for validation purposes (consider not using it directly)
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
