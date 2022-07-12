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
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

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
            } else {
                // Get image
                Part image = null;
                try {
                    image = request.getPart("imageSU");

                    String dateCreate = LocalDate.now().toString();
                    LocalTime time = LocalTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H-m-s-n");
                    String timeCreate = time.format(formatter);

                    // Get file extension
                    String fileExtension = image.getSubmittedFileName().split("\\.")[1];
                    String imageName = dateCreate + "_" + timeCreate + "." + fileExtension;
                    String imagePath = getServletContext().getInitParameter("img-upload") + "\\" + imageName;
                    String imageServletPath = getServletContext().getInitParameter("get-img") + "/" + imageName;

                    image.write(imagePath);

                    userDAO.createNewAccount(username, password, fullname, gender, birthday, location, imageServletPath);
                } catch (Exception e){
                    // Default image
                    userDAO.createNewAccount(username, password, fullname, gender, birthday, location);
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {

        }
    }

}
