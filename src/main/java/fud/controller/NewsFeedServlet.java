package fud.controller;

import fud.dao.CategoryDAO;
import fud.dao.PostDAO;
import fud.model.CategoryDTO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
@WebServlet(name = "NewsFeedServlet", value = "/NewsFeedServlet")
public class NewsFeedServlet extends HttpServlet {

    private final String forwardPage = "newsfeed.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String categoryID = "Following";
            PostDAO postDAO = new PostDAO();
            HttpSession session= request.getSession();

            //get and set post list
            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
            List<PostDTO> postDTOList = postDAO.getPost(currentUser.getUserID(),categoryID,0);
            request.setAttribute("POSTLIST",postDTOList);

            // forward to newsfeed
            request.getRequestDispatcher(forwardPage).forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String categoryID = request.getParameter("categoryID");
            String title = request.getParameter("title");
            String content = request.getParameter("description");

            HttpSession session = request.getSession();
            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
            String authorID = currentUser.getUserID();

            String imgLink = "https://www.charitycomms.org.uk/wp-content/uploads/2019/02/placeholder-image-square.jpg";

            PostDAO postDAO = new PostDAO();
            postDAO.addNewPost(title,content,authorID,categoryID,imgLink);

            response.sendRedirect("NewsFeedServlet");

//        System.out.println(authorID+"    "+ categoryID+"   "+content);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
