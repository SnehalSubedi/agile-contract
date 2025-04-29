package com.agilecontract.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.agilecontract.Model.User;
import com.agilecontract.service.AddContractService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddContractServlet")
public class AddContractServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private AddContractService addContractService;

    @Override
    public void init() throws ServletException {
        addContractService = new AddContractService();
    }

    // Handle GET: Load negotiators
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<User> negotiators = addContractService.getNegotiators();
            request.setAttribute("negotiators", negotiators);
            request.getRequestDispatcher("WEB-INF/pages/admin/add-contract.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Error loading negotiators: " + e.getMessage() + "</h3>");
        }
    }

    // Handle POST: Save contract to database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String contractName = request.getParameter("contractName");
        String client = request.getParameter("client");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String valueStr = request.getParameter("value");
        String status = request.getParameter("status");
        String negotiatorIdStr = request.getParameter("negotiator");

        String createdBy = "admin"; // TODO: get from session if available

        try {
            double value = Double.parseDouble(valueStr);
            int negotiatorId = Integer.parseInt(negotiatorIdStr);

            boolean success = addContractService.addContract(contractName, client, startDate, endDate, value, status, createdBy, negotiatorId);

            if (success) {
                response.sendRedirect("DashboardServlet");
            } else {
                response.sendRedirect("WEB-INF/pages/admin/add-contract.jsp?error=Insert+failed");
            }
        } catch (NumberFormatException nfe) {
            response.sendRedirect("WEB-INF/pages/admin/add-contract.jsp?error=Invalid+value+format");
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
