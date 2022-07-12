package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
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
@WebServlet(name = "EditPostServlet", value = "/EditPostServlet")
public class EditPostServlet extends HttpServlet {

    private final String forwardPage = "post.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String postID = request.getParameter("id");
            PostDAO postDAO = new PostDAO();
            PostDTO postDTO = postDAO.getPostByPostID(postID);

            //TODO: Check if User has posts
//            for (CommentDTO a: postDTO.getCommentList()){
//                System.out.println(a.getCommentContent());
//            }

            request.setAttribute("POSTDTO",postDTO);
            request.getRequestDispatcher(forwardPage).forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            //TODO: Check if User has posts
            String postID = request.getParameter("postID");
            String categoryID = request.getParameter("categoryID");
            String title = request.getParameter("title");
            String content = request.getParameter("description");



            //TODO: modify imglink
            String imgLink = "https://www.charitycomms.org.uk/wp-content/uploads/2019/02/placeholder-image-square.jpg";

            PostDAO postDAO = new PostDAO();
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
                postDAO.updatePostByPostID(postID,title,content,categoryID);
            }
            String url = "EditPostServlet?id=" + postID;
            response.sendRedirect(url);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
