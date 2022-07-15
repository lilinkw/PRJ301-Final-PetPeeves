package fud.controller;

import fud.dao.PostDAO;
import fud.model.CategoryDTO;
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
import java.io.PrintWriter;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
@WebServlet(name = "LoadMoreServlet", value = "/LoadMoreServlet")
public class LoadMoreServlet extends HttpServlet {

    private final String forwardPage = "newsfeed.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String categoryID = "Following";
            PostDAO postDAO = new PostDAO();
            HttpSession session= request.getSession();

            String postnum =  request.getParameter("postShowed");
            int ipostnum = Integer.parseInt(postnum);

            UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
            List<PostDTO> postDTOList = postDAO.getPostByCategoryID(currentUser.getUserID(),categoryID,ipostnum);
            List<CategoryDTO> categoryList = (List<CategoryDTO>) session.getAttribute("CATEGORYLIST");

            PrintWriter out = response.getWriter();


            for (PostDTO postDTO: postDTOList) {
                out.println("<div class=\"posty\">\n" +
                        "                                                <div class=\"post-bar no-margin\">\n" +
                        "                                                    <div class=\"post_topbar\">\n" +
                        "                                                        <div class=\"usy-dt\">\n" +
                        "                                                            <img style=\"width: 50px; height: 50px\" src=\""+postDTO.getAuthorAvatarLink()+"\" alt=\"\">\n" +
                        "                                                            <div class=\"usy-name\">\n" +
                        "                                                                <a href=\"GetUserProfileServlet?userID="+postDTO.getAuthorID()+"\"><h3>"+postDTO.getAuthorName()+"</h3></a>\n" +
                        "                                                                <span><img src=\"static/images/clock.png\" alt=\"\">\n" +
                        "                                                                    <a class=\"postTime\" href=\"ViewPostServlet?id="+postDTO.getPostID()+"\" style=\"color: #b2b2b2\">"+postDTO.getPostTime()+"</a>\n" +
                        "                                                                </span>\n" +
                        "                                                            </div>\n" +
                        "                                                        </div>\n" +
                        "                                                        <div class=\"ed-opts\">\n");
                if (postDTO.getAuthorID().equals(currentUser.getUserID())||currentUser.isAdmin()){
                    out.println("                                                                <a href=\"#\" title=\"\" class=\"ed-opts-open\"><i\n" +
                            "                                                                        class=\"la la-ellipsis-v\"></i></a>\n" +
                            "\n" +
                            "\n" +
                            "                                                                <ul class=\"ed-options\">\n");
                    if(postDTO.getAuthorID().equals(currentUser.getUserID())){
                        out.println("                                                                            <li><a href=\"#\" title=\"\" id=\""+postDTO.getPostID()+"\" class=\"edit-post post_project\" >Edit Post</a></li>\n");
                    }
                    out.println("                                                                    <li><a href=\"DeletePostServlet?id="+postDTO.getPostID()+"\" title=\"\">Delete post</a></li>\n" +
                            "                                                                </ul>\n");
                }
                out.println("                                                        </div>\n" +
                        "                                                    </div>\n" +
                        "                                                    <div class=\"epi-sec\">\n" +
                        "                                                        <ul class=\"bk-links\">\n" +
                        "                                                        </ul>\n" +
                        "                                                    </div>\n" +
                        "                                                    <div class=\"job_descp\">\n" +
                        "                                                        <h3 style=\"margin-top: 10px\">"+postDTO.getPostTitle()+"</h3>\n" +
                        "\n" +
                        "                                                        <ul class=\"job-dt\">\n" +
                        "                                                            <li><a href=\"SearchCategoryServlet?categoryID="+postDTO.getCategoryID()+"\" title=\"\">"+postDTO.getCategory()+"</a></li>\n" +
                        "                                                        </ul>\n" +
                        "                                                        <p>"+postDTO.getPostContent()+"</p>\n");
                if(!postDTO.getImageLinks().isEmpty()){
                    out.println("                                                            <img style=\" width: 100%\" src=\""+postDTO.getImageLinks().get(0)+"\" alt=\"\">\n");
                }
                out.println("\n" +
                        "\n" +
                        "                                                    </div>\n" +
                        "                                                    <div class=\"job-status-bar\">\n" +
                        "                                                        <ul class=\"like-com\">\n" +
                        "                                                            <li>\n" +
                        "                                                                <a href=\"#\"><i class=\"fas fa-heart\"></i> Like</a>\n" +
                        "                                                                <span>25</span>\n" +
                        "                                                            </li>\n" +
                        "                                                            <li><a href=\"ViewPostServlet?id="+postDTO.getPostID()+"\" class=\"com\"><i class=\"fas fa-comment-alt\"></i>\n" +
                        "                                                                Comment</a></li>\n" +
                        "                                                        </ul>\n" +
                        "                                                    </div>\n" +
                        "                                                </div>\n" +
                        "                                            </div>\n" +
                        "\n" +
                        "                                            <div class=\"edit-post post-popup pst-pj "+postDTO.getPostID()+"\">\n" +
                        "                                                <div class=\"post-project\">\n" +
                        "                                                    <h3>Edit post</h3>\n" +
                        "                                                    <div class=\"post-project-fields\">\n" +
                        "                                                        <form action=\"UpdatePostServlet\" method=\"post\" enctype=\"multipart/form-data\">\n" +
                        "                                                            <div class=\"row\">\n" +
                        "                                                                <div class=\"col-lg-12\">\n" +
                        "                                                                    <div class=\"inp-field\">\n" +
                        "                                                                        <input name=\"postID\" hidden=\"\" value=\""+postDTO.getPostID()+"\">\n" +
                        "\n" +
                        "                                                                        <select name=\"categoryID\">\n");
                for (CategoryDTO categoryDTO: categoryList) {
                    if(categoryDTO.getCategoryID().equals(postDTO.getCategoryID())){
                        out.println("                                                                                <option value=\""+categoryDTO.getCategoryID()+ " selected>"+categoryDTO.getCategory()+"</option>\n" );
                    }else {
                        out.println("                                                                                <option value=\""+categoryDTO.getCategoryID()+">"+categoryDTO.getCategory()+"</option>\n" );
                    }


                }
                out.println("                                                                        </select>\n" +
                        "                                                                    </div>\n" +
                        "                                                                </div>\n" +
                        "                                                                <div class=\"col-lg-12\">\n" +
                        "                                                                    <input name=\"title\" placeholder=\"Title\" value=\""+postDTO.getPostTitle()+"\"/>\n" +
                        "                                                                </div>\n" +
                        "                                                                <div class=\"col-lg-12\">\n" +
                        "                                                                    <textarea name=\"description\" placeholder=\"What's on your mind?\">"+postDTO.getPostContent()+"</textarea>\n" +
                        "                                                                </div>\n" +
                        "                                                                <div class=\"col-lg-12\">\n" +
                        "                                                                        <img id=\"img-editfile-"+postDTO.getPostID()+"\" style=\" width: 30%\" src=\"\" alt=\"\">\n" +
                        "\n" +
                        "                                                                    <ul>\n" +
                        "                                                                        <li><button class=\"active\" type=\"submit\" value=\"update\">Update</button></li>\n" +
                        "                                                                        <li style=\"margin-bottom: -15px\">\n" +
                        "                                                                            <input name=\"Image\" type=\"file\" onchange=\"loadFileEdit(event,this.id)\" id=\"editfile-"+postDTO.getPostID()+"\" style=\"height: 0;overflow: hidden;width: 0;float: left; padding: 0px; margin-bottom: 0px\"/>\n" +
                        "                                                                            <label for=\"editfile-"+postDTO.getPostID()+"\" style=\"background: #fff; border: 2px solid #e44d3a;border-radius: 3px; color: #e44d3a; cursor: pointer; display: inline-block;font-size: 15px; font-weight: 600; outline: none; padding: 10px 20px;position: relative; transition: all 0.3s; vertical-align: middle; margin: 0;float: right; text-transform: uppercase;\">\n" +
                        "                                                                                Change images\n" +
                        "                                                                            </label>\n" +
                        "                                                                        </li>\n" +
                        "                                                                    </ul>\n" +
                        "                                                                </div>\n" +
                        "                                                            </div>\n" +
                        "                                                        </form>\n" +
                        "                                                    </div>\n" +
                        "                                                    <a href=\"#\" title=\"\"><i class=\"la la-times-circle-o\"></i></a>\n" +
                        "                                                </div>\n" +
                        "                                            </div>"+
                        "                                          </div>");


            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
}
