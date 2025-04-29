package com.agilecontract.controller.admin;

import com.agilecontract.Model.Contract;
import com.agilecontract.service.ContractService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditContractServlet")
public class EditContractServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ContractService contractService = new ContractService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));

        try {
            // Fetch contract details from service
            Contract contract = contractService.getContractDetails(contractId);
            if (contract != null) {
                // Set contract details to request attributes
                request.setAttribute("contract", contract);
                // Forward to editContract.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/admin/editContract.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle contract not found scenario
                request.setAttribute("errorMessage", "Contract not found.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while fetching contract details.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        String contractName = request.getParameter("contractName");
        String clientName = request.getParameter("clientName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double value = Double.parseDouble(request.getParameter("value"));
        String status = request.getParameter("status");

        try {
            // Update contract details using service
            boolean success = contractService.updateContract(contractId, contractName, clientName, startDate, endDate, value, status);
            
            if (success) {
                response.sendRedirect("DashboardServlet");  // Redirect to the dashboard after successful update
            } else {
                request.setAttribute("errorMessage", "Failed to update contract.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating contract details.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
