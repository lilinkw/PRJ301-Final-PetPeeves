package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
@WebServlet(name = "ViewNewsFeedServlet", value = "/ViewNewsFeedServlet")
public class ViewNewsFeedServlet extends HttpServlet {

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
            List<PostDTO> postDTOList = postDAO.getPostByCategoryID(currentUser.getUserID(),categoryID,0);
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


            PostDAO postDAO = new PostDAO();
            // Get image
            Part image = null;
            try {
                image = request.getPart("Image");

                String dateCreate = LocalDate.now().toString();
                LocalTime time = LocalTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H-m-s-n");
                String timeCreate = time.format(formatter);
                // Get file extension
                String fileExtension = image.getSubmittedFileName().split("\\.")[1];
                String imageName = dateCreate + "_" + timeCreate + "." + fileExtension;
                String imagePath = getServletContext().getInitParameter("img-upload") + "\\" + imageName;
                String imageServletPath = getServletContext().getInitParameter("get-img") + "/" + imageName;
                System.out.println(imageServletPath);
                image.write(imagePath);

                postDAO.addNewPost(title,content,authorID,categoryID,imageServletPath);
            } catch (Exception e){
                postDAO.addNewPost(title,content,authorID,categoryID);
            }


            response.sendRedirect("ViewNewsFeedServlet");

//        System.out.println(authorID+"    "+ categoryID+"   "+content);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
