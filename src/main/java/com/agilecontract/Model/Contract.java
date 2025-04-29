package com.agilecontract.Model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Contract {
    private int id;
    private String contractName;
    private String clientName;
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal value;
    private String status;
    private String createdBy;
    private Integer negotiatorId;
    private String negotiatorName;

    // Date formatter for string conversion
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // Constructors
    public Contract() {
    }

    public Contract(int id, String contractName, String clientName, LocalDate startDate, LocalDate endDate,
            BigDecimal value, String status, String createdBy, Integer negotiatorId, String negotiatorName) {
        this.id = id;
        this.contractName = contractName;
        this.clientName = clientName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.value = value;
        this.status = status;
        this.createdBy = createdBy;
        this.negotiatorId = negotiatorId;
        this.negotiatorName = negotiatorName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    // Date handling with both LocalDate and String formats
    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public String getStartDateAsString() {
        return startDate != null ? startDate.format(DATE_FORMATTER) : null;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate != null && !startDate.isEmpty() ? LocalDate.parse(startDate) : null;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getEndDateAsString() {
        return endDate != null ? endDate.format(DATE_FORMATTER) : null;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate != null && !endDate.isEmpty() ? LocalDate.parse(endDate) : null;
    }

    // Value handling with both BigDecimal and double for convenience
    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    public double getValueAsDouble() {
        return value != null ? value.doubleValue() : 0.0;
    }

    public void setValue(double value) {
        this.value = BigDecimal.valueOf(value);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getNegotiatorId() {
        return negotiatorId;
    }

    public void setNegotiatorId(Integer negotiatorId) {
        this.negotiatorId = negotiatorId;
    }

    public String getNegotiatorName() {
        return negotiatorName;
    }

    public void setNegotiatorName(String negotiatorName) {
        this.negotiatorName = negotiatorName;
    }

    // Utility methods
    public boolean isActive() {
        return "Active".equalsIgnoreCase(status);
    }

    public boolean isExpired() {
        return "Expired".equalsIgnoreCase(status);
    }

    public boolean isPending() {
        return "Pending".equalsIgnoreCase(status);
    }

    public boolean isDraft() {
        return "Draft".equalsIgnoreCase(status);
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", contractName='" + contractName + '\'' +
                ", clientName='" + clientName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", value=" + value +
                ", status='" + status + '\'' +
                ", createdBy='" + createdBy + '\'' +
                ", negotiatorId=" + negotiatorId +
                ", negotiatorName='" + negotiatorName + '\'' +
                '}';
    }
}