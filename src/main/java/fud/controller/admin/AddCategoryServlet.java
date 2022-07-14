package fud.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddCategoryServlet", value = "/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            // TODO: GET PARAM

            // TODO: CALL CATEGORY DAO TO ADD CATEGORY
        }catch (Exception e){
            System.out.println("AddCategoryServlet POST ERROR: " + e.getMessage());
        }
    }
}
