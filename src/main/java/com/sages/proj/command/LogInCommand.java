package com.sages.proj.command;

import com.sages.proj.constants.Constants;
import com.sages.proj.dao.AccountDaoImpl;
import com.sages.proj.entity.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class LogInCommand implements Command{
    @Override
    public Map<String, Object> execute(HttpServletRequest request, HttpServletResponse response)  {
        final String login = request.getParameter("login");
        final String password = request.getParameter("password");
        AccountDaoImpl accountDao = new AccountDaoImpl();
        Account account;
        Map<String,Object> map = new HashMap<>();
        if(accountDao.userExists(login,password)){
            account = accountDao.getAccountByLogin(login);
            map = initSession(request,account);
        }else{
            map.put(Constants.PAGE,Constants.LOGIN_JSP);
        }
        return map;
    }

    private Map<String,Object> initSession(HttpServletRequest request,Account acc){
        Map <String,Object> map = new HashMap<>();
      //  final String role = acc.getRole().toString().toLowerCase();
        map.put(Constants.PAGE,Constants.INDEX_JSP);
        HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(-1);
        session.setAttribute(Constants.USER,acc);
        request.getSession().setAttribute("role",acc.getRole());
        request.getSession().setAttribute("loggedIn",true);
        return map;
    }
}
