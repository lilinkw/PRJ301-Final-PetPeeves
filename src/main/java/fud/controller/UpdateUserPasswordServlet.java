package fud.controller;

import fud.dao.UserDAO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateUserPasswordServlet", value = "/UpdateUserPasswordServlet")
public class UpdateUserPasswordServlet extends HttpServlet {
    private final String homePage = "NewsFeedServlet";
    private final String updatePage = "account-setting.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ACTION","Password" );
        request.getRequestDispatcher(updatePage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
            String userID = currentUser.getUserID();

            String password = request.getParameter("new-password");
            UserDAO userDAO = new UserDAO();
            userDAO.updateUserPassword(userID, password);

            // Update success
            // update session
            currentUser.setPassword(password);
        } catch (Exception e){
            System.out.println("UpdateUserPassWordServlet ERROR: " + e.getMessage());
        } finally {
            response.sendRedirect(homePage);
        }
    }
}
