package fud.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteCategoryServlet", value = "/admin/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String categoryID = request.getParameter("categoryID");
            // TODO: CALL CATEGORYDAO TO DELETE

            // TODO: UPDATE POST STATUS WITH DELETED CATEGORY ID
        } catch (Exception e){
            System.out.println("DeleteCategoryServlet GET ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
