package com.agilecontract.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.agilecontract.Model.Contract;
import com.agilecontract.Model.User;
import com.agilecontract.service.DashboardService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Admin-Dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            showDashboard(request, response);
        } else {
            switch (action) {
                case "viewContracts":
                    viewAllContracts(request, response);
                    break;
                case "viewContract":
                    viewContractDetails(request, response);
                    break;
                case "viewNegotiators":
                    viewAllNegotiators(request, response);
                    break;
                default:
                    showDashboard(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch contract counts and recent contracts
            int[] contractCounts = DashboardService.getContractCounts();
            ArrayList<Contract> recentContracts = DashboardService.getRecentContracts();

            setUserAttributes(request);
            request.setAttribute("activeContracts", contractCounts[0]);
            request.setAttribute("pendingContracts", contractCounts[1]);
            request.setAttribute("draftContracts", contractCounts[2]);
            request.setAttribute("expiredContracts", contractCounts[3]);
            request.setAttribute("recentContracts", recentContracts);

            forwardToPage(request, response, "WEB-INF/pages/admin/dashboard.jsp");
        } catch (SQLException e) {
            handleError(request, response, "An error occurred while fetching dashboard data.", e);
        }
    }

    private void viewAllContracts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ArrayList<Contract> contracts = DashboardService.getAllContract();
            setUserAttributes(request);
            request.setAttribute("contracts", contracts);
            forwardToPage(request, response, "WEB-INF/pages/admin/contracts.jsp");
        } catch (SQLException e) {
            handleError(request, response, "An error occurred while fetching contracts.", e);
        }
    }

    private void viewContractDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String contractId = request.getParameter("id");
        
        if (contractId == null || contractId.isEmpty()) {
            handleError(request, response, "Contract ID is required.", null);
            return;
        }

        try {
            // Fetch contract details and negotiators for dropdown
            Contract contract = DashboardService.getContractDetails(Integer.parseInt(contractId));
            ArrayList<User> negotiators = DashboardService.getAllNegotiators();

            setUserAttributes(request);
            request.setAttribute("contract", contract);
            request.setAttribute("negotiators", negotiators);
            forwardToPage(request, response, "WEB-INF/pages/admin/contractDetails.jsp");
        } catch (SQLException e) {
            handleError(request, response, "An error occurred while fetching contract details.", e);
        }
    }

    private void viewAllNegotiators(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ArrayList<User> negotiators = DashboardService.getAllNegotiators();
            setUserAttributes(request);
            request.setAttribute("negotiators", negotiators);
            forwardToPage(request, response, "WEB-INF/pages/admin/negotiators.jsp");
        } catch (SQLException e) {
            handleError(request, response, "An error occurred while fetching negotiators.", e);
        }
    }

    private void setUserAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            userName = "Admin";  // Fallback value
        }
        request.setAttribute("userName", userName);
    }

    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, 
                           String message, Exception e) throws ServletException, IOException {
        if (e != null) {
            e.printStackTrace();
            // Consider using a logging framework here
        }
        request.setAttribute("errorMessage", message);
        forwardToPage(request, response, "admin/error.jsp");
    }
}
