package fud.controller;

import fud.dao.CategoryDAO;
import fud.dao.UserDAO;
import fud.model.CategoryDTO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private final String welcomePage = "welcome.jsp";

    private final String homeServlet = "ViewNewsFeedServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("LoginServlet GET");
            HttpSession session= request.getSession();

            //get and set category list
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> categoryDTOList = categoryDAO.getCategoryList();
            session.setAttribute("CATEGORYLIST",categoryDTOList);

            // Forward to login page
            request.getRequestDispatcher(welcomePage).forward(request, response);
        } catch (Exception e) {
            System.out.println("LoginServlet Get error: " + e.getMessage() );
        }
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
            UserDTO account = user.login(username, password);

            if (account == null) {
                err = "Username/Password is not right!";
                request.setAttribute("LOGINERROR", err);
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                url = welcomePage;
                request.setAttribute("TITLE", "Login");
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                if (!account.isStatus()) {
                    err = "User has been banned from this server!";
                    request.setAttribute("LOGINERROR", err);
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);

                    url = welcomePage;
                    request.setAttribute("TITLE", "Login");
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("CURRENTUSER", account);

                    url = homeServlet;
                    response.sendRedirect(url);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
