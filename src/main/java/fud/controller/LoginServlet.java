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

    private final String homePage = "NewsFeedServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session= request.getSession();

            //get and set category list
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> categoryDTOList = categoryDAO.getCategoryList();
            session.setAttribute("CATEGORYLIST",categoryDTOList);

            // Forward to login page
            request.getRequestDispatcher(welcomePage).forward(request, response);
        } catch (Exception e) {
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


            if (username.trim().isEmpty() || password.trim().isEmpty()) {
                err = "Username or password is empty!";
                request.setAttribute("LOGINERROR", err);
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                url = welcomePage;
            }
            else if (user.checkUser(username, password)) {
                UserDTO account = user.login(username, password);

                if (!account.isStatus()) {
                    err = "User has banned from this server!";
                    request.setAttribute("LOGINERROR", err);
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);

                    url = welcomePage;
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("CURRENTUSER", account);
                    url = homePage;
                    response.sendRedirect(url);
                }
            }
            else {
                err = "Username/password is not right or user is not existed!";
                request.setAttribute("LOGINERROR", err);
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                url = welcomePage;
                System.out.println("User does not existed!");
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
