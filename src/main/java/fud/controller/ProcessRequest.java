package fud.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProcessRequest", value = "/ProcessRequest")
public class ProcessRequest extends HttpServlet {
    // Change redirect page here
    public String homePage="template/index.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ProcessRequest");
        request.getRequestDispatcher(homePage).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
