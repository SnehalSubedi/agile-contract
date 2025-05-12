package com.agilecontract.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

import com.agilecontract.Model.User;
import com.agilecontract.service.AddContractService;
import com.agilecontract.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddContractServlet")
public class AddContractServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    private AddContractService addContractService;

    @Override
    public void init() throws ServletException {
        addContractService = new AddContractService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<User> negotiators = addContractService.getNegotiators();
            request.setAttribute("negotiators", negotiators);
            request.getRequestDispatcher("WEB-INF/pages/admin/add-contract.jsp").forward(request, response);
        } catch (Exception e) {
            handleError(response, "Error loading negotiators: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get parameters
        String contractName = request.getParameter("contractName");
        String client = request.getParameter("client");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String valueStr = request.getParameter("value");
        String status = request.getParameter("status");
        String negotiatorIdStr = request.getParameter("negotiator");
        String createdBy = "admin"; // TODO: get from session if available

        // Validate required fields
        if (ValidationUtil.isNullOrEmpty(contractName) || 
            ValidationUtil.isNullOrEmpty(client) ||
            ValidationUtil.isNullOrEmpty(startDateStr) ||
            ValidationUtil.isNullOrEmpty(endDateStr) ||
            ValidationUtil.isNullOrEmpty(valueStr) ||
            ValidationUtil.isNullOrEmpty(status) ||
            ValidationUtil.isNullOrEmpty(negotiatorIdStr)) {
            
            request.setAttribute("error", "All fields are required");
            forwardWithNegotiators(request, response);
            return;
        }

        // Validate contract name
        if (contractName.length() > 100) {
            request.setAttribute("error", "Contract name must be less than 100 characters");
            forwardWithNegotiators(request, response);
            return;
        }

        // Validate client name
        if (client.length() > 100) {
            request.setAttribute("error", "Client name must be less than 100 characters");
            forwardWithNegotiators(request, response);
            return;
        }

        // Validate dates
        LocalDate startDate;
        LocalDate endDate;
        try {
            startDate = LocalDate.parse(startDateStr, DATE_FORMATTER);
            endDate = LocalDate.parse(endDateStr, DATE_FORMATTER);
            
            if (startDate.isAfter(endDate)) {
                request.setAttribute("error", "End date must be after start date");
                forwardWithNegotiators(request, response);
                return;
            }
            
            if (startDate.isBefore(LocalDate.now())) {
                request.setAttribute("error", "Start date cannot be in the past");
                forwardWithNegotiators(request, response);
                return;
            }
        } catch (DateTimeParseException e) {
            request.setAttribute("error", "Invalid date format. Please use YYYY-MM-DD");
            forwardWithNegotiators(request, response);
            return;
        }

        // Validate contract value
        double value;
        try {
            value = Double.parseDouble(valueStr);
            if (value <= 0) {
                request.setAttribute("error", "Contract value must be positive");
                forwardWithNegotiators(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid contract value format");
            forwardWithNegotiators(request, response);
            return;
        }

        // Validate status
        if (!status.equals("Active") && !status.equals("Pending") && !status.equals("Draft")&&!status.equals("Expired")) {
            request.setAttribute("error", "Invalid contract status");
            forwardWithNegotiators(request, response);
            return;
        }

        int negotiatorId;
        try {
            negotiatorId = Integer.parseInt(negotiatorIdStr);
            if (negotiatorId <= 0) {
                request.setAttribute("error", "Invalid negotiator selected");
                forwardWithNegotiators(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid negotiator format");
            forwardWithNegotiators(request, response);
            return;
        }

        try {
            boolean success = addContractService.addContract(
                contractName, client, startDateStr, endDateStr, value, status, createdBy, negotiatorId);

            if (success) {
            	response.sendRedirect(request.getContextPath() + "/Admin-Dashboard?action=viewContracts");
//                response.sendRedirect("DashboardServlet");
            } else {
                request.setAttribute("error", "Failed to add contract. Please try again.");
                forwardWithNegotiators(request, response);
            }
        } catch (Exception e) {
            handleError(response, "Error adding contract: " + e.getMessage());
        }
    }

    private void forwardWithNegotiators(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<User> negotiators = addContractService.getNegotiators();
            request.setAttribute("negotiators", negotiators);
            request.getRequestDispatcher("WEB-INF/pages/admin/add-contract.jsp").forward(request, response);
        } catch (Exception e) {
            handleError(response, "Error loading negotiators: " + e.getMessage());
        }
    }

    private void handleError(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3 style='color:red;'>" + message + "</h3>");
    }
}