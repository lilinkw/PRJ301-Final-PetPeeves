package fud.controller.admin;

import fud.dao.CategoryDAO;
import fud.dao.PostDAO;
import fud.model.CategoryDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteCategoryServlet", value = "/admin/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
    private final String redirectPage = "GetAccountManagementServlet";
    private final String errorPage = "../accessDenied.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String categoryID = request.getParameter("categoryID");
            // UPDATE POST STATUS WITH DELETED CATEGORY ID
            // Default categoryID of post that have Category was deleted
            String defaultCategoryID = "CAT00000001";
            if (categoryID.equals(defaultCategoryID)){
                response.sendRedirect(errorPage);
            } else {
                // Update Posts that have category will be deleted to a new category
                // Default Category. Can not be deleted
                new PostDAO().updatePostCategoryByCategoryID(categoryID, defaultCategoryID);
                // CALL CATEGORYDAO TO DELETE
                new CategoryDAO().deleteCategoryByID(categoryID);
                List<CategoryDTO> categoryDTOList = new CategoryDAO().getCategoryList();
                request.getSession().setAttribute("CATEGORYLIST", categoryDTOList);
                response.sendRedirect(redirectPage);
            }

        } catch (Exception e){
            System.out.println("DeleteCategoryServlet GET ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
