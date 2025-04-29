package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.agilecontract.Model.Contract;
import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;

public class DashboardService {

    public static int[] getContractCounts() throws SQLException {
        int[] counts = new int[4]; // Active, Pending, Draft, Expired

        try (Connection conn = DbConfig.getConnection()) {
            String countQuery = "SELECT Status, COUNT(*) AS count FROM contracts GROUP BY Status";
            try (PreparedStatement stmt = conn.prepareStatement(countQuery)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String status = rs.getString("Status");
                    int count = rs.getInt("count");

                    switch (status) {
                        case "Active":
                            counts[0] = count;
                            break;
                        case "Pending":
                            counts[1] = count;
                            break;
                        case "Draft":
                            counts[2] = count;
                            break;
                        case "Expired":
                            counts[3] = count;
                            break;
                    }
                }
            }
        }
        return counts;
    }

    public static ArrayList<Contract> getRecentContracts() throws SQLException {
        ArrayList<Contract> recentContracts = new ArrayList<>();

        try (Connection conn = DbConfig.getConnection()) {
            String listQuery = "SELECT c.*, u.FullName AS NegotiatorName " +
                    "FROM contracts c " +
                    "LEFT JOIN users u ON c.NegotiatorID = u.UserID " +
                    "ORDER BY c.ContractID DESC LIMIT 5";
            try (PreparedStatement stmt = conn.prepareStatement(listQuery)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Contract c = mapContractFromResultSet(rs);
                    recentContracts.add(c);
                }
            }
        }
        return recentContracts;
    }

    private static Contract mapContractFromResultSet(ResultSet rs) throws SQLException {
        Contract c = new Contract();
        c.setId(rs.getInt("ContractID"));
        c.setContractName(rs.getString("ContractName"));
        c.setClientName(rs.getString("ClientName"));
        c.setStartDate(rs.getString("StartDate"));
        c.setEndDate(rs.getString("EndDate"));
        c.setValue(rs.getDouble("Value"));
        c.setStatus(rs.getString("Status"));
        c.setCreatedBy(rs.getString("CreatedBy"));
        c.setNegotiatorId(rs.getInt("NegotiatorID"));
        c.setNegotiatorName(rs.getString("NegotiatorName"));
        return c;
    }

    public static ArrayList<User> getAllNegotiators() throws SQLException {
        ArrayList<User> negotiators = new ArrayList<>();

        try (Connection conn = DbConfig.getConnection()) {
            String query = "SELECT UserID, FullName, Email, ContactNumber FROM users WHERE Role = 'ContractNegotiator'";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("UserID"));
                    user.setFullName(rs.getString("FullName"));
                    user.setEmail(rs.getString("Email"));
                    user.setContactNumber(rs.getString("ContactNumber"));
                    negotiators.add(user);
                }
            }
        }
        return negotiators;
    }

    // New method to get contract details by contractId
    public static Contract getContractDetails(int contractId) throws SQLException {
        Contract contract = null;

        try (Connection conn = DbConfig.getConnection()) {
            String query = "SELECT c.*, u.FullName AS NegotiatorName " +
                    "FROM contracts c " +
                    "LEFT JOIN users u ON c.NegotiatorID = u.UserID " +
                    "WHERE c.ContractID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, contractId); // Set the contract ID in the query
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    contract = mapContractFromResultSet(rs);
                }
            }
        }
        return contract; // Will return null if no contract is found with the given ID
    }
}
