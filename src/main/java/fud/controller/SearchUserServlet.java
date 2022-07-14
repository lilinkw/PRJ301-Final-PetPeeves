package fud.controller;

import fud.dao.PostDAO;
import fud.dao.UserDAO;
import fud.model.PostDTO;
import fud.model.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchUserServlet", value = "/SearchUserServlet")
public class SearchUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String search_user = request.getParameter("search-user");
            UserDAO userDAO = new UserDAO();

            List<UserDTO> userDTOList = userDAO.getUsersByName(search_user);
//            for (int i=0; i< userDTOList.size(); i++) {
//                System.out.print(userDTOList.get(i).getUserID());
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).getFullname() + ",");
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).getAvatarLink() + ",");
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).getGender() + ",");
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).getLocation() + ",");
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).isAdmin() + ",");
//                System.out.println();
//
//                System.out.print(userDTOList.get(i).isStatus() + ",");
//                System.out.println();
//            }

            request.setAttribute("USERLIST", userDTOList);
            request.setAttribute("search-user", search_user);

            // forward to search-user.jsp
            request.setAttribute("TITLE", "Search");
            RequestDispatcher rd = request.getRequestDispatcher("search-user.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
