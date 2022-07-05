package fud.controller;

import fud.dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private final String welcomePage = "welcome.jsp";

    private final String homePage = "newsfeed.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to login page
        request.getRequestDispatcher(welcomePage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String url = welcomePage;
            String err = null;

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO user = new UserDAO();

            if (username.trim().isEmpty() || password.trim().isEmpty()) {
                err = "Username or password is empty!";
                request.setAttribute("LOGINERROR", err);
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                url = welcomePage;
            }
            else if (user.checkUser(username, password)) {
                url = homePage;
                System.out.println("Success!");
            }
            else {
                err = "Username or password is not right or user is not existed!";
                request.setAttribute("LOGINERROR", err);
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                url = welcomePage;
                System.out.println("User does not existed!");
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
