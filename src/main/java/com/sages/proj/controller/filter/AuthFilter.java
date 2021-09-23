package com.sages.proj.controller.filter;

import com.sages.proj.constants.Constants;
import com.sages.proj.entity.Account;
import com.sages.proj.entity.Role;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        final HttpServletRequest request = (HttpServletRequest) servletRequest;
        final HttpServletResponse response = (HttpServletResponse) servletResponse;
        final HttpSession session = request.getSession(false);

        if(session.getAttribute("loggedIn")!=null){
            Account account = (Account) request.getSession().getAttribute("user");
            String[] uri = request.getRequestURI().split("/");
            if(checkRoleToPage(account.getRole(),uri[uri.length-1])){
                return;
            }
        }
        response.sendRedirect(Constants.LOGIN_JSP);
    }
   private boolean checkRoleToPage(Role role,String page){
        return (page.contains(role.toString().toLowerCase()));
   }


    @Override
    public void destroy() {

    }


}
