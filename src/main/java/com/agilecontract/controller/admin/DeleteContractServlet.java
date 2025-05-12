package com.agilecontract.controller.admin;

import com.agilecontract.service.ContractService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class DeleteContractServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ContractService contractService = new ContractService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("contractId");
        if (idParam == null || idParam.isEmpty()) {
            request.setAttribute("errorMessage", "Missing contract ID.");
            request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp").forward(request, response);
            return;
        }

        int contractId;
        try {
            contractId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid contract ID.");
            request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp").forward(request, response);
            return;
        }

        try {
            boolean success = contractService.deleteContract(contractId);

            if (success) {
                response.sendRedirect("Admin-Dashboard?action=viewContracts&success=Delete Successfully");
            } else {
                request.setAttribute("errorMessage", "Failed to delete contract.");
                request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while deleting the contract.");
            request.getRequestDispatcher("WEB-INF/pages/admin/error.jsp").forward(request, response);
        }
    }
}
