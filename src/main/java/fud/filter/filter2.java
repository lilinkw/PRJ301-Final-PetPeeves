package fud.filter;

import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * UserAction filer
 * This is filter to for User Act on their personal info and post
 */
@WebFilter(filterName = "filter2",
        urlPatterns = {"/UpdateUserPasswordServlet"})
public class filter2 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("UpdateUserPassword Filter");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();


        UserDTO currentUser = (UserDTO) session.getAttribute("CURRENTUSER");
        String currentPassword = currentUser.getPassword();
        String forwardPage = "account-setting.jsp";

        String error;

        String inputOldPassword = request.getParameter("old-password");
        if (!inputOldPassword.equals(currentPassword)){
            error = "Wrong current password. Try again";
            request.setAttribute("OLDPASSWORDERROR", error);
            request.setAttribute("ACTION","Password" );
            request.getRequestDispatcher(forwardPage).forward(request, response);
        } else {
            chain.doFilter(request, response);
        }

    }
}
