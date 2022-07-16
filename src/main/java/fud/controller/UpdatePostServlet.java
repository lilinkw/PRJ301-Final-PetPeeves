package fud.controller;

import fud.dao.PostDAO;
import fud.model.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
@WebServlet(name = "UpdatePostServlet", value = "/UpdatePostServlet")
public class UpdatePostServlet extends HttpServlet {

    private final String forwardPage = "post.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String postID = request.getParameter("postID");

//            Check if User has posts
            PostDAO postDAO = new PostDAO();
            String authorID = postDAO.getAuthorByPostID(postID);
            HttpSession session = request.getSession();
            UserDTO currentUser= (UserDTO) session.getAttribute("CURRENTUSER");
            if(!authorID.equals(currentUser.getUserID())){
                response.sendRedirect("accessDenied.jsp");
            }else {
                String categoryID = request.getParameter("categoryID");
                String title = request.getParameter("title");
                String content = request.getParameter("description");

                System.out.println(categoryID);


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

                    postDAO.updatePostByPostID(postID,title,content,categoryID,imageServletPath);
                } catch (Exception e){
                    System.out.println(e.getMessage());
                    postDAO.updatePostByPostID(postID,title,content,categoryID);
                }
                String url = "ViewPostServlet?id=" + postID;
                response.sendRedirect(url);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
