package fud.filter;

import fud.model.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * AdminFilter
 * This Filter is for Admin page. Only admins can request to the pages
 */
@WebFilter(filterName = "filter3", urlPatterns = {"/admin/*"})
public class filter3 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
        boolean admin = true;

        // If user logged in
        boolean isAdmin = (session != null && ((UserDTO) session.getAttribute("CURRENTUSER")).isAdmin() == admin);

        if (session == null){
            System.out.println("session is null");
        }

        if (isAdmin) {
            System.out.println("Is Admin. Have Permission");
            chain.doFilter(request, response);
        } else {
            System.out.println("Not Admin. Do not have Permission");
            ((HttpServletResponse) response).sendRedirect("/PetPeeves_war_exploded/accessDenied.jsp");
        }
    }
}
