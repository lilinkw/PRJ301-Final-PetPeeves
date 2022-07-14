package fud.controller.admin;

import fud.dao.CategoryDAO;
import fud.model.CategoryDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCategoryServlet", value = "/admin/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {

    private final String forwardPage = "GetAccountManagementServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String category = request.getParameter("category");
        String url = forwardPage;

        try{
            CategoryDAO categoryDAO = new CategoryDAO();
            CategoryDTO categoryDTO = categoryDAO.addNewCategory(category);

            List<CategoryDTO> categoryDTOList = (List<CategoryDTO>) request.getSession().getAttribute("CATEGORYLIST");
            categoryDTOList.add(categoryDTO);
        }catch (Exception e){
            System.out.println("AddCategoryServlet POST ERROR: " + e.getMessage());
        }

        response.sendRedirect(url);
    }
}
