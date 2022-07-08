package fud.controller;

import fud.dao.CategoryDAO;
import fud.dao.PostDAO;
import fud.model.CategoryDTO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "SearchCategoryServlet", value = "/SearchCategoryServlet")
public class SearchCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String categoryID = request.getParameter("categoryID");
            PostDAO postDAO = new PostDAO();

            List<PostDTO> postDTOList = postDAO.getPostByCategoryID(categoryID);
            request.setAttribute("POSTLIST", postDTOList);

            // forward to search-category.jsp
            RequestDispatcher rd = request.getRequestDispatcher("search-category.jsp");
            rd.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
}
