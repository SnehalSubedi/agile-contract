package com.agilecontract.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/faq")
public class FaqServlet  extends HttpServlet{
	  @Override
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	            request.getRequestDispatcher("/WEB-INF/pages/faq.jsp").forward(request, response);

	       
	    }
}
