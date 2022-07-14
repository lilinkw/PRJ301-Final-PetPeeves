package fud.controller;

import fud.dao.PostDAO;
import fud.model.PostDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
@WebServlet(name = "ViewPostServlet", value = "/ViewPostServlet")
public class ViewPostServlet extends HttpServlet {

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
            request.setAttribute("TITLE", "Post");
            request.getRequestDispatcher(forwardPage).forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
}
