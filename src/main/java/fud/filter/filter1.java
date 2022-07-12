package fud.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * UserLoginFilter
 * This is Filter for Login User required
 */
@WebFilter(filterName = "filter1",
            urlPatterns = {"/UpdateUserPasswordServlet","/AddCommentServlet", "/DeletePostServlet",
                    "/EditPostServlet", "/GetUserProfileServlet", "/SearchCategoryServlet",
                    "/SearchTitleServlet", "/SearchUserServlet", "/UpdateUserInfoServlet",
                    "/ViewNewsFeedServlet"})
public class filter1 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();


        // If user logged in
        boolean isLoggedIn = (session != null && session.getAttribute("CURRENTUSER") != null);

        if (session == null){
            System.out.println("session is null");
        }

        if (isLoggedIn) {
            System.out.println("Logged in");
            chain.doFilter(request, response);
        } else {
            System.out.println("Not Logged in");
            ((HttpServletResponse) response).sendRedirect("LoginServlet");
        }
    }
}
