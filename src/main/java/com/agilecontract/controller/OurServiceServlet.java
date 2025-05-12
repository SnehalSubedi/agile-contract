package com.agilecontract.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ourservices")
public class OurServiceServlet  extends HttpServlet{
	  @Override
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	            request.getRequestDispatcher("/WEB-INF/pages/our_services.jsp").forward(request, response);

	       
	    }
}
