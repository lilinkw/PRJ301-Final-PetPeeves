package fud.controller;

import fud.dao.UserDAO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateUserInfoServlet", value = "/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
    private final String updatePage = "account-setting.jsp";
    private final String homePage = "ViewNewsFeedServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ACTION","Info" );
        request.setAttribute("TITLE", "Update User Info");
        request.getRequestDispatcher(updatePage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateUserInfoServlet POST");

        try {
            HttpSession session = request.getSession();
            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
            String userID = currentUser.getUserID();

            String fullName = request.getParameter("fullname");
            String dateOfBirth = request.getParameter("birthday");
            String gender = request.getParameter("gender");
            String location = request.getParameter("location");

            UserDAO userDAO = new UserDAO();
            userDAO.updateUserInfo(userID,fullName,dateOfBirth,gender,location);

            // Update success
            // Reload CURRENTUSER
            currentUser.setFullname(fullName);
            currentUser.setDateOfBirth(dateOfBirth);
            currentUser.setGender(gender);
            currentUser.setLocation(location);
        } catch (Exception e){
            System.out.println("UpdateUserServlet POST ERROR: " + e.getMessage());
        } finally {
            response.sendRedirect(homePage);
        }
    }
}
