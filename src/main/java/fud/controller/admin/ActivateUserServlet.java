package fud.controller.admin;

import fud.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ActivateUserServlet", value = "/admin/ActivateUserServlet")
public class ActivateUserServlet extends HttpServlet {
    private final String redirectPage = "GetAccountManagementServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = request.getParameter("userID");
            new UserDAO().unBanUserByUserID(userID);

//            new PostDAO().updatePostStatusByUserID(userID,true);
            response.sendRedirect(redirectPage);
        } catch (Exception e){
            System.out.println("DeactivateUserServlet GET ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
