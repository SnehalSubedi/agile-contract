package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.agilecontract.Model.Contract;
import com.agilecontract.config.DbConfig;

public class ContractService {

    // Method to fetch contract details from the database
    public Contract getContractDetails(int contractId) throws SQLException {
        Contract contract = null;
        try (Connection conn = DbConfig.getConnection()) {
            String query = "SELECT * FROM contracts WHERE ContractID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, contractId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    contract = new Contract();
                    contract.setId(rs.getInt("ContractID"));
                    contract.setContractName(rs.getString("ContractName"));
                    contract.setClientName(rs.getString("ClientName"));
                    contract.setStartDate(rs.getString("StartDate"));
                    contract.setEndDate(rs.getString("EndDate"));
                    contract.setValue(rs.getDouble("Value"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setCreatedBy(rs.getString("CreatedBy"));
                    contract.setNegotiatorId(rs.getInt("NegotiatorID"));
                }
            }
        }
        return contract;
    }

    // Method to update contract details in the database
    public boolean updateContract(int contractId, String contractName, String clientName,
            String startDate, String endDate, double value, String status) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            String updateQuery = "UPDATE contracts SET ContractName = ?, ClientName = ?, StartDate = ?, EndDate = ?, Value = ?, Status = ? WHERE ContractID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                stmt.setString(1, contractName);
                stmt.setString(2, clientName);
                stmt.setString(3, startDate);
                stmt.setString(4, endDate);
                stmt.setDouble(5, value);
                stmt.setString(6, status);
                stmt.setInt(7, contractId);
                int rowsUpdated = stmt.executeUpdate();
                return rowsUpdated > 0;
            }
        }
    }
    // Method to delete contract from the database by ID
    public boolean deleteContract(int contractId) throws SQLException {
        try (Connection conn = DbConfig.getConnection()) {
            String deleteQuery = "DELETE FROM contracts WHERE ContractID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteQuery)) {
                stmt.setInt(1, contractId);
                int rowsDeleted = stmt.executeUpdate();
                return rowsDeleted > 0;
            }
        }
    }
}
