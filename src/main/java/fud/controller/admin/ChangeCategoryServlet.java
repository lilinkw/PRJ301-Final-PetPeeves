package fud.controller.admin;

import fud.dao.CategoryDAO;
import fud.dao.UserDAO;
import fud.model.CategoryDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChangeCategoryServlet", value = "/admin/ChangeCategoryServlet")
public class ChangeCategoryServlet extends HttpServlet {

    private final String forwardPage = "GetAccountManagementServlet";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String categoryID = request.getParameter("categoryID");
        String category = request.getParameter("category");

        System.out.println(categoryID);
        System.out.println(category);

        String url = forwardPage;

        try{
            new CategoryDAO().changeCategory(categoryID, category);

            List<CategoryDTO> categoryDTOList = new CategoryDAO().getCategoryList();
            request.getSession().setAttribute("CATEGORYLIST", categoryDTOList);
        }catch (Exception e){
            System.out.println("AddCategoryServlet POST ERROR: " + e.getMessage());
        }

        response.sendRedirect(url);
    }
}
