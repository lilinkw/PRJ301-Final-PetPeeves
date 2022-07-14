package fud.controller.admin;

import fud.dao.UserDAO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAccountManagementServlet", value = "/admin/GetAccountManagementServlet")
public class GetAccountManagementServlet extends HttpServlet {
    private final String forwardPage = "administration.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<UserDTO> allUser = new UserDAO().getAllUser();
            request.setAttribute("ALLUSER", allUser);

            request.setAttribute("TITLE", "Manage Account");
            request.getRequestDispatcher(forwardPage).forward(request, response);
        } catch (Exception e){
            System.out.println("GetAccountManagementServlet GET ERROR: " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
