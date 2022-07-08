package fud.controller;

import fud.dao.UserDAO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GetUserProfileServlet", value = "/GetUserProfileServlet")
public class GetUserProfileServlet extends HttpServlet {
    private final String profilePage = "user-profile.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String userID = request.getParameter("userID");
            UserDTO userDTO = new UserDAO().getUserInfoByUserID(userID);
            request.setAttribute("USERPROFILE", userDTO);
            //TODO: CHECK IF CURRENT USER FOLLOWED THE REQUESTED USER
            //TODO: get Post by userID
            request.getRequestDispatcher(profilePage).forward(request, response);
        } catch (Exception e){
            System.out.println("GetUserProfileServlet GET ERROR: " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
