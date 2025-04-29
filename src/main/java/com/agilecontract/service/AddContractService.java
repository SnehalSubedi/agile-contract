package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.agilecontract.Model.User;
import com.agilecontract.config.DbConfig;

public class AddContractService {

    public List<User> getNegotiators() throws Exception {
        List<User> negotiators = new ArrayList<>();
        try (Connection conn = DbConfig.getConnection()) {
            String sql = "SELECT UserID, FullName FROM users WHERE Role = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, "ContractNegotiator");
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        User user = new User();
                        user.setId(rs.getInt("UserID"));
                        user.setFullName(rs.getString("FullName"));
                        negotiators.add(user);
                    }
                }
            }
        }
        return negotiators;
    }

    public boolean addContract(String contractName, String client, String startDate, String endDate,
            double value, String status, String createdBy, int negotiatorId) throws Exception {
        try (Connection conn = DbConfig.getConnection()) {
            String sql = "INSERT INTO contracts (ContractName, ClientName, StartDate, EndDate, Value, Status, CreatedBy, NegotiatorID) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, contractName);
                stmt.setString(2, client);
                stmt.setString(3, startDate);
                stmt.setString(4, endDate);
                stmt.setDouble(5, value);
                stmt.setString(6, status);
                stmt.setString(7, createdBy);
                stmt.setInt(8, negotiatorId);

                int rows = stmt.executeUpdate();
                return rows > 0;
            }
        }
    }
}
