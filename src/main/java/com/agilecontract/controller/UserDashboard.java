package com.agilecontract.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import com.agilecontract.Model.Contract;
import com.agilecontract.service.HomeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userdashboard")
public class UserDashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final HomeService homeService = new HomeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("/agile-contract/login");
            return;
        }

        int negotiatorId = (int) session.getAttribute("userId");

        try {
            List<Contract> contractList = homeService.getContractsForNegotiator(negotiatorId);
            request.setAttribute("contracts", contractList);
            request.getRequestDispatcher("/WEB-INF/pages/contract.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Error retrieving contracts: " + e.getMessage() + "</h3>");
        }
    }
}
