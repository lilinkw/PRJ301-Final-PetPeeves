package fud.controller;

import fud.dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
@MultipartConfig
public class SignUpServlet extends HttpServlet {

    private final String welcomePage = "welcome.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String username = request.getParameter("usernameSU");
            String password = request.getParameter("passwordSU");
            String repeat_password = request.getParameter("repeat-passwordSU");
            String fullname = request.getParameter("fullnameSU");
            String gender = request.getParameter("genderSU");
            String birthday = request.getParameter("birthdaySU");
            String location = request.getParameter("locationSU");

            // TODO: add method get images
            Part part = request.getPart("imageSU");
            String fileName = part.getSubmittedFileName();

            UserDAO userDAO = new UserDAO();

            String url = welcomePage;
            String err = null;

            if (userDAO.isUserExisted(username)) {
                err = "username is existed!";
                request.setAttribute("SIGNUPERROR", err);
                request.setAttribute("usernameSU", username);
                request.setAttribute("passwordSU", password);
                request.setAttribute("repeat_passwordSU", repeat_password);
                request.setAttribute("fullnameSU", fullname);
                request.setAttribute("genderSU", gender);
                request.setAttribute("birthdaySU", birthday);
                request.setAttribute("locationSU", location);

                url = welcomePage;
            } else if ( !password.equals(repeat_password) ) {
                err = "password and re-password is not matched!";
                request.setAttribute("SIGNUPERROR", err);
                request.setAttribute("usernameSU", username);
                request.setAttribute("passwordSU", password);
                request.setAttribute("repeat_passwordSU", repeat_password);
                request.setAttribute("fullnameSU", fullname);
                request.setAttribute("genderSU", gender);
                request.setAttribute("birthdaySU", birthday);
                request.setAttribute("locationSU", location);

                url = welcomePage;
            }

            else {
                userDAO.createNewAccount(username, password, fullname, gender, birthday, location, fileName);

                url = welcomePage;
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                System.out.println("Success!");
            }

            System.out.println(username);
            System.out.println(password);
            System.out.println(repeat_password);
            System.out.println(fullname);
            System.out.println(gender);
            System.out.println(birthday);
            System.out.println(location);
            if (fileName == "") {
                System.out.println("pikachu");
            } else System.out.println(fileName);

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {

        }
    }

}
