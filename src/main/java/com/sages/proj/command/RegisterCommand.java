package com.sages.proj.command;

import com.sages.proj.constants.Constants;
import com.sages.proj.dao.AccountDaoImpl;
import com.sages.proj.entity.Account;
import com.sages.proj.entity.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class RegisterCommand implements Command {
    @Override
    public Map<String, Object> execute(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        request.setAttribute(Constants.MESSAGE,null);
        map.put(Constants.PAGE,Constants.INDEX_JSP);
        try {
            final String login = request.getParameter("login");
            final String password = request.getParameter("password");
            final int zno_score = Integer.valueOf(request.getParameter("zno"));
            final String email = request.getParameter("email");
            AccountDaoImpl accountDao = new AccountDaoImpl();
            if (login != null &&
                    password != null &&
                    email != null &&
                    request.getParameter("zno") != null) {
                Account account = createAccount(login, password, zno_score, email);
               if(accountDao.insertAccount(account)){
                    map.put(Constants.MESSAGE, Constants.REGISTRATION_SUCCESS_MESSAGE);
                }else{
                   map.put(Constants.ERROR_MESSAGE, Constants.REGISTRATION_ERROR_MESSAGE);
                }
            }
        } catch (Exception ex) {
            map.put(Constants.ERROR_MESSAGE, Constants.REGISTRATION_ERROR_MESSAGE);
            return map;
        }
        return map;
    }

    private Account createAccount(String login, String pass, int zno_score, String email) {
        Account account = new Account();
        account.setLogin(login);
        account.setPass(pass);
        account.setZno_score(zno_score);
        account.setEmail(email);
        account.setMind_fuel(3);
        account.setLvl(1);
        account.setRole(Role.USER);
        account.setLocation_id(1);
        return account;
    }
}
