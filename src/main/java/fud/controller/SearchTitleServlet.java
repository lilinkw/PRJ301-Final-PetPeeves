package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchTitleServlet", value = "/SearchTitleServlet")
public class SearchTitleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String search_title = request.getParameter("search-title");
            PostDAO postDAO = new PostDAO();

            List<PostDTO> postDTOList = postDAO.getPostByTitle(search_title);
            request.setAttribute("POSTLIST", postDTOList);
            request.setAttribute("search-title", search_title);

            // forward to search-title.jsp
            request.setAttribute("TITLE", "Search");
            RequestDispatcher rd = request.getRequestDispatcher("search-title.jsp");
            rd.forward(request, response);

        } catch (Exception e) {

        }
    }
}
