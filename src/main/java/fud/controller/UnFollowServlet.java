package fud.controller;

import fud.dao.UserDAO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UnFollowServlet", value = "/UnFollowServlet")
public class UnFollowServlet extends HttpServlet {
    private String redirectPage = "GetUserProfileServlet";
    private final String errorPage = "accessDenied.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String requestedUserID = request.getParameter("UserID");
            HttpSession session = request.getSession();
            String currentUserID = ((UserDTO) session.getAttribute("CURRENTUSER")).getUserID();

            if (new UserDAO().unFollowUserByUserID(currentUserID, requestedUserID)){
                redirectPage += "?userID="+requestedUserID;
                response.sendRedirect(redirectPage);
            } else {
                response.sendRedirect(errorPage);
            }
        } catch (Exception e){
            System.out.println("FollowUserServlet GET ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
