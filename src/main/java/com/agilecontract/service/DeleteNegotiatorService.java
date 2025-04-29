package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.agilecontract.config.DbConfig;

public class DeleteNegotiatorService {

    // Method to check if the negotiator is assigned to any contracts
    public boolean isNegotiatorAssignedToContracts(Connection conn, int negotiatorId) throws SQLException {
        String query = "SELECT COUNT(*) FROM contracts WHERE NegotiatorID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, negotiatorId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }

    // Method to delete a negotiator
    public boolean deleteNegotiator(int negotiatorId) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            // First check if the negotiator is assigned to any contracts
            if (isNegotiatorAssignedToContracts(conn, negotiatorId)) {
                return false; // Or handle this case differently (e.g., notify the user)
            }

            // Delete the negotiator from the 'users' table
            String query = "DELETE FROM users WHERE UserID = ? AND Role = 'ContractNegotiator'";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, negotiatorId);
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        }
    }
}
