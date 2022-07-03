package fud.controller;

import fud.dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ProcessServlet", value = "/ProcessServlet")
public class ProcessServlet extends HttpServlet {
    private final String welcomePage = "welcome.jsp";
    private final String homePage = "newsfeed.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request controller request
     * @param response controller response
     * @throws ServletException if a controller-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        try {
            String url = welcomePage;
            String err = null;

            UserDAO user = new UserDAO();
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username.trim().isEmpty() || password.trim().isEmpty()) {
                err = "Username or password is empty!";
                request.setAttribute("LOGINERROR", err);
                url = welcomePage;
            }
            else if (user.checkUser(username, password)) {
                url = homePage;
                System.out.println("Success!");
            }
            else {
                err = "Username or password is not right or user is not existed!";
                request.setAttribute("LOGINERROR", err);
                url = welcomePage;
                System.out.println("User does not existed!");
            }

            request.setAttribute("username", username);
            request.setAttribute("password", password);

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request controller request
     * @param response controller response
     * @throws ServletException if a controller-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcessServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request controller request
     * @param response controller response
     * @throws ServletException if a controller-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcessServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the controller.
     *
     * @return a String containing controller description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
