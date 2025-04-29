package com.agilecontract.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.agilecontract.Model.Contract;
import com.agilecontract.config.DbConfig;

public class HomeService {

    public List<Contract> getContractsForNegotiator(int negotiatorId) throws Exception {
        List<Contract> contractList = new ArrayList<>();

        try (Connection conn = DbConfig.getConnection()) {
            String sql = "SELECT * FROM contracts WHERE NegotiatorID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, negotiatorId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Contract contract = new Contract();
                        contract.setId(rs.getInt("ContractID"));
                        contract.setContractName(rs.getString("ContractName"));
                        contract.setClientName(rs.getString("ClientName"));
                        contract.setStartDate(rs.getString("StartDate"));
                        contract.setEndDate(rs.getString("EndDate"));
                        contract.setValue(rs.getDouble("Value"));
                        contract.setStatus(rs.getString("Status"));
                        contract.setCreatedBy(rs.getString("CreatedBy"));
                        contract.setNegotiatorId(rs.getInt("NegotiatorID"));
                        contractList.add(contract);
                    }
                }
            }
        }

        return contractList;
    }
}
