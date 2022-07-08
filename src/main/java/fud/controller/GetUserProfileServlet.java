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

        String userID = request.getParameter("userID");
        UserDTO userDTO = new UserDAO().getUserInfoByUserID(userID);
        request.setAttribute("USER", userDTO);
        //TODO: get Post by userID
        request.getRequestDispatcher(profilePage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
