package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "DeletePostServlet", value = "/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {

    private final String forwardPage = "ViewNewsFeedServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            //TODO: Check if User has posts or user is Admin
            String postID = request.getParameter("id");
            PostDAO postDAO = new PostDAO();
            postDAO.deactivatePostByPostID(postID);

            request.getRequestDispatcher(forwardPage).forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


    }
}
