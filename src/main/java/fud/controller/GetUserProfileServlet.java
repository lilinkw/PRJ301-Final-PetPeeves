package fud.controller;

import fud.dao.PostDAO;
import fud.dao.UserDAO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetUserProfileServlet", value = "/GetUserProfileServlet")
public class GetUserProfileServlet extends HttpServlet {
    private final String profilePage = "user-profile.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");

            String requestedUserID = request.getParameter("userID");
            UserDTO requestedUser = new UserDAO().getUserInfoByUserID(requestedUserID);
            boolean isUserFollowed = new UserDAO().isUserFollowed(currentUser.getUserID(),requestedUserID);
            request.setAttribute("USERPROFILE", requestedUser);
            request.setAttribute("FOLLOWED", isUserFollowed);

            PostDAO postDAO = new PostDAO();
            List<PostDTO> postDTOList = postDAO.getPostByAuthorID(requestedUserID);
            request.setAttribute("POSTLIST", postDTOList);

            request.setAttribute("TITLE", "User Profile");
            request.getRequestDispatcher(profilePage).forward(request, response);
        } catch (Exception e){
            System.out.println("GetUserProfileServlet GET ERROR: " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
