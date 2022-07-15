package fud.controller.admin;

import fud.dao.PostDAO;
import fud.dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeactivateUserServlet", value = "/admin/DeactivateUserServlet")
public class DeactivateUserServlet extends HttpServlet {
    private final String redirectPage = "GetAccountManagementServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = request.getParameter("userID");
            new UserDAO().banUserByUserID(userID);

            new PostDAO().updatePostStatusByUserID(userID,false);
            response.sendRedirect(redirectPage);
        } catch (Exception e){
            System.out.println("DeactivateUserServlet GET ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
