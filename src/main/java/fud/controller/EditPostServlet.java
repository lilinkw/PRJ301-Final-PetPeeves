package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
            String postID = request.getParameter("postID");
            String categoryID = request.getParameter("categoryID");
            String title = request.getParameter("title");
            String content = request.getParameter("description");



            //TODO: modify imglink
            String imgLink = "https://www.charitycomms.org.uk/wp-content/uploads/2019/02/placeholder-image-square.jpg";

            PostDAO postDAO = new PostDAO();
            if(imgLink == null){
                postDAO.updatePostByPostID(postID,title,content,categoryID);
            }else {
                postDAO.updatePostByPostID(postID,title,content,categoryID,imgLink);
            }
            String url = "EditPostServlet?id=" + postID;
            response.sendRedirect(url);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
