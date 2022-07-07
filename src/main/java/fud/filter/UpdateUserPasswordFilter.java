package fud.filter;

import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "UpdateUserPasswordFilter", urlPatterns = {"/UpdateUserPasswordServlet"})
public class UpdateUserPasswordFilter implements Filter {
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
        String inputNewPassword = request.getParameter("new-password");
        String inputRepeatPassword = request.getParameter("repeat-password");
        if (!inputOldPassword.equals(currentPassword)){
            error = "WRONG PASSWORD";
            request.setAttribute("ERROR", error);
            request.setAttribute("ACTION","Password" );
            request.getRequestDispatcher(forwardPage).forward(request, response);
        } else if (!inputNewPassword.equals(inputRepeatPassword)) {
            error = "NEW PASSWORD AND REPEAT PASSWORD IS UNMATCHED";
            request.setAttribute("ERROR", error);
            request.setAttribute("ACTION","Password" );
            request.getRequestDispatcher(forwardPage).forward(request, response);
        } else {
            chain.doFilter(request, response);
        }

    }
}
