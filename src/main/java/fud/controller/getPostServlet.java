package fud.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "getPostServlet", value = "/getPostServlet")
public class getPostServlet extends HttpServlet {

    private final String forwardPage = "newsfeed.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // forward to newsfeed
        request.getRequestDispatcher(forwardPage).forward(request, response);
        // TODO: call DAO to get post by category
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: call DTO & DAO to create new a post
    }
}
