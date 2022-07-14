package fud.controller.admin;

import fud.dao.CategoryDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddCategoryServlet", value = "/admin/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {

    private final String forwardPage = "administration.jsp";

    private final String newsFeedServlet = "../ViewNewsFeedServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String category = request.getParameter("category");
            String url = forwardPage;

            CategoryDAO categoryDAO = new CategoryDAO();
            boolean result = categoryDAO.addNewCategory(category);

            //TODO: add method to return when added duplicate category
            if (!result) {
                System.out.println("Error when add new category");
                url = newsFeedServlet;
            }

            //TODO: find way to show information in administration.jsp
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }catch (Exception e){
            System.out.println("AddCategoryServlet POST ERROR: " + e.getMessage());
        }
    }
}
