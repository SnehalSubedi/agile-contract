package com.agilecontract.controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import com.agilecontract.service.DeleteNegotiatorService;

@WebServlet("/DeleteNegotiatorServlet")
public class DeleteNegotiatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private DeleteNegotiatorService deleteNegotiatorService = new DeleteNegotiatorService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.print("in delete negociator servlet");

        // Get the negotiator ID from request parameter
        String idParam = request.getParameter("id");
        System.out.print(idParam);
        
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Negotiator ID is required");
            return;
        }

        try {
            int negotiatorId = Integer.parseInt(idParam);
            boolean success = deleteNegotiatorService.deleteNegotiator(negotiatorId);
            
            if (success) {
                // Set success message and redirect to negotiators list
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Negotiator deleted successfully");
                response.sendRedirect(request.getContextPath() + "/FetchAllNegotiator");
            } else {
                // Set error message and redirect back
                request.getSession().setAttribute("errorMessage", "Failed to delete negotiator");
                response.sendRedirect(request.getContextPath() + "/FetchAllNegotiator");
            }
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Negotiator ID format");
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/FetchAllNegotiator");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error deleting negotiator: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/FetchAllNegotiator");
        }
    }
}
